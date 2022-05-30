#! /bin/bash

# path to AirPort binary
# HIGHLY recommend aliasing this to "airport" for simplicity
# add "alias airport='path/you/see/below'" to your .zshrc file
airport=("/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport")

# this gets us the SSID (Broadcast name) of the current network
SSID=$($airport --getinfo | grep -w "SSID:" | awk '/SSID/ {print substr($0, index($0,$2))}')

# gets us the password for the current network, prompt for the keychain owner's credentials
# those would be your login creds in most cases
security find-generic-password -D "AirPort network password" -a $SSID -g | grep "password:" | awk '/password/ {print substr($0, index($0,$2))}'
