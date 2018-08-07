# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="agnoster"
#ZSH_THEME="bullet-train"
#BULLETTRAIN_DIR_EXTENDED=0
#BULLETTRAIN_PROMPT_ORDER=(
#  git
#  context
#  dir
#  time
#)

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias serve="python -m SimpleHTTPServer 8000"
alias typora="open -a typora"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git github bundler)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

# Added for Agnoster theme, replace by your username
DEFAULT_USER="sebbraun"

# Setup Solarized color theme for LS_COLORS
# [[ -s "$HOME/.dircolors"]] && eval `/usr/bin/dircolors ~/.dircolors`

# Load RVM into a shell session as a function
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# Pet register last cmd (cf. https://github.com/knqyf263/pet)
function prev() {
  PREV=$(fc -lrn | head -n 1)
  sh -c "pet new `printf %q "$PREV"`"
}

# Pet search snippets and output on the shell.
function pet-select() {
  BUFFER=$(pet search --query "$LBUFFER")
  CURSOR=$#BUFFER
  zle redisplay
}
zle -N pet-select
bindkey '^s' pet-select
export PATH=$HOME/in/bin:$HOME/in/code/go/bin:$HOME/in/code/google-cloud-sdk/bin:/usr/local/git/current/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:/Applications:/usr/local/go/bin:/usr/local/bin

export GOPATH=/Users/sebbraun/in/code/go
export ENV_SHIORI_DB=$HOME/Google\ Drive\ \(sebbraun\@gmail.com\)/admin/shiori-bookmarks
