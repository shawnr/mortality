#!/bin/bash

# Load script for Mortality viewer

echo "|------- Boot Initiated ----------|"
date

echo "loading mortality viewer"

cd /home/pi/.virtualenvs/cv
source bin/activate

echo "cv environment activated"

echo "starting face detection script"
# watch -n1 /home/pi/mortality/detect_faces.sh >> /home/pi/detect_faces.log &

cd /home/pi/mortality
python detect_faces.py >> /home/pi/detect_faces.log &

python -m http.server &

echo "web server starting"

sleep 2

echo "boot completed"
date
echo "|---------------------------------|"

# chromium-browser --kiosk http://localhost:8000