date
echo "detecting faces"

source /home/pi/.profile

if hash workon 2>/dev/null; then
  workon cv
  sleep 2

python detect_faces.py