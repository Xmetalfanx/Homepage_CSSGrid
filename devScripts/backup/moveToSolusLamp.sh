#!/bin/bash




sudo rsync  --exclude "node_modules" --exclude "framework" --exclude "database" -ruhv ./* /var/www/

echo -e "Done"


#  Cleanup
rm universalSCSS/raw_style*
rm universalSCSS/*.css*
