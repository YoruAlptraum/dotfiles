# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# Default layout
PS1='%~ >'
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/maidenless/.zshrc'

# Activate starship, overwrites default PS1
eval "$(starship init zsh)"

autoload -Uz compinit
compinit

alias ls='ls --color=auto'
alias grep='grep --color=auto'

