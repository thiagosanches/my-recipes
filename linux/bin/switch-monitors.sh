#!/bin/bash

hostname=$(hostname)

if [[$hostname == "pop-os"]]
then
    adjust-monitors-at-home.sh
fi