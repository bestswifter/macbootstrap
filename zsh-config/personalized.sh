# Find file using regex
function bsfn () {
    # Use -or to support multi types
    find . \( -type f -or -type l \) | egrep --color=always $1
}

# Make ctags in current directory
function bsctags() {
    `brew --prefix`/bin/ctags --exclude='.git' -R . &> /dev/null
}
