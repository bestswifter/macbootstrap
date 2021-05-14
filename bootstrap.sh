#!bin/bash
[ -z "${BRANCH}" ] && export BRANCH="deer_main"

if [[ -e ~/.macbootstrap ]]; then
  rm -rf ~/.macbootstrap
fi

if [[ ! -e /usr/local/bin/brew ]]; then
  # chcange source && avoid prompt && quiet install
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh | sed 's/https:\/\/github.com\/Homebrew\/brew/git:\/\/mirrors.ustc.edu.cn\/brew.git/g' | sed 's/https:\/\/github.com\/Homebrew\/homebrew-core/git:\/\/mirrors.ustc.edu.cn\/homebrew-core.git/g' | sed 's/\"fetch\"/\"fetch\", \"-q\"/g')"

  # Change source
  cd "$(brew --repo)"
  git remote set-url origin https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/brew.git

  cd "$(brew --repo)/Library/Taps/homebrew/homebrew-core"
  git remote set-url origin https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-core.git

  export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles
else
  echo "You have installed brew"
fi

brew install git

git clone --depth=1 -b ${BRANCH} https://github.com/Deerdev/macbootstrap.git ~/.macbootstrap
cd ~/.macbootstrap
bash install.sh
