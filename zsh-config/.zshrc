plugins=(git)

ZSH=$HOME/.oh-my-zsh

ZSH_THEME="robbyrussell"

source $ZSH/oh-my-zsh.sh

zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} r:|[._-]=** r:|=**'
zstyle ':completion:*:*' ignored-patterns '*ORIG_HEAD'

fpath=(/usr/local/share/zsh-completions $fpath)
compinit -u

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000000

BS_ZSH_BASE="$HOME/.macbootstrap"

source $BS_ZSH_BASE/basic.sh
source $BS_ZSH_BASE/zsh-config/common.sh
source $(brew --prefix)/etc/profile.d/autojump.sh

fpath=(/usr/local/share/zsh-completions $fpath)
export PATH=/usr/local/opt/coreutils/libexec/gnubin:$PATH:$M2_HOME/bin
