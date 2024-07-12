# display locale settings, see `locale`
export LANG=en_US.UTF-8       # Used as a substitute for any unset LC_* variable.
export LANGUAGE=en_US         # List of fallback message translation languages.
export LC_ALL="en_US.UTF-8"   # A macro that will override the setting of all other LC_* variables.
export LC_CTYPE="en_US.UTF-8" # Sets the locale for the LC_CTYPE category.

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# zsh theme
export TERM=xterm-256color
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# zsh config
DISABLE_UPDATE_PROMPT="true" # replay yes and automatically upgrade
DISABLE_AUTO_UPDATE="true"   # disable bi-weekly auto-update checks
export UPDATE_ZSH_DAYS=13    # how often to auto-update (in days)

# zstyle dir colors
alias dircolors="gdircolors" # GNU dircolors is provided as gdircolors by brew's coreutils package
CASE_SENSITIVE="true"
DISABLE_LS_COLORS="false"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# powerlevel10k
POWERLEVEL9K_OS_ICON_FOREGROUND=254 # OS identifier color
POWERLEVEL9K_OS_ICON_BACKGROUND=200 # OS identifier color
POWERLEVEL9K_DIR_BACKGROUND=027     # Current directory background color
POWERLEVEL9K_DIR_FOREGROUND=254     # Default current directory foreground color
POWERLEVEL9K_INSTANT_PROMPT=quiet   # Suppress warnings

# oh-my-zsh
source $ZSH/oh-my-zsh.sh

# zinit
source ~/.zinit/bin/zinit.zsh
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# zinit plugins
# zinit is a flexible and fast zshell plugin manager that will allow you to install everything from GitHub and other sites.
# zinit load  <repo/plugin> # 加载时记录插件报告
# zinit light <repo/plugin> # 加载时不记录
# zinit snippet <URL>       # 通过URL加载文件
zinit snippet OMZP::git
zinit snippet OMZP::mvn
zinit snippet OMZP::kubectl
zinit snippet OMZP::multipass
zinit snippet OMZP::microk8s
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-history-substring-search
zinit light zdharma-continuum/fast-syntax-highlighting
zinit light zdharma-continuum/history-search-multi-word
zinit light ael-code/zsh-colored-man-pages
zinit light vkolagotla/zsh-random-quotes
zinit light babasbot/auto-fortune-cowsay-zsh

# alias
alias l='gls -l --color=always'
alias ll='gls -lhaGFA --color=always'
alias ls='gls -hG --color=always'
alias bat='bat --style plain'
alias grep='grep --color=auto'
alias h='history'
alias ip='ifconfig | grep "inet" | grep -v 127.0.0.1 | sort'
alias ctags="/usr/local/Cellar/ctags/5.8_2/bin/ctags"
alias code="/usr/local/bin/code"

# homebrew
export HOMEBREW_NO_INSTALLED_DEPENDENTS_CHECK=1
export HOMEBREW_NO_ANALYTICS=1        # will not send analytics
export HOMEBREW_NO_AUTO_UPDATE=1      # disable auto update before running install
export HOMEBREW_NO_INSTALL_CLEANUP=1  # disable periodically auto cleanup
export PATH="/usr/local/sbin:$PATH"

# parameter
CORP_ACCOUNT="xxx"
CORP_DOMAIN="yyy"

# jumper
alias jp="ssh -i ~/.ssh/jumper/id_rsa_jumper $CORP_ACCOUNT@jumper.$CORP_DOMAIN.com"
alias jprm="rm -f ~/.ssh/master*"

# git
alias gittags="git for-each-ref --sort=creatordate --format '%(refname) %(creatordate)' refs/tags"

# sdkman
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# java
export JAVA_HOME=$HOME/.sdkman/candidates/java/current
export JAVA8_HOME=$HOME/.sdkman/candidates/java/8.0.322-tem
export JAVA11_HOME=$HOME/.sdkman/candidates/java/11.0.14-tem
export JAVA17_HOME=$HOME/.sdkman/candidates/java/17.0.4.1-tem
export JAVA21_HOME=$HOME/.sdkman/candidates/java/21.0.2-tem
export JAVA_OPTS="-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=5005"
export JAVA7_ORACLE_MACOS=/Library/Java/JavaVirtualMachines/jdk1.7.0_80.jdk/Contents/Home
export JAVA8_ORACLE_MACOS=/Library/Java/JavaVirtualMachines/jdk-1.8.jdk/Contents/Home
alias java7="JAVA_HOME=$JAVA7_ORACLE_MACOS && $JAVA7_ORACLE_MACOS/bin/java"
alias java8="JAVA_HOME=$JAVA8_HOME && $JAVA8_HOME/bin/java"
alias java11="JAVA_HOME=$JAVA11_HOME && $JAVA11_HOME/bin/java"
alias java17="JAVA_HOME=$JAVA17_HOME && $JAVA17_HOME/bin/java"
alias java21="JAVA_HOME=$JAVA21_HOME && $JAVA21_HOME/bin/java"

