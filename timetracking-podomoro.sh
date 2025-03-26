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

# Pomodoro settings
work_duration=1500  # 25 minutes
short_break=300     # 5 minutes
long_break=1800     # 30 minutes
pomodoros=0

# Start the Watson activity
activity="$1"
echo "Starting Watson activity: $activity"

while true; do
    # Start work session
    echo "Starting Pomodoro #$((pomodoros + 1))"
    watson start "$activity"
    sleep $work_duration
    watson stop
    echo "Pomodoro #$((pomodoros + 1)) complete!"

    # Increment pomodoros count
    pomodoros=$((pomodoros + 1))

    # Determine break type
    if (( pomodoros % 4 == 0 )); then
        echo "Taking a long break..."
        sleep $long_break
    else
        echo "Taking a short break..."
        sleep $short_break
    fi

    # Clear the screen for the next session
    clear
done
