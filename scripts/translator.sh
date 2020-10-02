#!/bin/bash
#This shell script will take the output of Airodump and mux it to a Splunk parseable file

#####
# RaLink Files
#####
cat /opt/pavlov/listen/ralink_output-01.kismet.netxml | sed -e 's/\t//g' | sed -e 's/></>\n</g' > /opt/pavlov/listen/ralink_fullkali.netxml
sed -n '/<wireless-client/,/<\/wireless-client>/p' /opt/pavlov/listen/ralink_output-01.kismet.netxml | sed -e 's/\t//g' | sed -e 's/></>\n</g' > /opt/pavlov/listen/ralink_kali.netxml

#####
# Alfa Files
#####
cat /opt/pavlov/listen/alfa_output-01.kismet.netxml | sed -e 's/\t//g' | sed -e 's/></>\n</g' > /opt/pavlov/listen/alfa_fullkali.netxml
sed -n '/<wireless-client/,/<\/wireless-client>/p' /opt/pavlov/listen/alfa_output-01.kismet.netxml | sed -e 's/\t//g' | sed -e 's/></>\n</g' > /opt/pavlov/listen/alfa_kali.netxml


#####
# Update File Permissions
#####

chown root:splunk /opt/pavlov/listen/ralink_fullkali.netxml
chown root:splunk /opt/pavlov/listen/ralink_kali.netxml
chown root:splunk /opt/pavlov/listen/alfa_fullkali.netxml
chown root:splunk /opt/pavlov/listen/alfa_kali.netxml



