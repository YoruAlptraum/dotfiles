# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
# bindkey -e

zstyle :compinstall filename '/home/maidenless/.zshrc'

# Default layout
PS1='%~ >'

# Activate starship, overwrites default PS1
eval "$(starship init zsh)"

autoload -Uz compinit
compinit

alias ls='ls --color=auto'
alias grep='grep --color=auto'

