function qnconf () {
    if [ $# != 4 ]; then
        echo "Usage: qnconf ak sk bucket_name prefix"
    fi
    ./qshell account $1 $2
    echo $3 > ./conf
    echo $4 >> ./conf
}

# Show account info
function qnaccount () {
    ./qshell account
    cat ./conf | head -n 1
    cat ./conf | tail -n 1
}

# Save picture to a temp file and upload
function qn() {
    bucket_name=""
    prefix=""
    if [[ -e conf ]]; then
        bucket_name=`cat conf | head -n 1`
        prefix=`cat conf | tail -n 1`
    else
        echo "No conf found"
    fi

    ./pngpaste temp.png
    timestamp=$(date +%s)".png"
    ./qshell fput "$bucket_name" $timestamp ./temp.png 1> /dev/null
    rm temp.png
    echo "Markdown image address: ![](""$prefix""/""$timestamp"") has been copid"
    echo -n "![](""$prefix""/""$timestamp"")" | pbcopy
}
