#!/bin/bash

clear

# 1. compile CSS
printf "Compiling CSS file\n"
sassc -m universalSCSS/style.scss universalSCSS/raw_style.css
printf "\nCSS file compiled\n"

# 2. Apply auto-prefixer
printf "\nApplying auto-prefixer\n"
npx postcss universalSCSS/raw_style.css --use autoprefixer -o universalCSS/style.css
read -p "Auto-prefixer compiled"


sudo rsync  --exclude "node_modules" --exclude "framework" --exclude "database" -ruhv * /var/www/

echo -e "Done"


#  Cleanup
rm universalSCSS/raw_style*
rm universalSCSS/*.css*
