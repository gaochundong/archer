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
alias ctags="/usr/local/Cellar/ctags/5.8_2/bin/ctags"

# java
export JAVA_HOME=$HOME/.sdkman/candidates/java/current
export JAVA8_HOME=$HOME/.sdkman/candidates/java/8.0.322-tem
export JAVA11_HOME=$HOME/.sdkman/candidates/java/11.0.14-tem
export JAVA17_HOME=$HOME/.sdkman/candidates/java/17.0.2-tem
export JAVA_OPTS="-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=5005"
export M2_HOME=$HOME/.sdkman/candidates/maven/current

# go
export GOPATH="$HOME/g/github/go"
alias git2consul='$GOPATH/src/git2consul-go/build/bin/git2consul'

# rust
. "$HOME/.cargo/env"

# sdkman
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
