import 'package:dart_frog/dart_frog.dart';
import 'package:rpi_gpio/gpio.dart';
import 'package:rpi_gpio/rpi_gpio.dart';

import '../utilities/output_app.dart';

Future<Response> onRequest(RequestContext context) async {
  final gpio = await initialize_RpiGpio();
  try {
    await unlockLock(gpio);
  } on GpioException catch (message) {
    print(GpioException(message.toString()));
  } on Exception catch (e) {
    throw Exception(e);
  }
  return Response.json(body: {'message': 'open crate command received.'});
}
