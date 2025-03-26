#!/bin/bash

# Function to stop the Watson activity
stop_watson() {
    echo "Stopping Watson activity..."
    watson stop
    exit 0
}

# Trap SIGINT (Ctrl + C) and call stop_watson
trap stop_watson SIGINT

clear
# Start the Watson activity
activity="$1"
echo "Starting Watson activity: $activity"
watson start "$activity"

while true; do
    sleep 60
    watson status
done

