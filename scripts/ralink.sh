#!/bin/bash

#####
# This focuses on the RaLink adapter
#####

rm /opt/pavlov/listen/ralink*
ra_interface=$(airmon-ng | grep -i ralink | awk ' $2 ~ /wlan[0-9]+/ { print $2 }')
airmon-ng start $ra_interface
ra_monitor=$(airmon-ng | grep -i ralink | awk ' $2 ~ /wlan[0-9]+/ { print $2 }')
airodump-ng --output-format netxml -w /opt/pavlov/listen/ralink_output $ra_monitor
