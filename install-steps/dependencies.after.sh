source basic.sh

# Homebrew
# ---------------
brew install --cask sogouinput
sogou_base="/usr/local/Caskroom/sogouinput"
sogou_version="$sogou_base/"$(ls "$sogou_base")
sogou_app="$sogou_version/"$(ls $sogou_version | grep .app | tail -n 1)
open "$sogou_app"

# Extension for preview
brew install --cask qlcolorcode qlstephen qlmarkdown quicklook-json webpquicklook provisionql quicklookapk
brew install --cask --appdir='/usr/local/bin' qlimagesize qlvideo # Avoid password

# Zip tool
brew install --cask the-unarchiver

# Install applications
# ---------------

# Install Charles
if [[ -e /Applications/Charles.app ]]; then
    echo "You have installed Charles"
else
    if [[ ! -e $HOME/Downloads/Charles.app.zip ]]; then
        curl "http://app.bestswifter.com/Charles.app.zip" -o ~/Downloads/Charles.app.zip
    fi

    unzip -q $HOME/Downloads/Charles.app.zip -d /Applications
    xattr -d com.apple.quarantine /Applications/Charles.app
    rm $HOME/Downloads/Charles.app.zip
fi

# Install Dash
if [[ -e /Applications/Dash.app ]]; then
    echo "You have installed Dash"
else
    if [[ ! -e $HOME/Downloads/Dash.app.zip ]]; then
        curl "http://app.bestswifter.com/Dash.2019.12.app.zip" -o ~/Downloads/Dash.app.zip
    fi

    unzip -q $HOME/Downloads/Dash.app.zip -d /Applications
    rm $HOME/Downloads/Dash.app.zip
fi

# Install Alfred
if [[ -e "/Applications/Alfred 4/.app" ]]; then
    echo "You have installed Alfred"
else
    if [[ ! -e "$HOME/Library/Application Support/Alfred" ]]; then
        mkdir -p "$HOME/Library/Application Support/Alfred"
    fi

    if [[ ! -e $HOME/Downloads/Alfred.app.zip ]]; then
        curl "http://app.bestswifter.com/Alfred4.0.7.app.zip" -o ~/Downloads/Alfred.app.zip
    fi
    unzip -q $HOME/Downloads/Alfred.app.zip -d /Applications
fi

# Install iStatMenus
if [[ -e "/Applications/iStat Menus.app" ]]; then
    echo "You have installed iStat Menus"
else
    curl "http://app.bestswifter.com/iStatMenus.app.zip" -o ~/Downloads/iStatMenus.app.zip
    unzip -q $HOME/Downloads/iStatMenus.app.zip -d /Applications
    cp $HOME/.macbootstrap/config/com.bjango.istatmenus.plist ~/Library/Preferences/
    rm ~/Library/Preferences/com.bjango.istatmenus6.extras.plist
    ln -s $HOME/.macbootstrap/config/com.bjango.istatmenus6.extras.plist ~/Library/Preferences/
    rm $HOME/Downloads/iStatMenus.app.zip
fi

# Install CleanMyMac X
# if [[ -e "/Applications/CleanMyMac X.app" ]]; then
#     echo "You have installed CleanMyMac X"
# else
#     curl "http://app.bestswifter.com/CleanMyMacX.zip" -o $HOME/Downloads/CleanMyMacX.app.zip
#     unzip -q $HOME/Downloads/CleanMyMacX.app.zip -d /Applications
#     rm $HOME/Downloads/CleanMyMacX.app.zip
# fi

# Powerline-font
# ---------------
git clone --depth=1 https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd ..
rm -rf fonts

# Python
# ---------------
pip3 install --trusted-host pypi.python.org neovim jedi ipython
pip3 install --user --upgrade --trusted-host pypi.python.org PyYAML

# Gem update
sudo gem update --system 2.7.6
sudo gem install -n /usr/local/bin cocoapods
sudo gem install -n /usr/local/bin cocoapods-plugins
sudo gem install colored

# nvm & npm install
if [[ ! -d $HOME/.nvm ]]; then
    mkdir $HOME/.nvm
fi
export NVM_DIR="$HOME/.nvm"
source $(brew --prefix nvm)/nvm.sh
export NVM_NODEJS_ORG_MIRROR=https://npm.taobao.org/mirrors/node
nvm install 13.13.0
./install-steps/node_global.sh

# hook login
./install-steps/hook_login.sh
