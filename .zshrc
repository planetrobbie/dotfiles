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

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

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
export PATH=$HOME/in/bin:$HOME/in/code/go/bin:$HOME/in/code/google-cloud-sdk/bin:/usr/local/git/current/bin:/usr/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:/Applications:/usr/local/go/bin:/usr/local/bin:/opt/zoom

export GOPATH=/home/sebbraun/in/code/go
export ENV_SHIORI_DB=$HOME/Google\ Drive\ \(sebbraun\@gmail.com\)/admin/shiori-bookmarks

# Enable nice prompt
powerline-daemon -q
. /usr/lib/python3.12/site-packages/powerline/bindings/zsh/powerline.zsh

# Allow accented letters to be typed using ALT + `, ...
setxkbmap -layout us -variant altgr-intl -option nodeadkeys

# Set Midnight Commander theme to Solarized
#export MC_SKIN=$HOME/.mc/solarized.ini

# Editor Used by Ranger
export VISUAL=subl

# Use my custom Ranger configuration instead of the default one
export RANGER_LOAD_DEFAULT_RC=false

# Mount Flying Box NFS share
alias mn='sudo mount 192.168.1.8:/mnt/in /mnt/in'

# Mount USB disk
alias mo='sudo mount -t vfat /dev/sda4 /mnt/diskorange'
alias mb='sudo mount -t exfat /dev/sdb3 /mnt/diskblack'
alias mx='sudo mount -t vfat /dev/sda1 /mnt/disknx'
alias mu='sudo mount -t ext2 /dev/sda1 /mnt/usbmetal/'
alias nut='sudo python /home/sebbraun/in/bin/nut-2.7/nut.py'
alias nut3='cd /home/sebbraun/in/bin/nut-3.1; python nut_gui.py'
alias nut-latest='cd /home/sebbraun/in/bin/nut-latest; python3 nut_gui.py'
alias dbi='sudo /home/sebbraun/in/switch/dbi/dbibackend'
alias ls='ls -l --block-size=M'
alias usb='sudo java -jar /home/sebbraun/in/bin/ns-usbloader-3.0.jar'
alias bb='sudo mount --verbose -t cifs //192.168.1.112/in /mnt/in-bb -o user=planetrobbie,vers=1.0,sec=ntlmv2'

# PS4
alias ps4='java -jar /home/sebbraun/in/bin/ps4-exploit-host/ps4-remote-pkg-installer-refs.tags.v0.0.7.jar'

#Steamdeck
alias sl='flatpak run com.valvesoftware.SteamLink'
alias nsz='/home/sebbraun/in/bin/nsz-4.6.1/nsz.py'

# Syntax autosuggestion & highlighting 
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

#ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#00ff00,bold'  # Bright green
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=208,bold'  # Bright green
zstyle ':completion:*' list-colors \
    'fg=#ffffff:fg=#007fff:fg=#00ff7f:fg=#ff007f'

# Eza
alias ls='eza --color=always --icons --group-directories-first'

# Yazi - allows to keep dir location when existing with q otherwise use Q
function y() {
        local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
        yazi "$@" --cwd-file="$tmp"
        if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
                builtin cd -- "$cwd"
        fi
        rm -f -- "$tmp"
} 

#fzf - Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

#zoxide - better cd
eval "$(zoxide init zsh)"