# maven
export M2_HOME=$HOME/.sdkman/candidates/maven/current
export MAVEN_HOME=$HOME/.sdkman/candidates/maven/current
export MAVEN6_HOME=$HOME/.sdkman/candidates/maven/3.6.3
alias mvn8="JAVA_HOME=$JAVA8_HOME && mvn"
alias mvn11="JAVA_HOME=$JAVA11_HOME && mvn"
alias mvn17="JAVA_HOME=$JAVA17_HOME && mvn"
alias mvn21="JAVA_HOME=$JAVA21_HOME && mvn"
alias mvn7oracle="JAVA_HOME=$JAVA7_ORACLE_MACOS && mvn"
alias mvn8oracle="JAVA_HOME=$JAVA8_ORACLE_MACOS && mvn"
alias mvndebug8="JAVA_HOME=$JAVA8_HOME && mvnDebug"
alias mvndebug11="JAVA_HOME=$JAVA11_HOME && mvnDebug"
alias mvndebug17="JAVA_HOME=$JAVA17_HOME && mvnDebug"
alias mvndebug21="JAVA_HOME=$JAVA21_HOME && mvnDebug"
alias mvndebug7oracle="JAVA_HOME=$JAVA7_ORACLE_MACOS && mvnDebug"
alias mvndebug8oracle="JAVA_HOME=$JAVA8_ORACLE_MACOS && mvnDebug"

# gradle
export GRADLE_HOME=$HOME/.sdkman/candidates/gradle/current
export GRADLE6_HOME=$HOME/.sdkman/candidates/gradle/6.9.2
export GRADLE7_HOME=$HOME/.sdkman/candidates/gradle/7.4
alias gradle8="JAVA_HOME=$JAVA8_HOME && gradle"
alias gradle11="JAVA_HOME=$JAVA11_HOME && gradle"
alias gradle17="JAVA_HOME=$JAVA17_HOME && gradle"
alias gradle21="JAVA_HOME=$JAVA21_HOME && gradle"
alias gradle7oracle="JAVA_HOME=$JAVA7_ORACLE_MACOS && gradle"
alias gradle8oracle="JAVA_HOME=$JAVA8_ORACLE_MACOS && gradle"

# python
# python@3.7 Disabled because it is deprecated upstream!
# python@3.8 Disabled because it is deprecated upstream!
alias python3.9='/usr/local/Cellar/python@3.9/3.9.19/bin/python3.9'
alias python3.10='/usr/local/Cellar/python@3.10/3.10.14/bin/python3.10'
alias python3.11='/usr/local/Cellar/python@3.11/3.11.8/bin/python3.11'
alias python3.12='/usr/local/Cellar/python@3.12/3.12.2_1/bin/python3.12'
alias pip3.9='/usr/local/Cellar/python@3.9/3.9.19/bin/pip3.9'
alias pip3.10='/usr/local/Cellar/python@3.10/3.10.14/bin/pip3.10'
alias pip3.11='/usr/local/Cellar/python@3.11/3.11.8/bin/pip3.11'
alias pip3.12='/usr/local/Cellar/python@3.12/3.12.2_1/bin/pip3.12'

# nodejs
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"
export PATH="$HOME/.yarn/bin:$PATH"
export PATH="$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export NODE_OPTIONS="--max-old-space-size=8192"
alias mnpm="npm --registry=http://r.npm.$CORP_DOMAIN.com --cache=$HOME/.cache/mnpm --disturl=http://npm.$CORP_DOMAIN.com/mirrors/node --userconfig=$HOME/.mnpmrc" 

# go
alias go15='/usr/local/opt/go@1.15/bin/go'
alias go16='/usr/local/opt/go@1.16/bin/go'
alias go17='/usr/local/opt/go@1.17/bin/go'
alias go18='/usr/local/opt/go@1.18/bin/go'
alias go20='/usr/local/opt/go@1.20/bin/go'
export GODIR="/usr/local/opt/go@1.18"
export GOBIN="${GODIR}/bin"
export GOROOT=$(${GOBIN}/go env GOROOT)
export GOVERSION=$(${GOBIN}/go version | awk '{print $3}')
export PATH="${GOROOT}/bin:${PATH}"
export GOPATH="$HOME/.go/${GOVERSION}"
export GOENV="$HOME/.go/${GOVERSION}/env"
export GOCACHE="$HOME/.go/${GOVERSION}/cache"
export GOMODCACHE="$HOME/.go/${GOVERSION}/mod"

# rust
export PATH="$HOME/.cargo/bin:$PATH"

# wireshark
export SSLKEYLOGFILE="$HOME/g/tmp/SSLKEYLOGFILE.log" # The key log file is a text file generated by applications such as Firefox, Chrome and curl.

# dotnet
export DOTNET_CLI_TELEMETRY_OPTOUT=1 # The .NET SDK telemetry feature is enabled by default. Set 1 to opt out.

# android
export ANDROID_SDK_ROOT="/usr/local/share/android-commandlinetools"

# curl
export PATH="/usr/local/opt/curl/bin:$PATH"
