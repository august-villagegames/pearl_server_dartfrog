import 'package:dart_frog/dart_frog.dart';
import 'package:rpi_gpio/rpi_gpio.dart';

import '../utilities/output_app.dart';

Future<Response> onRequest(RequestContext context) async {
  final gpio = await initialize_RpiGpio();
  await unlockLock(gpio);
  return Response.json(body: {'message': 'open crate command received.'});
}
