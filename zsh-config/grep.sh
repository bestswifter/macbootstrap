# find & grep by file extension
function xgrep() {
    if [[ "$#" -eq 3 ]]; then
        find "$1" -type f -name "*.$2"|xargs grep -n "$3"
    elif [[ "$#" -eq 2 ]]; then
        find . -type f -name "*.$1"|xargs grep -n "$2"
    else
        echo "Useage:xgrep [DIRECTORY] <file-extension> <pattern>"
    fi
}

