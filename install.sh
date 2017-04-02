#!/bin/sh

if [[ ! -e /usr/local/bin/brew ]]; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
    echo “You have installed brew”
fi

if [[ ! -e /Applications/iTerm.app ]]; then
    brew cask install iterm2
else
    echo “You have installed iTerm2”
fi

if [[ ! -e /Applications/SourceTree.app/ ]]; then
    brew cask install sourcetree
else
    echo “You have installed SourceTree”
fi

if [[ ! -e /usr/local/bin/wget ]]; then
    brew install wget
else
    echo “You have installed wget”
fi

if [[ ! -e /usr/local/bin/gsed ]]; then
    brew install gnu-sed
else
    echo “You have installed gsed”
fi

if [[ ! -e /usr/local/bin/cmake ]]; then
    brew install cmake
else
    echo "You have installed cmake"
fi

if [[ ! -e /usr/local/bin/autojump ]]; then
    brew install autojump
else
    echo "You have installed autojump"
fi

if [[ ! -e /usr/local/bin/node ]]; then
    brew install node
else
    echo "You have installed node"
fi

# install MacVim
if [[ ! -e /usr/local/bin/gvim ]]; then
    unzip software/MacVim.zip
    mv MacVim.app /Applications/MacVim.app
    ln -s /Applications/MacVim.app/Contents/bin/gvim /usr/local/bin/gvim
    rm -rf __MACOSX
else
    echo “You have installed macvim”
fi

# link git config
mv ~/.gitconfig ~/.gitconfig_backup
ln -s ~/.macbootstrap/git-config/.gitconfig ~/.gitconfig

if [[ ! -e ~/.oh-my-zsh ]]; then
    curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
fi

# link zshrc
mv ~/.zshrc ~/.zshrc_backup
ln -s ~/.macbootstrap/zsh-config/.zshrc ~/.zshrc

# vim configuration
git clone https://github.com/bestswifter/.vim.git --recursive ~/.vim
if [[ -e ~/.vimrc ]]; then
    mv ~/.vimrc ~/.vimrc_backup
fi
ln -s ~/.vim/.vimrc ~/.vimrc

# install YCM
cd ~/.vim/bundle/
git clone https://github.com/Valloric/YouCompleteMe.git
cd YouCompleteMe
git submodule update --init --recursive
./install.py --clang-completer --tern-completer

vim -c PluginInstall
