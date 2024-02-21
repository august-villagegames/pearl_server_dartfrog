import 'package:rpi_gpio/gpio.dart';

const int lockPinInt = 12;
DateTime? lastUnlock;

Future<void> unlockLock(Gpio gpio) async {
  final now = DateTime.now();
  final lockPin = gpio.output(lockPinInt);
  lockPin.value = false;
  await Future<void>.delayed(const Duration(seconds: 1));
  lockPin.value = true;
  await gpio.dispose();
  lastUnlock = now;
}
