#!/bin/bash
clear

# The start of most of the script files are the same so i am moving that here and calling this file

# 1. compile CSS
printf "Compiling CSS file\n"
sass -c universalSCSS/style.scss:universalSCSS/raw_style.css
printf "\nCSS file compiled\n"

# 2. Apply auto-prefixer
printf "\nApplying auto-prefixer\n"
npx postcss universalSCSS/raw_style.css --use autoprefixer -o universalCSS/style.css
read -p "Auto-prefixer compiled"

OSNAME=$(grep -i "^name" /etc/os-release | cut -d= -f2 | sed "s/\"//g" )


# purpose: to assing a var that is the lamp location ... that way i can use that var and just use that in the rsync line ..
# THE POINT: to have one file for the bash script and not one for each distro
case $OSNAME in

  "openSUSE Tumbleweed") LAMPLocal="/srv/www/htdocs/" ;;

  "Solus") LAMPLocal="/var/www/" ;;

  "Ubuntu") LAMPLocal="/var/www/html/" ;;

esac

clear
printf "About to move EVERYTHING to the LAMP directory"
sudo rsync --exclude-from "devScripts/excludelist.txt" -ruhv ./* $LAMPLocal

echo -e "Done"


#  Cleanup
rm universalSCSS/raw_style*
rm universalSCSS/*.css*
