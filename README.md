# Xbox Wireless Headset Selector (meeting or music mode)

This repository has been created only for the Xbox Wireless Headset that cannot be correctly used by default on Ubuntu.

In my case my headset randomly disconnects/reconnects, that is really boring when I'm in a meeting.

The workaround is based on 2 main things:
* The use of PipeWire (instead of PulseAudio) that works pretty well with the bluetooth headsets on Ubuntu and supports A2DP/mSBC codecs. 
  
  More details: 
  * https://www.guyrutenberg.com/2021/03/11/replacing-pulseaudio-with-pipewire/
  * https://lwn.net/Articles/847412/
  * https://askubuntu.com/questions/1339765/replacing-pulseaudio-with-pipewire-in-ubuntu-20-04
* The need to switch between A2DP (for good output quality, but no mic at all) and mSBC (bad output quality, but the mic can be used). 
  
  More details: https://askubuntu.com/questions/1004712/how-to-keep-the-audio-profile-at-a2dp-while-using-a-mic-with-bluetooth-headset


So we must switch manually A2DP<->mSBC, depending on:
* if we want to enable the mic (with a bad output quality) for a meeting (mSBC)
* or if we want to mainly listen music (better output quality) (A2DP)

Instead of opening the Ubuntu Settings/Sound Menu, I created a small script to switch by clicking on 2 buttons : 'Music mode' and 'Meeting mode'

## Requirements for the script
* Ubuntu 21.04
* PipeWire instead of PulseAudio
    * Follow the steps described here to install PipeWire: https://github.com/pipewire-debian/pipewire-debian/wiki

* Python 3.X

* tkinter
```shell
apt-get install python3-tk
```
```shell
chmod u+x switch_ui.py switch_cli.sh
```

## Run the script
./switch_ui.py