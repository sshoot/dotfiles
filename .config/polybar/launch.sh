#!/bin/bash

# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use 
# polybar-msg cmd quit

while pgrep -x polybar > /dev/null; do sleep 1; done

# Launch Polybar, using default config location ~/.config/polybar/config

screens=$(xrandr --listactivemonitors | grep -v "Monitor" | cut -d" " -f6)

if [[ $(xrandr --listactivemonitors | grep -v "Monitors" | cut -d" " -f4 | cut -d"+" -f2- | uniq | wc -l) == 1 ]]; then
    MONITOR=$(polybar --list-monitors | cut -d":" -f1) polybar default &
else
    primary=$(xrandr --query | grep primary | cut -d" " -f1)

    for m in $screens; do
        if [[ $primary == $m ]]; then
            MONITOR=$m polybar default &
        else
            MONITOR=$m TRAY_POS=none polybar "HDMI-1" &
        fi
    done
fi

# polybar default 2>&1 | tee -a /tmp/polybar.log & disown

echo "Polybar launched..."
