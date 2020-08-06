#!/bin/bash



#sudo cp -rv * /var/www/html/
sudo rsync --exclude "node_modules" -vuhr * /var/www/html/

echo -e "Done"