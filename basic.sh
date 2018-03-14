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

# copy to path and create this path if not exist
function bs_cp() {
    if [ $# != 2 ]; then
        echo "Usage: bs_cp file destination"
    fi

    test -d "$2" || mkdir -p "$2" && cp "$1" "$2"
}

# fanqiang is not necessary in tt network
function not_tt_network() {
    ssid=$(/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I | awk '/ SSID/ {print substr($0, index($0, $2))}')
    if [[ $ssid = *"Bytedance"* ]]; then
        return 1
    else
        return 0
    fi
}
