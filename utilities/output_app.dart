//import 'package:rpi_gpio/gpio.dart';

import 'dart:io';

const int lockPinInt = 12;
DateTime? lastUnlock;

Future<void> unlockLock() async {
  final now = DateTime.now();
  try {
    final process =
        await Process.run('sudo', ['python3', 'utilities/blink.py']);
    print(process.stdout);
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
