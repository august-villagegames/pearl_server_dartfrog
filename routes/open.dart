import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:rpi_gpio/gpio.dart';
import 'package:rpi_gpio/rpi_gpio.dart';

import '../utilities/output_app.dart';

Future<Response> onRequest(RequestContext context) async {
  print('open reached');
  // RpiGpio gpio = await initialize_RpiGpio();

  // try {
  //   await unlockLock(gpio);
  //   print('open successful');
  // } on GpioException catch (message) {
  //   print(GpioException(message.toString()));
  // } on Exception catch (e) {
  //   throw Exception(e);
  // }
  // await gpio.dispose();

  try {
    final process =
        await Process.run('sudo', ['python3', 'utilities/blink.py']);
    print(process.stdout);
  } catch (e) {
    throw Exception(e);
  }
  return Response.json(body: {'message': 'open crate command received.'});
}
