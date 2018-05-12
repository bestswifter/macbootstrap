source $HOME/.macbootstrap/basic.sh

CUR_DIR=$HOME/.macbootstrap/vscode
VSCODE_PATH="/Users/""$(whoami)""/Library/Application Support/Code/User"

function link() {
    if [[ -e "$VSCODE_PATH"/$1 ]]; then
        backup_file "$VSCODE_PATH/$1"
    fi
    ln -s "$CUR_DIR"/$1 "$VSCODE_PATH"
}

# Sync config
if [[ ! -d "$VSCODE_PATH" ]]; then
    mkdir -p "$VSCODE_PATH"
fi
link keybindings.json
link locale.json
link settings.json
link vsicons.settings.json
link snippets

# Sync plugin
sh "$CUR_DIR"/sync_pluggin.sh
