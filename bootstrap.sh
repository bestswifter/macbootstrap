#!bin/bash
if [[ -e ~/.macbootstrap ]]; then
  rm -rf ~/.macbootstrap
fi

if [[ ! -e /usr/local/bin/brew ]]; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
    echo "You have installed brew"
fi

brew install git

git clone https://github.com/bestswifter/macbootstrap.git ~/.macbootstrap
cd ~/.macbootstrap
bash install.sh
