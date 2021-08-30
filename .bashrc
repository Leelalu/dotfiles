### Bashrc ###
##############
### Basic setup ###
###################
# Reset screen
clear
# Exit if interactive
[[ $- != *i* ]] && return
# Cd home
cd $HOME
# Add ~/bin to $PATH
export PATH="$HOME/bin:$PATH"
# Ensure 256 colors are reconized
TERM=xterm-256color

###################
### Bash Prompt ###
###################
# Create color variables
SETUNDO='\e[0m'
SETLPUR='\e[38;5;15m\e[48;5;135m'
SETDPUR='\e[38;5;15m\e[48;5;55m'
SETL2DPUR='\e[38;5;55m\e[48;5;135m'
SETD2LPUR='\e[38;5;135m\e[48;5;55m'
SETLPUREND="$SETUNDO"'\e[38;5;135m'
SETDPUREND="$SETUNDO"'\e[38;5;55m'
# Set prompt
PS1=$(printf "\
${SETDPUR} $USER ${SETL2DPUR}\
${SETLPUR} \A ${SETD2LPUR}\
${SETDPUR} \w ${SETDPUREND}${SETUNDO}\n\
${SETDPUR}  exec:${SETDPUREND} ${SETUNDO}")

#####################
### Bash Settings ###
#####################
# History options
HISTCONTROL=ignoreboth
HISTSIZE=50000
HISTFILSIZE=55000
# Shopt options
shopt -s autocd cdspell
shopt -s dotglob
shopt -s nocaseglob
shopt -s histappend
shopt -s checkwinsize
# Set options
set -o vi

#################
### Shortcuts ###
#################
# Aliases
## Basic prog shortcut/alterations
alias l='ls --color=auto --group-directories-first'
alias ll='ls -alF --color=auto --group-directories-first'
alias la='ls -A --color=auto --group-directories-first'
alias p='sudo pacman'
alias f='fg'
alias e='emacs -nw'
alias v='vim'
alias d='date +"%m-%d-%y|%H:%M"'
alias bt='bluetoothctl'
alias nmctrl='nmcli device wifi'
alias qping='ping www.google.com -c 3'
alias gdb='gdb -ex run -quiet  $1'
## Gpg encrytion
alias gpgencrypt='gpg --encrypt --sign --armor -r $USER $1'
alias gpgdecrypt='gpg --decrypt $1'
## Git commands
alias gitreorg='git remote rm origin &&  git remote add origin link'
alias gitcompush='read -p "Git Message: " MSG && git commit -m "$MSG" && git push'
## Bluetooth connecting
# Functions
## Create executable
mkexe(){
    touch $1
    chmod +x $1
}
## Alter screen brightness in Xorg
xrandrbl(){
    xrandr --output $1 --brightness $2
}
## Better cat output for multiple files
m(){
	more $@ | cat
}
## Connect to bt device by name
btcon(){
    bluetoothctl connect $(bluetoothctl devices | grep "$1" | cut -c 8-24)
}

# Launch screen
## Create name for screen session
SCREENNAME="LEELASCRSESSION"
## If not currently in screen section check what to do
if ! echo $STY | grep -q -e $SCREENNAME; then
    ## If screen non-existant, create & attatch session
    if ! screen -ls | grep -q -e $SCREENNAME; then
        exec screen -S $SCREENNAME
    fi
    ## If screen exists then attach
    if screen -ls | grep -e $SCREENNAME | grep -q -e Detached; then
        exec screen -r $SCREENNAME
    fi
fi
