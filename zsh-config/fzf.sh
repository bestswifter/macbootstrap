[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export FZF_COMPLETION_TRIGGER=''

fzf-history-widget-accept() {
  fzf-history-widget
  zle accept-line
}
zle     -N     fzf-history-widget-accept

bindkey '^X^R' fzf-history-widget-accept
bindkey '^T' fzf-completion
bindkey '^I' $fzf_default_completion
bindkey -s '^g' 'autojump_with_fzf \n'
