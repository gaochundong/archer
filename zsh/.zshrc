LC_ALL=en_US.UTF-8
LANG=en_US.UTF-8
CASE_SENSITIVE="true"
DISABLE_LS_COLORS="false"

export TERM=xterm-256color
export ZSH="/Users/gaochundong/.oh-my-zsh"
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_151.jdk/Contents/Home
export JAVA_OPTS="-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=5005"
export M2_HOME=/usr/local/Cellar/maven/3.5.2/libexec

ZSH_THEME="powerlevel10k/powerlevel10k"
POWERLEVEL9K_MODE='nerdfont-complete'
POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir vcs)
POWERLEVEL9K_DIR_HOME_BACKGROUND='201'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='033'
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND='011'

plugins=(git vscode colored-man-pages zsh-completions zsh-autosuggestions zsh-syntax-highlighting zsh-history-substring-search)

fpath=($ZSH_CUSTOM/plugins/zsh-completions $fpath)
source $ZSH/oh-my-zsh.sh
source '$HOME/.zplugin/bin/zplugin.zsh'
autoload -Uz _zplugin
(( ${+_comps} )) && _comps[zplugin]=_zplugin

eval $(dircolors -b $HOME/.dircolors_list/dircolors-solarized/dircolors.ansi-light)
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

alias cls='colorls -A --dark'
alias l='gls -l --color=always'
alias ll='gls -lhaGFA --color=always'
alias ls='gls -hG --color=always'
alias grep='grep --color=auto'
alias ip='ifconfig | grep "inet" | grep -v 127.0.0.1'
alias h='history'
alias prettyjson='python -m json.tool'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
