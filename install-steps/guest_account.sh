#!/bin/bash

# Enable the guest account based on OS version.
#
# Based on: https://github.com/nbalonso/Some_scripts/blob/master/Pushing%20Guest%20account/postflight.sh
#
# TODO:
# -	Lion+ does not create a login keychain, which causes some confusing (although
#	non-critical) errors. I am solving this through a test and section in our
#	network home-redirection LaunchAgent until I can solve it here.
#
################################################################################

dscl='/usr/bin/dscl'
security='/usr/bin/security'


function guest_enable {
	# Does guest already exist?
	if [ -f /var/db/dslocal/nodes/Default/users/Guest.plist ]; then
		echo "Guest already created!"
		exit 0
	else
		# Lion+ has a different procedure for enabling the guest account
		if [ "$(sw_vers | grep -o '10\.6')" != "" ]; then
			logger -s "$0: Not implemented"

			exit 0
		fi

		# Lion+ procedure
		if [ "$(sw_vers | grep -o '10\.[7-8]')" != "" ]; then
			logger "$0: Enabling 10.7/10.8 Guest"
			$dscl . -create /Users/Guest
			$dscl . -create /Users/Guest dsAttrTypeNative:_defaultLanguage en
			$dscl . -create /Users/Guest dsAttrTypeNative:_guest true
			$dscl . -create /Users/Guest dsAttrTypeNative:_writers__defaultLanguage Guest
			$dscl . -create /Users/Guest dsAttrTypeNative:_writers__LinkedIdentity Guest
			$dscl . -create /Users/Guest dsAttrTypeNative:_writers__UserCertificate Guest
			$dscl . -create /Users/Guest AuthenticationHint ''
			$dscl . -create /Users/Guest NFSHomeDirectory /Users/Guest

			# Give a little extra time for the password and kerberos to play nicely
			sleep 2
			$dscl . -passwd /Users/Guest ''
			sleep 2

			$dscl . -create /Users/Guest Picture "/System/Library/CoreServices/CoreTypes.bundle/Contents/Resources/UserIcon.icns"
			$dscl . -create /Users/Guest PrimaryGroupID 201
			$dscl . -create /Users/Guest RealName "Guest User"
			$dscl . -create /Users/Guest RecordName Guest
			$dscl . -create /Users/Guest UniqueID 201
			$dscl . -create /Users/Guest UserShell /bin/bash
			$security add-generic-password -a Guest -s com.apple.loginwindow.guest-account -D "application password" /Library/Keychains/System.keychain
			
			# This seems to be technically unnecessary; it controls whether the "Allow 
			# guests to log in to this computer" checkbox is enabled in SysPrefs 
			defaults write /Library/Preferences/com.apple.loginwindow GuestEnabled -bool TRUE

			# Profiles created with PM have these two keys, but they don't seem to do 
			# anything 
			#defaults write /Library/Preferences/com.apple.loginwindow DisableGuestAccount -bool FALSE
			#defaults write /Library/Preferences/com.apple.loginwindow EnableGuestAccount -bool TRUE

			logger -s "$0: Guest created"

			exit 0
		fi
	fi
}


function guest_disable {
	$dscl . -delete /Users/Guest
	$security delete-generic-password -a Guest -s com.apple.loginwindow.guest-account -D "application password" /Library/Keychains/System.keychain

	# Also-do we need this still? (Should un-tick the box)
	defaults write /Library/Preferences/com.apple.loginwindow GuestEnabled -bool FALSE

	# Doesn't have an effect, but here for reference
	#defaults write /Library/Preferences/com.apple.loginwindow DisableGuestAccount -bool TRUE
	#defaults write /Library/Preferences/com.apple.loginwindow EnableGuestAccount -bool FALSE

	logger -s "$0: Guest account disabled"

	exit 0
}


################################################################################

# Handle the arguments

# Make sure we have permission to do this
case $(whoami) in
	'root')
		;;
	*)
		echo "Must be run as root!"
		exit 0
		;;
esac

# Determine what to do
case $1 in 
	'enable'|'true'|'True'|'TRUE')
		logger -s "$0: Enabling the guest account"
		guest_enable
		;;
	'disable'|'false'|'False'|'FALSE')
		logger -s "$0: Disabling the guest account"
		guest_disable
		;;
	*)
		echo "Usage: guest_account enable|disable"
		;;
esac
