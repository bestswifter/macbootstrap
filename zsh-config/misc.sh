function column() {
    case $# in
        1)
        awk -v c1=$1 '{(c1>0)?v1=c1:v1=1+NF+c1; print $v1}'
        ;;
        2)
        awk -v c1=$1 -v c2=$2 '{print $c1, $c2}'
        ;;
        3)
        awk -v c1=$1 -v c2=$2 -v c3=$3 '{print $c1, $c2, $c3}'
        ;;
        4)
        awk -v c1=$1 -v c2=$2 -v c3=$3 -v c4=$4 '{print $c1, $c2, $c3, $c4}'
        ;;
        5)
        awk -v c1=$1 -v c2=$2 -v c3=$3 -v c4=$4 -v c5=$5 '{print $c1, $c2, $c3, $c4, $c5}'
        ;;
        6)
        awk -v c1=$1 -v c2=$2 -v c3=$3 -v c4=$4 -v c5=$5 -v c6=$6 '{print $c1, $c2, $c3, $c4, $c5, $c6}'
        ;;
        7)
        awk -v c1=$1 -v c2=$2 -v c3=$3 -v c4=$4 -v c5=$5 -v c6=$6 -v c7=$7 '{print $c1, $c2, $c3, $c4, $c5, $c6, $c7}'
        ;;
        8)
        awk -v c1=$1 -v c2=$2 -v c3=$3 -v c4=$4 -v c5=$5 -v c6=$6 -v c7=$7 -v c8=$8 '{print $c1, $c2, $c3, $c4, $c5, $c6, $c7, $c8}'
        ;;
        9)
        awk -v c1=$1 -v c2=$2 -v c3=$3 -v c4=$4 -v c5=$5 -v c6=$6 -v c7=$7 -v c8=$8 -v c9=$9 '{print $c1, $c2, $c3, $c4, $c5, $c6, $c7, $c8, $c9}'
        ;;
        *)
            echo "Usage:col column [column ...]"
        ;;
    esac
}

function ncolumn() {
    case $# in
        1)
            awk -v c1=$1 '{$c1=""; print substr($0,2)}'
        ;;
        2)
            awk -v c1=$1 -v c2=$2 '{$c1=$c2=""; print substr($0,3)}'
        ;;
        3)
            awk -v c1=$1 -v c2=$2 -v c3=$3 '{$c1=$c2=$c3=""; print substr($0,4)}'
        ;;
        4)
            awk -v c1=$1 -v c2=$2 -v c3=$3 -v c4=$4 '{$c1=$c2=$c3=$c4=""; print substr($0,5)}'
        ;;
        5)
            awk -v c1=$1 -v c2=$2 -v c3=$3 -v c4=$4 -v c5=$5 '{$c1=$c2=$c3=$c4=$c5=""; print substr($0,6)}'
        ;;
        6)
            awk -v c1=$1 -v c2=$2 -v c3=$3 -v c4=$4 -v c5=$5 -v c6=$6 '{$c1=$c2=$c3=$c4=$c5=$c6=""; print substr($0,7)}'
        ;;
        7)
            awk -v c1=$1 -v c2=$2 -v c3=$3 -v c4=$4 -v c5=$5 -v c6=$6 -v c7=$7 '{$c1=$c2=$c3=$c4=$c5=$c6=$c7=""; print substr($0,8)}'
        ;;
        8)
            awk -v c1=$1 -v c2=$2 -v c3=$3 -v c4=$4 -v c5=$5 -v c6=$6 -v c7=$7 -v c8=$8 '{$c1=$c2=$c3=$c4=$c5=$c6=$c7=$c8=""; print substr($0,9)}'
        ;;
        9)
            awk -v c1=$1 -v c2=$2 -v c3=$3 -v c4=$4 -v c5=$5 -v c6=$6 -v c7=$7 -v c8=$8 -v c9=$9 '{$c1=$c2=$c3=$c4=$c5=$c6=$c7=$c8=$c9=""; print substr($0,10)}'
        ;;
        *)
            echo "Usage: row [row ...]"
        ;;
    esac
}

