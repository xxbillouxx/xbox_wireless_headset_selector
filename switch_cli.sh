#!/bin/bash

echo "switch $1"

PROFILE=""

if [ "$1" == "meeting" ] ; then
  PROFILE="headset-head-unit-msbc"
fi;
if [ "$1" == "music" ] ; then
  PROFILE="a2dp-sink"
fi;

CARD_NAME=`pactl list cards | grep -B8 "device.description = \"Xbox Wireless Headset\"" | head -1 | cut -f2 -d":"`
if [ "$CARD_NAME" == "" ] ; then echo "Xbox Wireless Headset not found."; $0 reset; sleep 2; exit; fi
echo "set profile $PROFILE for card $CARD_NAME"
pactl set-card-profile $CARD_NAME $PROFILE

SOURCE_NAME=`pactl list sources | grep -B23 "device.description = \"Xbox Wireless Headset\"" | head -1 | cut -f2 -d":"`
if [ "$SOURCE_NAME" == "" ] ; then echo "Xbox Wireless Headset not found."; $0 reset; sleep 2; exit; fi
echo "Switching audio input to $SOURCE_NAME";
pactl set-default-source $SOURCE_NAME || echo 'Try `pactl list sources`.';
 
