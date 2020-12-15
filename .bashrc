# Bashrc

# Exit if running interactively
[[ $- != *i* ]] && return
# Make sure the terminal starts in the home directory
cd $HOME
# Use autocd to cd in directory without cd
shopt -s autocd cdspell
# Aliases
alias l='ls --color=auto --group-directories-first'
alias p='sudo pacman'
alias qping='ping www.google.com -c 3'
alias f='fg'
alias e='emacs -nw'
##prompt
PS1="\e[0;35m[\W]\e[m\n\e[0;35m--->>> \e[m"
