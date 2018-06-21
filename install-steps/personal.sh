username='bestswifter'

# Write script you want to use in the `if` block
if [[ "$username" == $(whoami) ]]; then
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
    shred --remove "$GPG_KEY"
    git config --global user.signingkey 368B0D29D38D4B4EEE5BF51EB2468CF4358BF1CF
    git config --global commit.gpgsign true

    # Install MindNode
    if [[ -e /Applications/MindNode\ 2.app ]]; then
        echo "You have installed MindNode"
    else
        if [[ ! -e $HOME/Downloads/MindNode.app.zip ]]; then
            curl "http://app.bestswifter.com/MindNode501.app.zip" -o ~/Downloads/MindNode.app.zip
        fi

        echo "Install mindnode"
        unzip -q $HOME/Downloads/MindNode.app.zip -d /Applications/MindNode\ 2.app
        rm $HOME/Downloads/MindNode.app.zip
    fi
fi
