#! /bin/bash

minutes=$(uptime -s | cut -d ":" -f 2)
secondes=$(uptime -s | cut -d ":" -f 3)

# - On veut recuperer le temps passes dans les 10 premieres minutes :
# - Si on demarre a 10:44:00,
# on doit recuperer les 4 minutes pour envoyer
# le prochain message a 10:50:00 + la difference qui est de 00:04:00
# cela nous permet d'atteindre 10:54:00 et respecter la consigne :
# " At server startup, the script will display some information
# (listed below) on all terminals every 10 minutes "
top=$(bc <<< $minutes%10*60+$secondes)

sleep $top