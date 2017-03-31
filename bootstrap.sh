#!/bin/sh

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew cask install iterm2
brew cask install sourcetree
brew install wget

# install MacVim
unzip software/MacVim.zip
mv MacVim.app /Applications/MacVim.app
ln -s /Applications/MacVim.app/Contents/bin/gvim /usr/local/bin/gvim
rm -rf __MACOSX

curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh

