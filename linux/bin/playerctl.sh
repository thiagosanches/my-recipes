#!/bin/bash

# This script is used to control media players using playerctl as a docker container exporting the D-Bus session bus address.
# It provides a simple command-line interface to play, pause, stop, and control media playback.
# It alsos clone the official repository to build the docker image.
# Usage: ./playerctl.sh {play-pause|stop|next|previous|status|metadata}

# Check if playerctl is installed and build the docker image if not present.
# If the playerctl repository is not cloned, it will clone it and build the docker image.
check_playerctl_installation() {
    ls -la ~/r/github/playerctl &> /dev/null
    if [[ $? -ne 0 ]]
    then
        echo "docker playerctl was not built."
        git clone https://github.com/altdesktop/playerctl.git ~/r/github/playerctl || echo 'Already cloned playerctl repository.'
        cd ~/r/github/playerctl
        docker build . -t playerctl || echo 'Failed to build playerctl docker image.'
    fi
}

check_playerctl_installation

# create a function _playerctl that runs docker run with the playerctl image 
# that use unix sockets to talk to dbus from the host machine.
_playerctl() {
    docker run -it --rm \
        --user $(id -u):$(id -g) \
        -e DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/$(id -u)/bus" \
        -v /run/user/$(id -u)/bus:/run/user/$(id -u)/bus \
        -v /etc/machine-id:/etc/machine-id:ro \
        playerctl \
        playerctl "$@"
}

COMMAND="$1"
case "$COMMAND" in
    play-pause)
        _playerctl play-pause
        ;;
    stop)
        _playerctl stop
        ;;
    next)
        _playerctl next
        ;;
    previous)
        _playerctl previous
        ;;
    status)
        _playerctl status
        ;;
    metadata)
        if _playerctl metadata | grep -i -q "firefox"; then
        _playerctl metadata --format '{{ title }}'
        elif _playerctl metadata | grep -i -q "spotify"; then
            _playerctl metadata --format '{{ artist }} - {{ title }}'
        else
            _playerctl metadata
        fi
        ;;
    *)
        echo "Usage: $0 {play-pause|stop|next|previous|status|metadata}"
        exit 1
        ;;
esac
