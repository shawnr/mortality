# Load script for Mortality viewer
source /home/pi/.profile

workon cv

sleep 2

cd /home/pi/mortality
python -m http.server &

sleep 2

chromium-browser --kiosk http://localhost:8000