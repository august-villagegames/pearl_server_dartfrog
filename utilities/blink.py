# blink.py
import RPi.GPIO as GPIO
import time

GPIO.setwarnings(False)

GPIO.setmode(GPIO.BCM)
GPIO.setup(18, GPIO.OUT)

GPIO.output(18, 1)
time.sleep(1)
GPIO.output(18, 0)
time.sleep(1)
    

GPIO.cleanup()
