#!/bin/bash

# Load script for Mortality viewer

sleep 20
date

echo "loading mortality viewer"

cd /home/pi/.virtualenvs/cv
source bin/activate

echo "cv environment activated"

echo "starting face detection script"
watch -n1 /home/pi/mortality/detect_faces.sh >> /home/pi/detect_faces.log &

cd /home/pi/mortality
python -m http.server &

echo "web server starting"

sleep 5

echo "chromium kiosk starting"
date
echo "|---------------------------------|"

chromium-browser --kiosk http://localhost:8000