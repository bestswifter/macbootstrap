function bsfilename() {
    if [ $# != 1 ]; then
        echo "Usage: bsfilename path_to_file"
     fi

     if brew ls --versions coreutils > /dev/null; then
         filename=$(basename "$1")
         fname="${filename%.*}"
         echo $fname
     else
         echo "You have not install coreutils"
         echo "Please run 'brew install coreutils' first"
     fi
}
