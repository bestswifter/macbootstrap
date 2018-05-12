source $BS_ZSH_BASE/basic.sh

SCRIPT=$(readlink -f "$0")
CUR_DIR=$(dirname "$SCRIPT")
VSCODE_PATH="/Users/""$(whoami)""/Library/Application Support/Code/User"

function link() {
    if [[ -e "$VSCODE_PATH"/$1 ]]; then
        backup_file "$VSCODE_PATH/$1"
    fi
    ln -s "$CUR_DIR"/$1 "$VSCODE_PATH"
}

# Sync config
link keybindings.json
link locale.json
link settings.json
link vsicons.settings.json
link snippets

# Sync plugin
sh "$CUR_DIR"/sync_pluggin.sh
