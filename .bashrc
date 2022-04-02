### Bashrc

# Reset screen
clear
# Cd home
cd $HOME

### Settings
# Export vars
export PATH="$HOME/bin:$PATH"
export TERM=xterm-256color
export EDITOR=vim
export PAGER=less
export LS_COLORS='rs=0:di=13;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=31;82:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.zst=01;31:*.tzst=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.wim=01;31:*.swm=01;31:*.dwm=01;31:*.esd=01;31:*.jpg=01;35:*.jpeg=01;35:*.mjpg=01;35:*.mjpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.webp=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:';
# Options
shopt -s autocd cdspell
shopt -s dotglob
shopt -s nocaseglob
shopt -s histappend
shopt -s checkwinsize
set -o vi
# History options
HISTCONTROL=ignoreboth
HISTSIZE=55000
HISTFILSIZE=55000

### Aliases
# Shortcuts
alias p='sudo apt'
alias f='fg'
alias v='vim'
alias vp='vimpager'
alias d='date +"%d-%m-%y %H:%M"'
alias qping='ping www.google.com -c 3'
alias l='ls -F --color=always --group-directories-first'
alias la='ls -AF --color=always --group-directories-first'
alias ll='ls -alF --color=always --group-directories-first'
alias gitreorg='git remote rm origin &&  git remote add origin link'
alias gitcompush='read -p "Git Message: " MSG && git commit -m "$MSG" && git push'

### Prompt for desktop and console
if pgrep -x Xorg > /dev/null
then
	# Color variables
	SETUNDO='\e[0m'
	SETLPUR='\e[38;5;15m\e[48;5;135m'
	SETDPUR='\e[38;5;15m\e[48;5;55m'
	SETL2DPUR='\e[38;5;55m\e[48;5;135m'
	SETD2LPUR='\e[38;5;135m\e[48;5;55m'
	SETLPUREND="$SETUNDO"'\e[38;5;135m'
	SETDPUREND="$SETUNDO"'\e[38;5;55m'
	# Set prompt
	PS1=$(printf "\
${SETDPUREND}${SETDPUR}$USER${SETL2DPUR}\
${SETLPUR} \A ${SETL2DPUR}\
${SETDPUR}\w${SETDPUREND}${SETUNDO}\n\
${SETDPUREND} ${SETDPUR}exec${SETDPUREND}${SETUNDO} ")
else
	PS1=$(printf "|$USER > \A < \W >\n||exec >> ")
fi
