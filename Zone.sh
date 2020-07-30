#!/bin/bash
#Vickyarts Github

if [ $# -eq 1 ];
then
     for names in $(host -t ns $1 | grep "server" | cut -d " " -f 4);
     do
        echo "Zonetransfer with $names:"
        zone=$(host -l $1 $names | grep "has address")
        if [ "$zone" = "" ];
        then
          echo "Zone Transfer Failed!"
        else
          echo "Zone Transferm Success:"
          echo "$zone"
        fi
     done
else
  echo "Usage:"
  echo "Zone.sh <website>"
  exit
fi
