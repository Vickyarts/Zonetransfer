#!/bin/bash
#Vickyarts Github
#Contact me on Github
red='\e[1;31m'
yellow='\e[1;33m'
blue='\e[1;34m'
white='\e[1;37m'

if [ $# -eq 1 ];
then
     for names in $(host -t ns $1 | grep "server" | cut -d " " -f 4);
     do
        echo -e $yellow "Zonetransfer with $names:"
        zone=$(host -l $1 $names | grep "has address")
        if [ "$zone" = "" ];
        then
          echo -e $red "Zone Transfer Failed!"
        else
          echo -e $blue "Zone Transferm Success:"
          echo -e $white "$zone"
        fi
     done
else
  echo -e $yellow "Usage:"
  echo -e $white "Zone.sh <website>"
  exit
fi
