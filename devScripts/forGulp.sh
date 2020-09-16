#!/bin/bash
clear

# run gulp tasks
gulp compile

#############################################################################

# The start of most of the script files are the same so i am moving that here and calling this file
OSNAME=$(grep -i "^name" /etc/os-release | cut -d= -f2 | sed "s/\"//g" )


# purpose: to assing a var that is the lamp location ... that way i can use that var and just use that in the rsync line ..
# THE POINT: to have one file for the bash script and not one for each distro
case $OSNAME in

  "Arch Linux") LAMPLocal="/srv/http" ;;

  "openSUSE Tumbleweed") LAMPLocal="/srv/www/htdocs/" ;;

  "Solus") LAMPLocal="/var/www/" ;;

  "Ubuntu") LAMPLocal="/var/www/html/" ;;

esac

echo -e "About to move EVERYTHING to the LAMP directory\n\n"
sudo rsync --exclude-from "devScripts/excludelist.txt" -ruhv ./* $LAMPLocal

echo -e "Done"

#  Cleanup
rm universalSCSS/raw_style*
rm universalSCSS/*.css*
