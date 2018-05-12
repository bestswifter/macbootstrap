rm -rf ~/.macbootstrap/
rm -rf /Applications/MacVim.app/
rm -rf /Applications/Snap.app/
rm -f /usr/local/bin/gvim

brew cask uninstall iterm2
brew cask uninstall sourcetree
brew cask uninstall google-chrome
brew cask uninstall coderunner
brew cask uninstall the-unarchiver
brew cask uninstall visual-studio-code
brew uninstall wget
brew uninstall gnu-sed
brew uninstall autojump
brew uninstall cmake
brew uninstall nvm
brew uninstall ctags
brew uninstall gawk
brew uninstall coreutils
brew uninstall exiv2
brew uninstall ssh-copy-id
brew uninstall imagemagick
brew uninstall catimg
brew uninstall redis
brew uninstall gpg
brew uninstall icdiff
brew uninstall scmpuff
brew uninstall fzf
brew uninstall exiftool

# npm clean
npm uninstall -g gnomon
npm uninstall -g vue-cli
npm uninstall -g eslint-plugin-html
npm uninstall -g sequelize-auto
npm uninstall -g bash-language-server

rm -f ~/.zshrc
rm -f ~/.vimrc
rm -f ~/.gitconfig
rm -f ~/.ssh/config
rm -rf ~/.vim
rm -rf ~/.oh-my-zsh
