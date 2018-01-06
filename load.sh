# Load script for Mortality viewer
date

echo "loading mortality viewer"

source /home/pi/.profile

if hash workon 2>/dev/null; then
  workon cv
  sleep 2

cd /home/pi/mortality
python -m http.server &

sleep 2

chromium-browser --kiosk http://localhost:8000