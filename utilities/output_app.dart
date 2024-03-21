//import 'package:rpi_gpio/gpio.dart';

import 'dart:io';

import '../routes/open.dart';

const int lockPinInt = 12;
DateTime? lastUnlock;

Future<void> unlockLock() async {
  final now = DateTime.now();
  try {
    print('blink opened.');
    runBlink();
    print('blink.py finished');
  } catch (e) {
    throw Exception(e);
  }

  //final lockPin = gpio.output(lockPinInt);
  //lockPin.value = false;
  //await Future<void>.delayed(const Duration(seconds: 1));
  //lockPin.value = true;
  //await gpio.dispose();
  lastUnlock = now;
}
