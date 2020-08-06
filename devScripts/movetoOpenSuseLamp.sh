#!/bin/bash

sudo rsync  --exclude "node_modules" --exclude "framework" --exclude "database" -ruhv * /srv/www/htdocs/

echo -e "Done"
