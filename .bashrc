#############
### Bashrc###
#############


# Basic setup
## Exit if interactive
[[ $- != *i* ]] && return
## Cd home
cd $HOME

# Bash Prompt
## Create color variables
SETUNDO='\e[0m'
SETLPUR='\e[38;5;15;15;15m\e[48;2;150;100;240m'
SETDPUR='\e[38;5;15;15;15m\e[48;2;100;50;150m'
SETD2LPUR='\e[38;2;150;100;240m\e[48;2;100;50;150m'
SETL2DPUR='\e[38;2;100;50;150m\e[48;2;150;100;240m'
SETLPUREND="$SETUNDO"'\e[38;2;150;100;240m'
SETDPUREND="$SETUNDO"'\e[38;2;100;50;150m'
## Set prompt
PS1=$(printf "\
${SETDPUR} $USER ${SETL2DPUR}\
${SETLPUR} \A ${SETD2LPUR}\
${SETDPUR} \w ${SETDPUREND}${SETUNDO}\n\
${SETDPUR}  exec:${SETDPUREND}${SETUNDO} ")

# Bash Settings
## History options
HISTSIZE=50000
HISTFILSIZE=55000
## Shopt options
shopt -s autocd cdspell
shopt -s dotglob
shopt -s nocaseglob
shopt -s histappend
shopt -s checkwinsize

# Shortcuts
## Aliases
### Basic prog shortcut/alterations
alias l='ls --color=auto --group-directories-first'
alias p='sudo pacman'
alias f='fg'
alias e='emacs -nw'
alias v='vim'
alias d='date +"%m-%d-%y|%H:%M"'
alias qping='ping www.google.com -c 3'
alias gdb='gdb -ex run -quiet  $1'
### Gpg encrytion
alias gpgencrypt='gpg --encrypt --sign --armor -r $USER $1'
alias gpgdecrypt='gpg --decrypt $1'
### Git commands
alias gitreorg='git remote rm origin &&  git remote add origin link'
alias gitcompush='read -p "Git Message: " MSG && git commit -m "$MSG" && git push'
## Functions
### Create executable
mkexe(){
    touch $1
    chmod +x $1
}
### Alter screen brightness in Xorg
xrandrbl(){
    xrandr --output $1 --brightness $2
}
