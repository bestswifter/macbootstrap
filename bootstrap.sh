#!/bin/sh

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew cask install iterm2

curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh

