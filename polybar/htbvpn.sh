#!/bin/bash

VPNON=$(ip a | grep 'tun0:' | awk '{print $2}' | tr -d ':')

if [ "$VPNON" = "tun0" ]; then
        echo " %{F#2ecc71}󰚯 %{F#fdfefe}$(ip a | grep -A2 'tun0:' | grep 'inet ' | awk '{print $2}' | cut -d '/' -f 1) "
else
        echo " %{F#f44336}󰌺 %{F#C4C7C5}Disconnected "
fi