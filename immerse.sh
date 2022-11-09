#!/bin/bash
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