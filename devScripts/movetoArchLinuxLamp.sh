#!/bin/bash

clear

# 1. compile CSS
printf "Compiling CSS file\n"
sass -c universalSCSS/style.scss:universalSCSS/raw_style.css
printf "\nCSS file compiled\n"

# 2. Apply auto-prefixer
printf "\nApplying auto-prefixer\n"
npx postcss universalSCSS/raw_style.css --use autoprefixer -o universalCSS/style.css
read -p "Auto-prefixer compiled"

# Move to LAMP folder (on arch) for testing
# This line will be a problem on different distros the way I have it now
clear
printf "About to move EVERYTHING to the LAMP directory"
sudo rsync --exclude "node_modules" -ruhv * /srv/http

printf "\n\nCleaning up extra files\n"
#  Cleanup
rm universalSCSS/raw_style*

printf "DONE"
clear
