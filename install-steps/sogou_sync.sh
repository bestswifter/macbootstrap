# Sync Sougou Config
cp config/SogouPreferences.plist config/UserPreferences.plist
mv config/UserPreferences.plist "$HOME/Library/Application Support/Sogou/InputMethod/SogouPY/"

cp config/sogouUserSet.plist config/autoEngUserSet.plist
mv config/autoEngUserSet.plist "$HOME/Library/Application Support/Sogou/InputMethod/SogouPY/"

