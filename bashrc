###########
# General #
###########
export EDITOR=nvim

export CLICOLOR=2
export LSCOLORS="exfxxxxxgxxxxxxxxxxxxx"

# set prompt command
source ${HOME}/.auraprompt

# cli fuzzy finder
[[ -f ~/.fzf.bash ]] && source ~/.fzf.bash

################
# Bash Aliases #
################
alias la='ls -la'
alias ll='ls -l'
alias l='ls'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

alias c='clear'
alias fhere='find . -name'
alias mkdir='mkdir -pv'

###########
# kubectl #
###########
# bash completion
source <(kubectl completion bash)

[[ -f ~/.kubectl-aliases ]] && source ~/.kubectl-aliases
[[ -f ~/.ak-aliases ]] && source ~/.ak-aliases
complete -F __start_kubectl k
complete -F __start_kubectl ak
