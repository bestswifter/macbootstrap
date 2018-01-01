# Download youtube video to ~/Movies/Youtube
function y () {
    if [[ ! -e /usr/local/bin/youtube-dl  ]]; then
        brew install youtube-dl
    fi

    youtube-dl -q --proxy socks5://127.0.0.1:14179/ --console-title $1 -f 'best' -o '~/Movies/Youtube/%(title)s.%(ext)s' &
}

# Make ctags in current directory
function objctags() {
    ctags --exclude='.git' --exclude='*.js' \
    --langmap=objc:.m.h \
    --totals=yes \
    --tag-relative=yes \
    --regex-objc='/^[[:space:]]*[-+][[:space:]]*\([[:alpha:]]+[[:space:]]*\*?\)[[:space:]]*([[:alnum:]]+):[[:space:]]*\(/\1/m,method/' \
    --regex-objc='/^[[:space:]]*[-+][[:space:]]*\([[:alpha:]]+[[:space:]]*\*?\)[[:space:]]*([[:alnum:]]+)[[:space:]]*\{/\1/m,method/' \
    --regex-objc='/^[[:space:]]*[-+][[:space:]]*\([[:alpha:]]+[[:space:]]*\*?\)[[:space:]]*([[:alnum:]]+)[[:space:]]*\;/\1/m,method/' \
    --regex-objc='/^[[:space:]]*\@property[[:space:]]+.*[[:space:]]+\*?(.*);$/\1/p,property/' \
    --regex-objc='/^[[:space:]]*\@implementation[[:space:]]+(.*)$/\1/c,class/' \
    --regex-objc='/^[[:space:]]*\@interface[[:space:]]+(.*)[[:space:]]+:.*{/\1/i,interface/' -R .&> /dev/null
}
