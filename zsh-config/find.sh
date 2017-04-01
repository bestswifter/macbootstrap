# find file by name
function fn() {
    if [[ "$#" -eq 1 ]]; then
        find . -name "$1"
    elif [[ "$#" -eq 2 ]]; then
        find "$1" -name "$2"
    else
        echo "Useage:fn [DIRECTORY] <pattern>"
    fi
}

# find file by file extension
function fe() {
    if [[ "$#" -eq 1 ]]; then
        find . -name "*.$1"
    elif [[ "$#" -eq 2 ]]; then
        find "$1" -name "*.$2"
    else
        echo "Useage:fe [DIRECTORY] <extension>"
    fi
}

# find & gvim file by file name pattern
function gfe() {
    if [[ "$#" -eq 1 ]]; then
        find . -name "$1"|while read -r file;do (gvimServer "$file");done
    elif [[ "$#" -eq 2 ]]; then
        find "$1" -name "$2"|while read -r file;do (gvimServer "$file");done
    else
        echo "Useage:gfe [DIRECTORY] <pattern>"
    fi
}
