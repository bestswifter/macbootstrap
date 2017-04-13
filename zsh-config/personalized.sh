# Find file using regex
function bsfn () {
    # Use -or to support multi types
    find . \( -type f -or -type l \) | egrep --color=always $1
}
