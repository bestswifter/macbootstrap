#!/bin/sh
source basic.sh

sudo ./install-steps/macos.sh

brew install python3

if [[ ! -e /usr/local/bin/sslocal ]]; then
    brew install shadowsocks-libev
    brew services start shadowsocks-libev
    ln -s /usr/local/opt/shadowsocks-libev/bin/ss-local /usr/local/bin/sslocal
    ln -s /usr/local/opt/shadowsocks-libev/bin/ss-server /usr/local/bin/ss-server
else
    echo "You have installed shadowsocks"
fi

# install and use shadowsocks
if not_tt_network; then
    nohup sslocal -c ~/.macbootstrap/tools/netconf &> /private/tmp/nohup.out&
    #export ALL_PROXY=socks5://127.0.0.1:14179
else
    echo "You are in toutiao network, no need to use ss now"
fi

if [[ ! -e /Applications/iTerm.app ]]; then
    brew cask install iterm2
    defaults delete com.googlecode.iterm2
    cp config/com.googlecode.iterm2.plist $HOME/Library/Preferences
    # config background image location
    command="set :New\ Bookmarks:0:Background\ Image\ Location /Users/""$(whoami)""/.macbootstrap/assets/iterm-background.jpg"
    /usr/libexec/PlistBuddy -c "$command" $HOME/Library/Preferences/com.googlecode.iterm2.plist
    defaults read -app iTerm >/dev/null
else
    echo "You have installed iTerm2"
fi

if [[ ! -e /Applications/SourceTree.app ]]; then
    brew cask install sourcetree
else
    echo "You have installed SourceTree"
fi

if [[ ! -e /Applications/WeChat.app ]]; then
    brew cask install wechat
else
    echo "You have installed WeChat"
fi

if [[ ! -e /Applications/Google\ Chrome.app ]]; then
    brew cask install google-chrome

    # Set Chrome as default browser
    git clone https://github.com/kerma/defaultbrowser ./tools/defaultbrowser
    (cd ./tools/defaultbrowser && make && make install)
    defaultbrowser chrome
    [[ -d ./tools/defaultbrowser ]] && rm -rf ./tools/defaultbrowser
else
    echo "You have installed chrome"
fi

if [[ ! -e /Applications/Visual\ Studio\ Code.app ]]; then
    brew cask install visual-studio-code
    sh ./vscode/setup.sh
else
    echo "You have installed vscode"
fi

if brew ls --versions gnu-sed > /dev/null; then
    echo "You have installed gsed"
else
    brew install gnu-sed
fi

# install sz/rz
if brew ls --versions lrzsz > /dev/null; then
    echo "You have installed lrzsz"
else
    brew install lrzsz
fi

# install coreutils
if [[ ! -e /usr/local/opt/coreutils ]]; then
    brew install coreutils
    mv /usr/local/opt/coreutils/libexec/gnubin/ls /usr/local/opt/coreutils/libexec/gnubin/gls
else
    echo "You have installed coreutils"
fi

# install jetbrain toolbox
if [[ ! -e /Applications/JetBrains\ Toolbox.app ]]; then
    brew cask install jetbrains-toolbox
else
    echo "You have installed JetBrains Toolbox"
fi

brew install --HEAD universal-ctags/universal-ctags/universal-ctags
brew install redis
brew_install cmake
brew_install gawk
brew_install autojump
brew_install wget
brew_install nvm
brew_install exiv2
brew_install ssh-copy-id
brew_install imagemagick
brew_install catimg
brew_install gpg
brew_install icdiff
brew_install scmpuff
brew_install fzf
brew_install fd
brew_install the_silver_searcher
brew_install nvim
brew_install exiftool
brew_install archey
brew_install ranger
brew_install git-lfs && git lfs install
$(brew --prefix)/opt/fzf/install --all

# link git config
mv ~/.gitconfig ~/.gitconfig_backup
backup_file ~/.gitattributes
ln -s ~/.macbootstrap/git-config/.gitconfig ~/.gitconfig
ln -s ~/.macbootstrap/git-config/.gitattributes ~/.gitattributes

if [[ ! -e ~/.oh-my-zsh ]]; then
    curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
fi

# zshrc setup
backup_file ~/.zshrc
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
ln -s ~/.macbootstrap/zsh-config/.zshrc ~/.zshrc

# vim configuration
backup_file ~/.vim
backup_file ~/.config/nvim/
git clone https://github.com/bestswifter/vim-config.git ~/.config/nvim
ln -s ~/.config/nvim ~/.vim
backup_file ~/.ideavimrc
ls -s ~/.config/ideavimrc ~/.ideavimrc

# ESLint configuration
backup_file ~/.eslintrc.js
backup_file ~/.eslintrc
ln -s ~/.macbootstrap/.eslintrc.js ~/.eslintrc.js

# Ranger configuration
if [[ ! -e $HEME/.config/ranger ]]; then
    mkdir -p $HOME/.config/ranger
fi
old_commands_py=$HOME/.config/ranger/commands.py
old_rc_conf=$HOME/.config/ranger/rc.conf
backup_file "$old_commands_py"
backup_file "$old_rc_conf"
ln -s ~/.macbootstrap/config/ranger/commands.py "$old_commands_py"
ln -s ~/.macbootstrap/config/ranger/rc.conf "$old_rc_conf"

./install-steps/dependencies.before.sh

unset ALL_PROXY
./install-steps/dependencies.after.sh
./install-steps/sogou_sync.sh

# ssh configuration
backup_file ~/.ssh/config
if [[ ! -e ~/.ssh ]]; then
    mkdir ~/.ssh
fi
ln -s ~/.macbootstrap/zsh-config/ssh_config ~/.ssh/config

# Personal
./install-steps/personal.sh
./personal.sh

