# Bashrc

# Exit if interactive
[[ $- != *i* ]] && return
# Prompt
PS1="\e[0;35m[\W]\e[m\n\e[0;35m--->>> \e[m"
# Cd home
cd $HOME
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
mkexe(){
    touch $1
    chmod +x $1
}
ffstrrec(){
    DATE=$(date +"%m-%d-%y_%H:%M")
    ffmpeg -y -f x11grab -s 1366x768 -i :0.0 -f alsa -i default $DATE-recorig.mkv
    cp $DATE-recorig.mkv $DATE-reccopy.mkv
}
ffextraudio(){
    ffmpeg -i $1 -vn -acodec copy $(echo $1 | cut -f 1 -d '.')-audio.ogg
}
ffsplice(){
    ffmpeg -i $1 -ss $2 -to $3 -c copy $(echo $1 | cut -f 1 -d '.')-spliced.mkv
}
ffconcat(){
    ffmpeg -i $1 -i $2 -filter_complex "[0:v][0:a][1:v][1:a] concat=n=2:v=1:a=1 [v] [a]" -map "[v]" -map "[a]" $(echo $1 | cut -f 1 -d '.')_$(echo $2 | cut -f 1 -d '.')-concat.mkv
    
}
# aliases
alias l='ls --color=auto --group-directories-first'
alias p='sudo pacman'
alias f='fg'
alias e='emacs -nw'
alias d='date +"%m-%d-%y|%H:%M"'
alias qping='ping www.google.com -c 3'
alias gitreorg='git remote rm origin &&  git remote add origin link'
alias gitcpp='read -p "Git Message: " MSG && git commit -m "$MSG" && git pull && git push'
