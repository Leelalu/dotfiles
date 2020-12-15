#set monitor res
xrandr --newmode "1366x768_60.00"   85.25  1368 1440 1576 1784  768 771 781 798 -hsync +vsync
xrandr --addmode HDMI1 1366x768_60.00
xrandr --output HDMI1 --mode 1366x768_60.00
#hide mouse
unclutter -idle 1 &
#start compositor
picom &
#set bg
feh --bg-scale ~/.bg.png
#switch caps w/ ctrl
setxkbmap -option ctrl:swapcaps
#execute xmonad wm
exec /usr/bin/xmonad
