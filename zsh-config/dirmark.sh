# thanks to https://github.com/huyng/bashmarks.git
#

DIRECTORIES=~/.DIRECTORIES
touch "$DIRECTORIES"

# load saved DIRECTORIES to memory
function _RESET
{
    export Saved_DIRECTORIES="$(cat "$DIRECTORIES")"
}

function _echo_help
{
    if [ "$1" = "-h" ] || [ "$1" = "-help" ] || [ "$1" = "--help" ] ; then
        cat <<EOF
A - Add the current directory to the marks
G - Go (cd) to the saved directory
P - Open the saved directory
X - Deletes the directory item
EOF
        kill -SIGINT $$
    fi
}

function _bookmark_name_valid
{
    error_message=""
    if [ -z $1 ]; then
        #echo "note:you have added an empty taged directory"
        #for future develop
    elif [ "$1" != "$(echo $1 | sed 's/[^A-Za-z0-9_]//g')" ]; then
        error_message="bookmark name is not valid"
        echo $error_message
    else
        error_message="tag not supported now."
        echo $error_message
    fi
}

_RESET
# |tag|path
function A
{
    _echo_help $1
    _bookmark_name_valid "$@"
    if [ -z "$error_message" ]; then
        CURDIR=$(echo $PWD)
        r=$(echo $Saved_DIRECTORIES | grep -e "^$CURDIR\$")
        if [ ! -z "$r" ] ; then
            echo found $CURDIR
        else
            echo "|$1|$CURDIR" >> "$DIRECTORIES"
            _RESET
        fi
        unset CURDIR
    fi
}

function G
{
    cd "$1"
}

function P
{
    cygstart "$1"
}

function X
{
    echo "delete not implemented $1"
}

# return all diretoires in cached
function _l
{
    echo $Saved_DIRECTORIES | cut -d'|' -f3
}

# ZSH completion command
function _compzsh
{
    reply=("${(@f)$(_l)}")
}

# bind completion command for g,p,d to _comp
if [ $ZSH_VERSION ]; then
    compctl -K _compzsh A
    compctl -K _compzsh G
    compctl -K _compzsh P
    compctl -K _compzsh X
else
    echo the script just support zsh
fi

_3tabs()
{
    zle expand-or-complete
    zle expand-or-complete
    zle expand-or-complete
}

_tab_complete_dirmark()
{
    case $BUFFER in
        "" )
            BUFFER="G "
            zle end-of-line
            _3tabs
            ;;
        "G"|"P"|"X")
            BUFFER="$BUFFER "
            zle end-of-line
            _3tabs
            ;;
        "G "|"P "|"X ")
            _3tabs
            ;;
        * )
            zle expand-or-complete
            ;;
    esac
}
zle -N _tab_complete_dirmark
bindkey "\t" _tab_complete_dirmark