#!/bin/bash

<<'###ABOUT-THIS-SCRIPT'
This script is a bash script for restarting my Immersed VR agent on Mac. 

Recommendation is to keybind this script to a key on your keyboard, for me I use
the program Alfred to do this. 
###ABOUT-THIS-SCRIPT

if pgrep -x "Immersed" > /dev/null
then
    echo "Running - Restarting"
    # Run Firefox browser application launch application
    killall Immersed
    sleep 3
    adb devices && adb reverse tcp:21000 tcp:21000 && adb reverse --list
    open /Applications/Immersed.app

else
    echo "Not running - starting up"
    # Run Immersed application
    adb devices && adb reverse tcp:21000 tcp:21000 && adb reverse --list
    open /Applications/Immersed.app
fi