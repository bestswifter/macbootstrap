function bszip() {
    filename=`bsfilename "$1"`
    zip -r -q $filename $1
}
