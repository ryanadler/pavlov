#!/bin/bash

#####
# This entry is called by root crontab every 30 minutes, killing the airodump processes running, and resetting the adapters to avoid stale connections.
#####

PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/opt/pavlov/scripts
pkill airodump-ng
pkill screen
sleep 2

/usr/bin/screen -dmSs ralink /opt/pavlov/scripts/ralink.sh
/usr/bin/screen -dmSs alfa /opt/pavlov/scripts/alfa.sh
