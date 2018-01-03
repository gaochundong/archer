
alias l='ls -l'
alias ll='ls -lhaGFA'
alias ls='ls -hG'
alias grep='grep --color=auto'
alias ip='ifconfig | grep "inet" | grep -v 127.0.0.1'
alias h='history'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
export PS1='\[\e[0;36m\][\[\e[0;36m\]\u\[\e[0;36m\]@\[\e[0;36m\]\h \[\e[0;32m\]\w\[\e[0;36m\]]\$\[\e[0m\]'

code () { VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args $* ;}
calc () { open -n -b "com.apple.Calculator" --args $* ;}
