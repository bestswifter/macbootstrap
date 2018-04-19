source basic.sh

# Homebrew
# ---------------
brew cask install sogouinput
sogou_base="/usr/local/Caskroom/sogouinput"
sogou_version="$sogou_base/"`ls "$sogou_base"`
sogou_app="$sogou_version/"`ls $sogou_version | grep .app | tail -n 1`
open "$sogou_app"

# Extension for preview
brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json qlimagesize webpquicklook suspicious-package qlvideo provisionql quicklookapk

# Zip tool
brew cask install the-unarchiver

# Install applications
# ---------------

# Install Charles
if [[ -e /Applications/Charles.app ]]; then
    echo "You have installed Charles"
else
    if [[ ! -e $HOME/Downloads/Charles.app.zip ]]; then
        curl "http://p2w4johvr.bkt.clouddn.com/Charles.app.zip" -o ~/Downloads/Charles.app.zip
    fi

    unzip -q $HOME/Downloads/Charles.app.zip -d /Applications
    rm $HOME/Downloads/Charles.app.zip
fi

# Install Dash
if [[ -e /Applications/Dash.app ]]; then
    echo "You have installed Dash"
else
    if [[ ! -e $HOME/Downloads/Dash.app.zip ]]; then
        curl "http://p2w4johvr.bkt.clouddn.com/Dash.app.zip" -o ~/Downloads/Dash.app.zip
    fi

    unzip -q $HOME/Downloads/Dash.app.zip -d /Applications
    rm $HOME/Downloads/Dash.app.zip
fi

# Install Alfred
if [[ -e "/Applications/Alfred 3.app" ]]; then
    echo "You have installed Alfred"
else
    if [[ ! -e $HOME/Downloads/Alfred.app.zip ]]; then
        curl "http://p2w4johvr.bkt.clouddn.com/Alfred%203.app.zip" -o "$HOME/Downloads/Alfred 3.app.zip"
    fi

    if [[ ! -e "$HOME/Library/Application Support/Alfred 3" ]]; then
        mkdir -p "$HOME/Library/Application Support/Alfred 3"
    fi

    # patch alfred
    unzip -q "$HOME/Downloads/Alfred 3.app.zip" -d /Applications
    sudo codesign -f -d -s - "/Applications/Alfred 3.app/Contents/Frameworks/Alfred Framework.framework/Versions/A/Alfred Framework"
    cp tools/alfred.license.plist "$HOME/Library/Application Support/Alfred 3/license.plist"
    rm "$HOME/Downloads/Alfred 3.app.zip"

    # sync configuration
    rm -rf "$HOME/Library/Application Support/Alfred 3/Alfred.alfredpreferences"
    curl http://p2w4johvr.bkt.clouddn.com/Alfred.alfredpreferences.zip -o "$HOME/Downloads/Alfred.alfredpreferences.zip"
    unzip -q "$HOME/Downloads/Alfred.alfredpreferences.zip" -d "$HOME/Library/Application Support/Alfred 3"
    rm "$HOME/Downloads/Alfred.alfredpreferences.zip"
fi

##################################################
#                                                #
#                                                #
#               Install Proxifier                #
#                                                #
#                                                #
##################################################
brew cask install proxifier
open /Applications/Proxifier.app

defaults write com.initex.proxifier.macosx.plist LicenseOwner -string "bestswifter"
defaults write com.initex.proxifier.macosx.plist LicenseKey -string "P427L-9Y552-5433E-8DSR3-58Z68"
bs_cp config/bs_aotu_fq.ppx "$HOME/Library/Application Support/Proxifier/Profiles/"

# Powerline-font
# ---------------
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd ..
rm -rf fonts

# Python
# ---------------
pip3 install --trusted-host pypi.python.org neovim jedi ipython
pip3 install --user --upgrade --trusted-host pypi.python.org PyYAML

# Gem update
sudo gem update --system
sudo gem install -n /usr/local/bin cocoapods
sudo gem install -n /usr/local/bin cocoapods-plugins
sudo gem install colored

# npm install
nvm install 9.11.1
./node_global.sh

# hook login
./hook_login.sh