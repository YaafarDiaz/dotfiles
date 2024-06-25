#/bin/bash

HTBNAME=$(cat ~/.config/polybar/htb/targname)
HTBIP=$(cat ~/.config/polybar/htb/targip)
VPNON=$(ip a | grep 'tun0:' | awk '{print $2}' | tr -d ':')
LOGO=""



if [ -n "$HTBNAME" ] && [ -n "$HTBIP"  ] && [ "$VPNON" = "tun0" ]; then
        TTL=$(ping -c1 $HTBIP | grep 'ttl' | awk '{print $6}' | cut -d '=' -f 2)

        if [ "$TTL" -le 80 ]; then
                LOGO=" %{F#2ecc71}%{F#FFFFFF} Linux:"
        elif [ "$TTL" -gt 80 ] && [ "$TTL" -le 180 ]; then
                LOGO=" %{F#2ecc71}󰨡%{F#FFFFFF} Windows:"
        elif [ "$TTL" -gt 180 ]; then
                LOGO=" %{F#2ecc71}󰬍%{F#FFFFFF} FreeDBS:"
        fi
        echo "$LOGO %{F#5dade2}$HTBNAME%{F#FFFFFF} $HTBIP "
else
        echo "" > ~/.config/polybar/htb/targname
        echo "" > ~/.config/polybar/htb/targip
        echo " %{F#f44336} %{F#C4C7C5}No target "
fi