#!/bin/bash

sudo rsync --exclude "node_modules" -ruhv * /srv/http

echo -e "Done"
