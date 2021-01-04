# Bashrc

# Exit if interactive
[[ $- != *i* ]] && return
# Prompt
PS1="\e[0;35m[\W]\e[m\n\e[0;35m--->>> \e[m"
# Cd home
cd $HOME
export PATH="/home/amar/myapp:$PATH"
# History options
HISTSIZE=50000
HISTFILSIZE=55000
# Shopt options
shopt -s autocd cdspell
shopt -s dotglob
shopt -s nocaseglob
shopt -s histappend
shopt -s checkwinsize
# Functions
mkexe (){
    touch $1
    chmod +x $1
}
# Aliases
alias l='ls --color=auto --group-directories-first'
alias p='sudo pacman'
alias f='fg'
alias e='emacs -nw'
alias d='date +"%m-%d-%y|%H:%M"'
alias qping='ping www.google.com -c 3'
alias gitreorg='git remote rm origin &&  git remote add origin link'
alias gitcpp='read -p "Git Message: " MSG && git commit -m "$MSG" && git pull && git push'
