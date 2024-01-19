#!/bin/bash

STATE_FILE="/var/run/keepalived.INSTANCE.*.state"
STATE=$(tail -n1  $STATE_FILE | awk '{print $9}')
LAST_MODIFIED=$(stat -c %Y $STATE_FILE)
CURRENT_TIME=$(date +%s)
DIFFERENCE=$(( CURRENT_TIME - LAST_MODIFIED ))

if [ $STATE = "FAULT" ] && [ $DIFFERENCE -gt 15 ]; then
    systemctl restart keepalived
    echo "[$(date +"%a %b %e %X %Y")]" "Keepalived has been restarted "
fi
