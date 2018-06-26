[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export FZF_COMPLETION_TRIGGER=''
export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"
export FZF_DEFAULT_COMMAND='fd --type f --exclude .git'

fzf-history-widget-accept() {
  fzf-history-widget
  zle accept-line
}
zle     -N     fzf-history-widget-accept

bindkey '^X^R' fzf-history-widget-accept
bindkey '^T' fzf-completion
bindkey '^I' $fzf_default_completion
bindkey -s '^g' 'autojump_with_fzf \n'
