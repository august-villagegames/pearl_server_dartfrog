import 'package:rpi_gpio/rpi_gpio.dart';

class SingletonRpiGpio {
  SingletonRpiGpio._(this.gpio);
  RpiGpio gpio;

  Future<RpiGpio> initializeRpiGpio() async {
    final gpio = await initialize_RpiGpio();
    return gpio;
  }

  RpiGpio getGpio() {
    if (gpio == null) {}
    return gpio;
  }
}


  // RpiGpio gpio = ;

  // // how do singletons work?
  // SingletonRpiGpio._internal();

  // factory SingletonRpiGpio() {
  //   return _singleton;
  // }

  // Future<void> init() async {
  //   gpio = await initializeRpiGpio();
  // }

// Future<RpiGpio> initializeRpiGpio() async {
//   // Initialize your RpiGpio here...
//   final gpio = await initialize_RpiGpio();
//   return gpio;