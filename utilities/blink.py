# blink.py
import RPi.GPIO as GPIO
import time

message = "gpio py file reached"
GPIO.setwarnings(False)

GPIO.setmode(GPIO.BCM)
GPIO.setup(18, GPIO.OUT)
print(message)

while (True):
    GPIO.output(18, 1)
    time.sleep(1)
    GPIO.output(18, 0)


GPIO.cleanup()