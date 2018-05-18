
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

export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_151.jdk/Contents/Home
export JAVA_OPTS="-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=5005"
export M2_HOME=/usr/local/Cellar/maven/3.5.2/libexec

code () { VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args $* ;}
calc () { open -n -b "com.apple.Calculator" --args $* ;}
