export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"

export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
export PS1='\[\e[0;36m\][\[\e[0;36m\]\u\[\e[0;36m\]@\[\e[0;36m\]\h \[\e[0;32m\]\w\[\e[0;36m\]]\$\[\e[0m\]'

# alias
alias cls='colorls -A --dark'
alias l='gls -l --color=always'
alias ll='gls -lhaGFA --color=always'
alias ls='gls -hG --color=always'
alias grep='grep --color=auto'
alias ip='ifconfig | grep "inet" | grep -v 127.0.0.1'
alias h='history'

# java
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_201.jdk/Contents/Home
export JAVA_OPTS="-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=5005"
export M2_HOME=/usr/local/Cellar/maven/3.6.3_1/libexec

# go
export GOPATH="/Users/gaochundong/g/github/go"
alias git2consul='$GOPATH/src/git2consul-go/build/bin/git2consul'
