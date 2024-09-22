# Default layout
PS1='%~ >'

# Activate starship, overwrites default PS1
eval "$(starship init bash)"

bind 'set show-all-if-ambiguous on'
bind 'TAB:menu-complete'

alias la='ls -a --color=auto'
alias ls='ls --color=auto'
alias grep='grep --color=auto'

