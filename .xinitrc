# Xinitrc

# Set monitor res
xrandr --newmode "1366x768_60.00"   85.25  1368 1440 1576 1784  768 771 781 798 -hsync +vsync
xrandr --addmode HDMI1 1366x768_60.00
xrandr --output HDMI1 --mode 1366x768_60.00
# Hide mouse
unclutter -idle 1 &
# Start compositor
picom &
# Set bg
feh --bg-scale ~/.bg.png
# Switch caps w/ ctrl
setxkbmap -option ctrl:swapcaps
# Execute xmonad wm
exec /usr/bin/xmonad
