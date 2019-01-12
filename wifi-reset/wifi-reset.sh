#!/bin/sh -e

# Wait ~60 seconds until SOME interface exists
while [ -z $(iwconfig 2> /dev/null | grep -o '^[[:alnum:]]\+') ]; do
    if [ $i -eq 1 ]; then
        echo "Check your wireless device. 1 minute timeout exceed.";
        exit 1;
    fi

    echo "No wireless interface yet defined.";
    i=$((i+1));
    sleep 1;
done

# Check all wifi interfaces and bring them up if needed
iwconfig 2> /dev/null | grep -o '^[[:alnum:]]\+' | while read x; do
    # check if the interface is connected to a wifi network
    essid=$(iwconfig $x | grep ESSID | awk -F: '{print $2}' | sed 's/\"//g')
    if [ ! $essid = "off/any" ]; then
        break; # if connected break
    fi

    # restart interface
    echo "Restarting $x wifi interface."
    ifdown $x;
    ifup $x

    # restart services
    systemctl restart connman.service;
done
