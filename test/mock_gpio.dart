import 'package:mockito/mockito.dart';
import 'package:rpi_gpio/gpio.dart';
import 'package:test/test.dart';

import '../utilities/output_app.dart';

class MockGpio extends Mock implements Gpio {}

/// This code is a test case for the `unlockLock` function.
/// It creates a `MockGpio` object and a `PinMock` object.
/// It sets up the necessary mock behavior using the `when` method.
/// Then, it calls the `unlockLock` function with the `MockGpio` object.
/// Finally, it verifies that the expected methods were called on the mock objects.
/// This code is located in the file "mock_gpio.dart".
void main() {
  test('unlockLock', () async {
    final gpio = MockGpio();
    final pin = PinMock();

    /// Sets up a mock behavior for the GPIO output pin.
    ///
    /// This method mocks the behavior of the GPIO output pin specified by [lockPinInt].
    /// It sets the pin to return the value of [pin] when accessed.
    ///
    /// Example usage:
    /// ```dart
    /// when(gpio.output(lockPinInt)).thenReturn(pin);
    /// ```
    when(gpio.output(lockPinInt)).thenReturn(pin);

    await unlockLock(gpio);

    verify(gpio.output(lockPinInt)).called(1);
    verify(pin.value = false).called(1);
    verify(pin.value = true).called(1);
    verify(gpio.dispose()).called(1);
  });
}

class PinMock extends Mock implements GpioOutput {}
