function brew_install() {
    quiet=false

    while getopts ":q" opt
    do
        case $opt in
            q)
                quiet=true
                ;;
            ? )
                echo "Unrecognized argument"
                echo "Usage: brew_install -q package_name"
                return 1
                ;;
        esac
    done

    shift "$((OPTIND-1))"
    if [ -z "$1" ]; then
        echo "Usage: brew_install [-q] package_name"
    fi

    if [[ ! -e /usr/local/bin/$1 ]]; then
        if [ "$quiet" = false ]; then
            echo "Installing $1"
        fi
        brew install $1
    else
        if [ "$quiet" = false ]; then
            echo "You have installed $1"
        fi
    fi
}

# Usage: mv $1 to $1_backup
function backup_file() {
    if [ $# != 1 ]; then
        echo "Usage: backup_file pat_to_file"
    fi

    if [[ -e $1 ]]; then
        mv $1 $1"_backup"
    fi
}
