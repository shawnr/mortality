#!/bin/bash

# Load script for Mortality viewer

sleep 20
date

echo "loading mortality viewer"

cd /home/pi/.virtualenvs/cv
source bin/activate

cd /home/pi/mortality
python -m http.server &

sleep 5

chromium-browser --kiosk http://localhost:8000