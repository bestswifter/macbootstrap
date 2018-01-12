#!bin/bash
if [[ -e ~/.macbootstrap ]]; then
  rm -rf ~/.macbootstrap
fi

git clone https://github.com/bestswifter/macbootstrap.git ~/.macbootstrap
cd ~/.macbootstrap
bash install.sh
