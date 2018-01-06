import io
import picamera
import cv2
import numpy
import json

stream = io.BytesIO()

with picamera.PiCamera() as camera:
    camera.resolution = (320,240)
    camera.capture(stream, format='jpeg')

buff = numpy.fromstring(stream.getvalue(), dtype=numpy.uint8)

image = cv2.imdecode(buff, 1)

face_cascade = cv2.CascadeClassifier('faces.xml')

gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)

faces = face_cascade.detectMultiScale(gray, 1.1, 5)

result_text = "Found " + str(len(faces)) + " face(s)."
print(result_text)

for (x,y,w,h) in faces:
    cv2.rectangle(image, (x,y), (x+w, y+h), (255, 255, 0), 2)

cv2.imwrite('result.jpg', image)

file = open('faces.json', 'w')
face_data = { 'num': len(faces), 'debug': False }
json.dump(face_data, file)
