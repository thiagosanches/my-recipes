#!/bin/bash

function randpw() { < /dev/urandom tr -dc _A-Z-a-z-0-9 | head -c"${1:-20}" | sed 's/[DdSsEeFfQqCc64Ll]/!/g'; echo; }
randpw "$@"
