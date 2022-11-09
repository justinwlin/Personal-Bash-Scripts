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
    # Establish wire connection. I found this doesn't work though unless u the bash script through terminal, so I set up alfred to run this in terminal then run this bash script. 
    adb devices && adb reverse tcp:21000 tcp:21000 && adb reverse --list
    open /Applications/Immersed.app

else
    echo "Not running - starting up"
    adb devices && adb reverse tcp:21000 tcp:21000 && adb reverse --list
    # Run Immersed application
    open /Applications/Immersed.app
fi