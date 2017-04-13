# Find file using regex
function bsfn () {
    find . -type f -name "*" | egrep --color=always $1
    find . -type l -name "*" | egrep --color=always $1
}
