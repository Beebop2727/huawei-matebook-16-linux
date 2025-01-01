#!/bin/bash

case "$1" in
    post)
        # This runs after the system resumes from suspension
        echo "Enabling Bluetooth after resume..."
        rfkill block bluetooth
        sleep 3
        rfkill unblock bluetooth
        systemctl start bluetooth
        ;;
esac
