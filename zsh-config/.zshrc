export PATH=/usr/local/opt/coreutils/libexec/gnubin:$PATH:$M2_HOME/bin
export LANG=en_US.UTF-8
plugins=(extract encode64 urltools brew zsh-syntax-highlighting zsh-autosuggestions)
ZSH=$HOME/.oh-my-zsh

ZSH_THEME="robbyrussell"
PROMPT=$'%{$purple%}%n%{$reset_color%} in %{$limegreen%}%~%{$reset_color%}$(ruby_prompt_info " with%{$fg[red]%} " v g "%{$reset_color%}")$vcs_info_msg_0_%{$orange%}%{$reset_color%} at %{$hotpink%}%* %{$orange%}λ%{$reset_color%} '

source $ZSH/oh-my-zsh.sh
zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} r:|[._-]=** r:|=**'
zstyle ':completion:*:*' ignored-patterns '*ORIG_HEAD'

fpath=(/usr/local/share/zsh-completions $fpath)
compinit -u

HISTCONTROL=ignorespace
HISTFILE=~/.histfile
HISTSIZE=10000000
HISTFILESIZE=10000000
SAVEHIST=10000000
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=magenta'
ZSH_AUTOSUGGEST_STRATEGY="match_prev_cmd"

BS_ZSH_BASE="$HOME/.macbootstrap"
BS_ZSH_TOOLS=${BS_ZSH_BASE}/tools

source $BS_ZSH_BASE/basic.sh
source $BS_ZSH_BASE/zsh-config/common.sh
[ -f /opt/homebrew/etc/profile.d/autojump.sh ] && . /opt/homebrew/etc/profile.d/autojump.sh
if brew ls --versions scmpuff > /dev/null; then
    eval "$(scmpuff init -s --aliases=false)"
fi

fpath=(/usr/local/share/zsh-completions $fpath)

# GO
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOBIN

# Homebrew
# export PATH="/usr/local/sbin:$PATH"
# for arm
export PATH="/opt/homebrew/bin:$PATH"

# for nvm
export NVM_DIR=~/.nvm
export EDITOR="nvim"
#source $(brew --prefix nvm)/nvm.sh
export NVM_SH="/opt/homebrew/opt/nvm/nvm.sh"
# https://github.com/creationix/nvm/issues/860
declare -a NODE_GLOBALS=(`find $NVM_DIR/versions/node -maxdepth 3 -type l -wholename '*/bin/*' | xargs -n1 basename | sort | uniq`)

NODE_GLOBALS+=("node")
NODE_GLOBALS+=("nvm")

load_nvm () {
  [ -s "$NVM_SH" ] && . "$NVM_SH"
}

for cmd in "${NODE_GLOBALS[@]}"; do
  eval "${cmd}(){ unset -f ${NODE_GLOBALS}; load_nvm; ${cmd} \$@ }"
done

# Bind key
bindkey ';' autosuggest-execute

#archey -o
autoload -U bashcompinit
bashcompinit

if [[ -e /usr/local/opt/mysql@5.6/bin/mysql ]]; then
  export PATH="/usr/local/opt/mysql@5.6/bin:$PATH"
fi

# This speeds up pasting w/ autosuggest
# https://github.com/zsh-users/zsh-autosuggestions/issues/238
pasteinit() {
  OLD_SELF_INSERT=${${(s.:.)widgets[self-insert]}[2,3]}
  zle -N self-insert url-quote-magic # I wonder if you'd need `.url-quote-magic`?
}

pastefinish() {
  zle -N self-insert $OLD_SELF_INSERT
}
zstyle :bracketed-paste-magic paste-init pasteinit
zstyle :bracketed-paste-magic paste-finish pastefinish

# mysqlclient
export LDFLAGS="-L/usr/local/opt/openssl/lib"
export CPPFLAGS="-I/usr/local/opt/openssl/include"
export PATH="/usr/local/opt/openssl/bin:$PATH"
export PKG_CONFIG_PATH="/usr/local/opt/openssl/lib/pkgconfig"