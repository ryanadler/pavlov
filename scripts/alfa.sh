#!/bin/bash

#####
# This focuses on the Alfa adapter
#####

rm /opt/pavlov/listen/alfa*
alfa_interface=$(airmon-ng | grep -i realtek | awk ' $2 ~ /wlan[0-9]+/ { print $2 }')
airmon-ng start $alfa_interface
alfa_monitor=$(airmon-ng | grep -i realtek | awk ' $2 ~ /wlan[0-9]+/ { print $2 }')
airodump-ng --output-format netxml -w /opt/pavlov/listen/alfa_output $alfa_monitor
