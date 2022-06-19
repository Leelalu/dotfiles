### Xinitrc

### Monitor setup
xrandr --newmode "1366x768_60.00"   85.25  1368 1440 1576 1784  768 771 781 798 -hsync +vsync
xrandr --addmode HDMI1 1366x768_60.00
xrandr --output HDMI1 --mode 1366x768_60.00
xrandr --output HDMI1 --mode 1366x768_60.00 --primary --auto --output eDP1 --mode 1366x768 --left-of HDMI1 --auto

### Visuals
# Start compositor
picom &
# Set bg
bash -c '
WALLPAPERFILES=($(ls -1 ~/Documents/wp/*.jpg))
feh --bg-scale ${WALLPAPERFILES[$((0 + $RANDOM % $(("${#WALLPAPERFILES[@]}"-1))))]}
'
# X screenblank off
xset s off -dpms

# Hide mouse
unclutter -idle 1 &

### Sets dwm status
dwmstat.sh &
# Execute window manager
while true;
do
    dwm;
done
