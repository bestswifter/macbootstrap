#!/bin/sh
source basic.sh

if [[ ! -e /usr/local/bin/brew ]]; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
    echo “You have installed brew”
fi

if [[ ! -e /Applications/Beyond\ Compare.app ]]; then
    brew cask install beyond-compare
    rm /Applications/Beyond\ Compare.app/Contents/Resources/trial.key
    cp tools/beyond_compare_key /Applications/Beyond\ Compare.app/Contents/Resources/trial.key
else
    echo "You have installed Beyond Compare"
fi

if [[ ! -e /Applications/iTerm.app ]]; then
    brew cask install iterm2
    defaults delete com.googlecode.iterm2
    cp tools/com.googlecode.iterm2.plist $HOME/Library/Preferences
    defaults read -app iTerm
else
    echo "You have installed iTerm2"
fi

if [[ ! -e /Applications/SourceTree.app/ ]]; then
    brew cask install sourcetree
else
    echo "You have installed SourceTree"
fi

if [[ ! -e /Applications/Google\ Chrome.app ]]; then
    brew cask install google-chrome
else
    echo "You have installed chrome"
fi

if [[ ! -e /usr/bin/ctags ]]; then
    brew install ctags --HEAD
else
    echo "You have installed ctags"
fi

if brew ls --versions gnu-sed > /dev/null; then
    echo "You have installed gsed"
else
    brew install gnu-sed
fi

# install MacVim
if [[ ! -e /usr/local/bin/gvim ]]; then
    unzip -q software/MacVim.zip
    mv MacVim.app /Applications/MacVim.app
    ln -s /Applications/MacVim.app/Contents/bin/gvim /usr/local/bin/gvim
    rm -rf __MACOSX
else
    echo "You have installed macvim”"
fi

# install coreutils
if [[ ! -e /usr/local/opt/coreutils ]]; then
    brew install coreutils
    mv /usr/local/opt/coreutils/libexec/gnubin/ls /usr/local/opt/coreutils/libexec/gnubin/gls
else
    echo "You have installed coreutils"
fi

brew install redis
brew_install cmake
brew_install gawk
brew_install autojump
brew_install wget
brew_install node
brew_install exiv2
brew_install ssh-copy-id
brew_install imagemagick
brew_install catimg
brew_install gpg
brew_install icdiff
brew_install scmpuff

# link git config
mv ~/.gitconfig ~/.gitconfig_backup
ln -s ~/.macbootstrap/git-config/.gitconfig ~/.gitconfig

if [[ ! -e ~/.oh-my-zsh ]]; then
    curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
fi

# zshrc setup
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
mv ~/.zshrc ~/.zshrc_backup
ln -s ~/.macbootstrap/zsh-config/.zshrc ~/.zshrc

# vim configuration
git clone https://github.com/bestswifter/.vim.git --recursive ~/.vim
if [[ -e ~/.vimrc ]]; then
    mv ~/.vimrc ~/.vimrc_backup
fi
ln -s ~/.vim/.vimrc ~/.vimrc

# ssh configuration
if [[ -e ~/.ssh/config ]]; then
    mv ~/.ssh/config ~/.ssh/config_backup
fi
ln -s ~/.macbootstrap/zsh-config/ssh_config ~/.ssh/config

# install YCM
cd ~/.vim/bundle/
git clone https://github.com/Valloric/YouCompleteMe.git
cd YouCompleteMe
git submodule update --init --recursive
./install.py --clang-completer --tern-completer

vim -c PluginInstall -c quitall

# System Configuration

# Enable full keyboard access for all controls
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3
killall "Finder" >/dev/null 2>&1

# Gem update
sudo gem update --system
sudo gem install -n /usr/local/bin cocoapods
sudo gem install colored
