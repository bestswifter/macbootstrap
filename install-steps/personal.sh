username='bestswifter'

function init_git() {
    # Git config
    git config --global user.name bestswifter
    git config --global user.email ktzhang@bestswifter.com

    if [[ ! -d $HOME/.ssh ]]; then
        mkdir $HOME/.ssh
    fi

    # ssh key
    if [[ ! -f $HOME/.ssh/id_rsa ]]; then
        chmod 400 $HOME/.macbootstrap/config/id_rsa
        ln -s $HOME/.macbootstrap/config/id_rsa $HOME/.ssh/
    fi

    if [[ ! -f $HOME/.ssh/id_rsa.pub ]]; then
        ln -s $HOME/.macbootstrap/config/id_rsa.pub $HOME/.ssh/
    fi

    ssh-add -K $HOME/.ssh/id_rsa

    # GPG_KEY
    GPG_KEY="$HOME/.macbootstrap/git-config/bestswifter.asc"
    gpg --import "$GPG_KEY"
    #shred --remove "$GPG_KEY"
    git config --global user.signingkey 368B0D29D38D4B4EEE5BF51EB2468CF4358BF1CF
    git config --global commit.gpgsign true
}

function install_personal_apps() {
    # install setapp
    brew cask install setapp
    open "$(find /usr/local/Caskroom/setapp/ -name "*.app")"

    # install google drive file stream
    # brew cask install google-drive-file-stream
}

function setup_mysql() {
    brew install mysql@5.6
    brew services start mysql@5.6
    sleep 3 # Wait for mysql to start
    /usr/local/opt/mysql@5.6/bin/mysqladmin -u root password "12345678"
}

function handle_person_profile() {
    # copy histfile
    if [[ -e ~/.histfile ]]; then
        rm ~/.histfile
    fi
    ln -s ~/.macbootstrap/profile/.histfile ~/.histfile

    # sync alfred configuration
    rm -rf "$HOME/Library/Application Support/Alfred"
    curl "http://app.bestswifter.com/Alfred.zip" -o "$HOME/Downloads/Alfred.alfredpreferences.zip"
    unzip -q "$HOME/Downloads/Alfred.alfredpreferences.zip" -d "$HOME/Library/Application Support"
    rm "$HOME/Downloads/Alfred.alfredpreferences.zip"
}

function install_karabiner() {
    brew cask install karabiner-elements
}

# Write script you want to use in the `if` block
if [[ "$username" == $(whoami) ]]; then
    # initialize git
    init_git

    # 一定要在 ssh 身份认证后，再安装 private 仓库
    git submodule init
    git submodule update

    # 处理个人数据
    handle_person_profile

    # install my apps
    install_personal_apps

    # setup mysql 5.6
    setup_mysql

    # 安装 karabiner
    install_karabiner

    # cp ss conf
    ln -s ~/.macbootstrap/tools/netconf ~/.macbootstrap/config/shadowsocks.conf
fi
