LC_ALL=en_US.UTF-8
LC_CTYPE=en_US.UTF-8
LANG=en_US.UTF-8
CASE_SENSITIVE="true"
DISABLE_LS_COLORS="false"

export TERM=xterm-256color
export ZSH="/Users/gaochundong/.oh-my-zsh"
export GOPATH="/Users/gaochundong/g/github/go"
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_201.jdk/Contents/Home
export JAVA_OPTS="-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=5005"
export M2_HOME=/usr/local/Cellar/maven/3.6.0/libexec
export HADOOP_HOME=/usr/local/Cellar/hadoop/3.1.2
export HIVE_HOME=/usr/local/Cellar/hive/3.1.2/libexec
export HCAT_HOME=/usr/local/opt/hive/libexec/hcatalog

export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
export PATH="$HOME/.yarn/bin:$PATH"
export PATH="$HOME/.config/yarn/global/node_modules/.bin:$PATH"

ZSH_THEME="powerlevel10k/powerlevel10k"
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

plugins=(git vscode colored-man-pages zsh-completions zsh-autosuggestions zsh-syntax-highlighting zsh-history-substring-search)

fpath=($ZSH_CUSTOM/plugins/zsh-completions $fpath)
source $ZSH/oh-my-zsh.sh
source '/Users/gaochundong/.zplugin/bin/zplugin.zsh'
autoload -Uz _zplugin
(( ${+_comps} )) && _comps[zplugin]=_zplugin

eval $(dircolors -b /Users/gaochundong/.dircolors_list/dircolors-solarized/dircolors.ansi-light)
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

alias cls='colorls -A --dark'
alias l='gls -l --color=always'
alias ll='gls -lhaGFA --color=always'
alias ls='gls -hG --color=always'
alias grep='grep --color=auto'
alias ip='ifconfig | grep "inet" | grep -v 127.0.0.1'
alias h='history'
alias git2consul='$GOPATH/src/git2consul-go/build/bin/git2consul'
