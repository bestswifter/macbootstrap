# Install chisel for debugging in lldb
brew install chisel
if [[ ! -e ~/.lldbinit ]]; then
    cp ~/.macbootstrap/config/.lldbinit ~/.lldbinit
else
    if grep -q "/usr/local/opt/chisel/libexec/fblldb.py" "$HOME/.lldbinit"; then
        echo "Chisel is installed"
    else
        echo "command script import /usr/local/opt/chisel/libexec/fblldb.py" >> ~/.lldbinit
    fi
fi

# CodeRunner
# ---------------
brew cask install coderunner
