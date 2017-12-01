function bsof {
    lsof -nP -i TCP | grep "$1"
}
