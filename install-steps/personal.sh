username='bestswifter'

# Write script you want to use in the `if` block
if [[ "$username" == $(whoami) ]]; then
    # Git config
    git config --global user.name bestswifter
    git config --global user.email ktzhang@bestswifter.com

    if [[ ! -f $HOME/.ssh/id_rsa ]]; then
        ln -s $HOME/.macbootstrap/config/id_rsa $HOME/.ssh/
    fi

    if [[ ! -f $HOME/.ssh/id_rsa.pub ]]; then
        ln -s $HOME/.macbootstrap/config/id_rsa.pub $HOME/.ssh/
    fi

    ssh-add -K $HOME/.ssh/id_rsa
fi
