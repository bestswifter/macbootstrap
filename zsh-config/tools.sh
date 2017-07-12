function urldecode() {
    output=$(curl -s https://raw.githubusercontent.com/bestswifter/my-workflow/master/url/urldecode.py | python - $1)
    echo $output
    echo -n $output | pbcopy
}

function urlencode() {
    output=$(curl -s https://raw.githubusercontent.com/bestswifter/my-workflow/master/url/urlencode.py | python - $1)
    echo $output
    echo -n $output | pbcopy
}
