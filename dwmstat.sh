#!/bin/bash

ljust(){
 strOutput=$1
 strCount="${#1}"
 strOffset=$(expr $2-$strCount | bc)

 while [[ 1 -le $strOffset ]]
 do
  strOutput="${strOutput} "
  strOffset=$(( $strOffset-1 ))
 done

 echo "$strOutput"
}

retreiveNewTime(){
 while
  NEWTIME=$(date "+%H:%M:%S %Z")
  [ "$1" == "$NEWTIME" ]
 do true; done

 echo $NEWTIME
}

while true; do
 CPU=$(ljust $(top -bn1 | grep Cpu | awk '{print $2}')% 5)
 TEMP=$(ljust $(sensors |  grep temp |awk  '{print $2}' |  grep -Eo '[0-9]+' | head -n1)C 4)

 RAMTOTAL=$(vmstat -s -S m | grep 'total memory' | awk '{print $1;}')
 RAMUSED=$(vmstat -s -S m | grep 'used memory' | awk '{print $1;}')
 RAM=$(ljust "$RAMTOTAL/$RAMUSED" 9)

 BATT=$(ljust $(upower -i `upower -e | grep 'BAT'` | grep percent |  awk  '{print $2}') 4)
 VOL=$(ljust $(amixer sget Master | awk -F"[][]" '/Left:/ { print $2 }') 4)
 XBRIGHTNESS=$(xrandr --verbose | grep Bright | cut -d " " -f2 | head -n 1)
 BRIGHTNESS=盛$(ljust $(expr $XBRIGHTNESS*100 | bc | cut -d "." -f1)% 4)

 DATE=$(date "+%d-%m-%y")
 TIME=$(retreiveNewTime $OLDTIME)

 xsetroot -name "| $CPU $TEMP $RAM   $BATT $VOL $BRIGHTNESS   $DATE $TIME "
 OLDTIME=$TIME
done
