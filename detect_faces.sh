#!/bin/bash

date
echo "detecting faces"

cd /home/pi/.virtualenvs/cv
source bin/activate

cd /home/pi/mortality
python detect_faces.py