function row() {
    case $# in
        1)
            awk -v c1=$1 'NR == c1'
        ;;
        2)
            awk -v c1=$1 -v c2=$2 'NR == c1 || NR == c2'
        ;;
        3)
            awk -v c1=$1 -v c2=$2 -v c3=$3 'NR == c1 || NR == c2 || NR == c3'
        ;;
        4)
            awk -v c1=$1 -v c2=$2 -v c3=$3 -v c4=$4 'NR == c1 || NR == c2 || NR == c3 || NR == c4'
        ;;
        5)
            awk -v c1=$1 -v c2=$2 -v c3=$3 -v c4=$4 -v c5=$5 'NR == c1 || NR == c2 || NR == c3 || NR == c4 || NR == c5'
        ;;
        6)
            awk -v c1=$1 -v c2=$2 -v c3=$3 -v c4=$4 -v c5=$5 -v c6=$6 'NR == c1 || NR == c2 || NR == c3 || NR == c4 || NR == c5 || NR == c6'
        ;;
        7)
            awk -v c1=$1 -v c2=$2 -v c3=$3 -v c4=$4 -v c5=$5 -v c6=$6 -v c7=$7 'NR == c1 || NR == c2 || NR == c3 || NR == c4 || NR == c5 || NR == c6 || NR == c7'
        ;;
        8)
            awk -v c1=$1 -v c2=$2 -v c3=$3 -v c4=$4 -v c5=$5 -v c6=$6 -v c7=$7 -v c8=$8 'NR == c1 || NR == c2 || NR == c3 || NR == c4 || NR == c5 || NR == c6 || NR == c7 || NR == c8'
        ;;
        9)
            awk -v c1=$1 -v c2=$2 -v c3=$3 -v c4=$4 -v c5=$5 -v c6=$6 -v c7=$7 -v c8=$8 -v c9=$9 'NR == c1 || NR == c2 || NR == c3 || NR == c4 || NR == c5 || NR == c6 || NR == c7 || NR == c8 || NR == c9'
        ;;
        *)
            echo "Usage: row [row ...]"
        ;;
    esac
}

function nrow() {
    case $# in
        1)
            sed -e "$1d"
        ;;
        2)
            sed -e "$1d" -e "$2d"
        ;;
        3)
            sed -e "$1d" -e "$2d" -e "$3d"
        ;;
        4)
            sed -e "$1d" -e "$2d" -e "$3d" -e "$4d"
        ;;
        5)
            sed -e "$1d" -e "$2d" -e "$3d" -e "$4d" -e "$5d"
        ;;
        6)
            sed -e "$1d" -e "$2d" -e "$3d" -e "$4d" -e "$5d" -e "$6d"
        ;;
        7)
            sed -e "$1d" -e "$2d" -e "$3d" -e "$4d" -e "$5d" -e "$6d" -e "$7d"
        ;;
        8)
            sed -e "$1d" -e "$2d" -e "$3d" -e "$4d" -e "$5d" -e "$6d" -e "$7d" -e "$8d"
        ;;
        9)
            sed -e "$1d" -e "$2d" -e "$3d" -e "$4d" -e "$5d" -e "$6d" -e "$7d" -e "$8d" -e "$9d"
        ;;
        *)
            echo "Usage: nrow [nrow ...]"
        ;;
    esac
}

function add() {
    case $# in
        0)
        awk '{sum+=$1} END {print sum}'
        ;;
        1)
        awk -v c1=$1 '{sum+=$c1} END {print sum}'
        ;;
        *)
            echo "Usage:add [column]"
        ;;
    esac
}

function average() {
    case $# in
        0)
        awk '{count+=1; sum+=$1} END {print sum/count}'
        ;;
        1)
        awk -v c1=$1 '{count+=1; sum+=$c1} END {print sum/count}'
        ;;
        *)
            echo "Usage:average [column]"
        ;;
    esac
}
