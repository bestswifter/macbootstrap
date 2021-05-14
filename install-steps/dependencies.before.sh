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

    # import my own lldb configuration
    echo "" >> ~/.lldbinit
    echo "# load lldb commmand alias and configuration provided by bestswifter" >> ~/.lldbinit
    echo "command source ~/.macbootstrap/zsh-config/bs_lldb_extension" >> ~/.lldbinit
fi

# CodeRunner
# ---------------
brew install --cask coderunner
