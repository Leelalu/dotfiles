# Xinitrc

# Set monitor res
xrandr --newmode "1366x768_60.00"   85.25  1368 1440 1576 1784  768 771 781 798 -hsync +vsync
xrandr --addmode HDMI1 1366x768_60.00
xrandr --output HDMI1 --mode 1366x768_60.00
xrandr --output HDMI1 --mode 1366x768_60.00 --primary --auto --output eDP1 --mode 1366x768 --left-of HDMI1 --auto
# Hide mouse
unclutter -idle 1 &
# Start compositor
picom &
# Set bg
feh --bg-scale $(ls -d ~/Documents/wp/* | shuf -n 1)
# Set xmodmap options
xmodmap .xmodmap
# Xset options
xset s 1000
# Start emacsclient
emacsclient --daemon
# Execute xmonad wm
exec /usr/bin/xmonad
