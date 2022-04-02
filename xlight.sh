#!/usr/bin/bash

CURBRIGHTNESS=$(xrandr --verbose | grep Bright | cut -d " " -f2 | head -n 1)
OFFSET=$(expr 0.01*$1 | bc)
NEWBRIGHTNESS=$(expr $CURBRIGHTNESS+$OFFSET | bc)

if (( $(bc <<< "$NEWBRIGHTNESS > 0.0") )) && (( $(bc <<< "$NEWBRIGHTNESS < 1.0") ));
then
    for MON in $(xrandr --verbose | grep connected | cut -d " " -f1); do
        xrandr --output $MON --brightness $NEWBRIGHTNESS
    done
fi
