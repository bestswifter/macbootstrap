#!/bin/sh

# install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew cask install iterm2
brew cask install sourcetree
brew install wget

# install MacVim
unzip software/MacVim.zip
mv MacVim.app /Applications/MacVim.app
ln -s /Applications/MacVim.app/Contents/bin/gvim /usr/local/bin/gvim
rm -rf __MACOSX

# link git config
mv ~/.gitconfig ~/.gitconfig_back
ln -s git-config/.gitconfig ~/.gitconfig

curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh

