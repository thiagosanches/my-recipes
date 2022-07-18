#!/bin/bash

function updatetitle() {
    printf "\e]2;%s\a" "$1"
}

updatetitle "$@"
