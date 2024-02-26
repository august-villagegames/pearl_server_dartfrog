# blink.py
import RPi.GPIO as GPIO
import time

message = "gpio py file reached"

GPIO.setmode(GPIO.BCM)
GPIO.setup(18, GPIO.OUT)
print(message)
GPIO.output(18, GPIO.HIGH)
time.sleep(1)
GPIO.output(18, GPIO.LOW)


GPIO.cleanup()