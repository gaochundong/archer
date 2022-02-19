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
DISABLE_AUTO_UPDATE="false" # disable bi-weekly auto-update checks
export UPDATE_ZSH_DAYS=13   # how often to auto-update (in days)

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

# oh-my-zsh
source $ZSH/oh-my-zsh.sh

# zinit
source ~/.zinit/bin/zinit.zsh
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# zinit plugins
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-history-substring-search
zinit light zdharma-continuum/fast-syntax-highlighting
zinit light zdharma-continuum/history-search-multi-word
zinit light ael-code/zsh-colored-man-pages

# alias
alias l='gls -l --color=always'
alias ll='gls -lhaGFA --color=always'
alias ls='gls -hG --color=always'
alias bat='bat --style plain'
alias grep='grep --color=auto'
alias h='history'
alias ip='ifconfig | grep "inet" | grep -v 127.0.0.1 | sort'
alias ctags="/usr/local/Cellar/ctags/5.8_2/bin/ctags"

# homebrew
export HOMEBREW_NO_ANALYTICS=1        # will not send analytics
export HOMEBREW_NO_AUTO_UPDATE=1      # disable auto update before running install
export HOMEBREW_NO_INSTALL_CLEANUP=1  # disable periodically auto cleanup
export PATH="/usr/local/sbin:$PATH"

# git
alias gittags="git for-each-ref --sort=creatordate --format '%(refname) %(creatordate)' refs/tags"

# sdkman
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# java
export JAVA_HOME=$HOME/.sdkman/candidates/java/current
export JAVA8_HOME=$HOME/.sdkman/candidates/java/8.0.322-tem
export JAVA11_HOME=$HOME/.sdkman/candidates/java/11.0.14-tem
export JAVA17_HOME=$HOME/.sdkman/candidates/java/17.0.2-tem
export JAVA_OPTS="-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=5005"
export M2_HOME=$HOME/.sdkman/candidates/maven/current

# python
alias python3.7='/usr/local/Cellar/python@3.7/3.7.12_1/bin/python3.7'
alias python3.8='/usr/local/Cellar/python@3.8/3.8.12_1/bin/python3.8'
alias python3.9='/usr/local/Cellar/python@3.9/3.9.10/bin/python3.9'
alias python3.10='/usr/local/Cellar/python@3.10/3.10.2/bin/python3.10'
alias pip3.7='/usr/local/Cellar/python@3.7/3.7.12_1/bin/pip3.7'
alias pip3.8='/usr/local/Cellar/python@3.8/3.8.12_1/bin/pip3.8'
alias pip3.9='/usr/local/Cellar/python@3.9/3.9.10/bin/pip3.9'
alias pip3.10='/usr/local/Cellar/python@3.10/3.10.2/bin/pip3.10'

# nodejs
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"
export PATH="$HOME/.yarn/bin:$PATH"
export PATH="$HOME/.config/yarn/global/node_modules/.bin:$PATH"
