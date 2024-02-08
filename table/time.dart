import 'dart:convert';
import 'dart:io';

void setTimeJsonTable(String time) {
  print('timeset function reached');
  final timeString = jsonEncode(time);
  try {
    File('time.json').writeAsStringSync(timeString);
  } on Exception catch (e) {
    throw Exception(e);
  }
}

String getTime() {
  // Read the file as a string
  final timeString = File('time.json').readAsStringSync();

  // Convert the string from JSON to a string
  final time = jsonDecode(timeString) as String;

  return time;
}
