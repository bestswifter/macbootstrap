# Usage: bsrenameextension old_extension new_extension
function bsrenameextension() {
    for file in *.$1; do
        name=`bsfilename "$file"`
        mv "$file" "$name".$2
    done
}
