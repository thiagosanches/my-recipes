#!/bin/bash

showMessage(){
  # Adding some color to the script :)
  ESC_SEQ="\x1b["
  RESET=$ESC_SEQ"39;49;00m"
  A=$ESC_SEQ"32;01m"
  echo -e "$A$1$RESET"
}
