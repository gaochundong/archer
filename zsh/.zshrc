# display locale settings, see `locale`
LANG=en_US.UTF-8       # Used as a substitute for any unset LC_* variable.
LANGUAGE=en_US         # List of fallback message translation languages.
LC_ALL="en_US.UTF-8"   # A macro that will override the setting of all other LC_* variables.
LC_CTYPE="en_US.UTF-8" # Sets the locale for the LC_CTYPE category.

# zsh theme
export TERM=xterm-256color
export ZSH="/Users/gaochundong/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# zstyle dir colors
alias dircolors="gdircolors" # GNU dircolors is provided as gdircolors by brew's coreutils package
CASE_SENSITIVE="true"
DISABLE_LS_COLORS="false"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# zsh plugins
plugins=(git vscode zsh-completions zsh-autosuggestions zsh-dircolors-solarized zsh-syntax-highlighting zsh-history-substring-search colored-man-pages)

# zsh autoloading fuctions
fpath=($ZSH_CUSTOM/plugins/zsh-completions $fpath)
source $ZSH/oh-my-zsh.sh
source '/Users/gaochundong/.zplugin/bin/zplugin.zsh'
autoload -Uz _zplugin
(( ${+_comps} )) && _comps[zplugin]=_zplugin

# alias
alias cls='colorls -A --dark'
alias l='gls -l --color=always'
alias ll='gls -lhaGFA --color=always'
alias ls='gls -hG --color=always'
alias bat='bat --style plain'
alias grep='grep --color=auto'
alias h='history'
alias ip='ifconfig | grep "inet" | grep -v 127.0.0.1'

# homebrew
export HOMEBREW_NO_ANALYTICS=1        # will not send analytics
export HOMEBREW_NO_AUTO_UPDATE=1      # disable auto update before running install
export HOMEBREW_NO_INSTALL_CLEANUP=1  # disable periodically auto cleanup
export PATH="/usr/local/sbin:$PATH"

# git
alias gittags="git for-each-ref --sort=creatordate --format '%(refname) %(creatordate)' refs/tags"

# java
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_201.jdk/Contents/Home
export JAVA11_HOME=/Library/Java/JavaVirtualMachines/adoptopenjdk-11.jdk/Contents/Home
export JAVA_OPTS="-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=5005"
export M2_HOME=/usr/local/Cellar/maven/3.6.3_1/libexec

# nodejs
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"
export PATH="$HOME/.yarn/bin:$PATH"
export PATH="$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# go
export GOPATH="/Users/gaochundong/g/github/go"
alias git2consul='$GOPATH/src/git2consul-go/build/bin/git2consul'

# python
alias python3.7='/usr/local/Cellar/python/3.7.7/bin/python3.7'
alias python3.8='/usr/local/Cellar/python@3.8/3.8.5/bin/python3.8'
