if [[ ! -d $HOME/.vscode/extensions ]]; then
    echo "No extensions"
    git clone --depth=1 https://git.coding.net/bestswifter/VSCodeExtension.git $HOME/.vscode/extensions
else
    cd $HOME/.vscode/extensions
    git fetch
    git reset --hard master
fi
