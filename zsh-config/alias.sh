# git
alias gpo='git push origin'
alias gcn='git config user.name'
alias gcng='git config --global user.name'
alias gce='git config user.email'
alias gceg='git config --global user.email'
alias grsh='git remote show'
alias ggs='gg --stat'
alias ggp='gg -p'
alias gbv='gb -vv'
alias gbD='git branch -D'
alias gbm='git branch --merged'
alias gbnm='git branch --no-merged'
alias gvc='git verify-commit'
alias gct='git checkout --track'
alias gtrack='git branch --set-upstream-to=origin/`git symbolic-ref --short HEAD`'
alias gst='git stash -u'

# zsh
alias showFiles='defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder'
alias fisrt='tail -n'
alias last='head -n'
alias ppjson='python $BS_ZSH_TOOLS/json_pretty.py'
