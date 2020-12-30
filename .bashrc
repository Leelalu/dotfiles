# Bashrc

# Exit if interactive
[[ $- != *i* ]] && return
# Cd home
cd $HOME
# Use autocd to cd in directory without cd
shopt -s autocd cdspell
# Aliases
alias l='ls --color=auto --group-directories-first'
alias p='sudo pacman'
alias qping='ping www.google.com -c 3'
alias f='fg'
alias e='emacs -nw'
alias d='date +"%m-%d-%y|%H:%M"'
alias gitpc='read -p "Git Message:" MSG && git commit -m "$MSG" && git push'
alias p='echo $($1)'
# Prompt
PS1="\e[0;35m[\W]\e[m\n\e[0;35m--->>> \e[m"
