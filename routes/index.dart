#!/usr/bin/env dart

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:dart_frog/dart_frog.dart';
import 'package:rpi_gpio/gpio.dart';
import 'package:rpi_gpio/rpi_gpio.dart';

import '../table/time.dart';
import '../table/weekdays.dart';
import '../utilities/get_date_time.dart';
import '../utilities/output_app.dart';

// Response onRequest(RequestContext context) {
//   return Response.json(body: {'message': 'POST received.'});
// }

FutureOr<dynamic> onRequest(RequestContext context) {
  print('pearl smart crate has started');
  switch (context.request.method) {
    case HttpMethod.post:
      return _post(context);
    case HttpMethod.put:
    case HttpMethod.get:
    case HttpMethod.delete:
    case HttpMethod.head:
    case HttpMethod.options:
    case HttpMethod.patch:
      return Response(statusCode: HttpStatus.methodNotAllowed);
  }
}

//save new values
Future<Response> _post(RequestContext context) async {
  // split json into days

  final request = context.request;
  final body = await request.body();

  try {
    final jsonDecoded = jsonDecode(body);
    final weekdays = jsonDecoded[0];
    //update files
    if (weekdays is Map<String, dynamic>) {
      final weekdaysMap = Map<String, bool>.from(weekdays);
      try {
        setWeekdaysJsonTable(weekdaysMap);
        // TODO: create function in another file to get and set dates
      } catch (e) {
        throw Exception(e);
      }
    } else {
      print('jsonDecoded[0] is not a map');
    }
  } catch (e) {
    print('The provided string is not valid JSON: $body');
    return Response(statusCode: HttpStatus.badRequest);
  }

  //split json into times
  try {
    final jsonDecoded = jsonDecode(body);
    final time = jsonDecoded[1];
    if (time is Map<String, dynamic> && time.containsKey('time')) {
      final timeString = time['time'] as String;
      setTimeJsonTable(timeString);
      // TODO: create function in another file to get and set time
    } else {
      print('time is not a Map or time doesnt contain the "time" key');
    }
  } catch (e) {}

  // update files

  // update main variables for main function
  //send a return response
  return Response(body: context.request.body.toString());
}

// TODO: test to make sure this works, and that it also runs constantly
Future<void> rpiFunctions() async {
  final gpio = await initialize_RpiGpio();

  Timer.periodic(const Duration(minutes: 1), (Timer t) async {
    //get date and time from tables
    final weekdaysFromTable = getWeekdays();
    final timeFromTable = getTime();
    if (checkDayAndTimeMatch(
      scheduledTimeString: timeFromTable,
      scheduledWeekdaysIntList: weekdaysFromTable,
    )) {
      try {
        await unlockLock(gpio);
      } on GpioException catch (message) {
        print(GpioException(message.toString()));
      } on Exception catch (e) {
        throw Exception(e);
      }
    } else {
      print('It is not time to open the door yet.');
    }
  });
}
