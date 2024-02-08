import 'dart:convert';
import 'dart:io';

void setWeekdaysJsonTable(Map<String, bool> weekdays) {
  print('weekday set function reached');
  final mapJson = jsonEncode(weekdays);
  try {
    File('weekdays.json').writeAsStringSync(mapJson);
  } catch (e) {
    throw Exception(e);
  }
}

Map<String, bool> getWeekdays() {
  // Read the file as a string
  final mapJson = File('weekdays.json').readAsStringSync();

  // Convert the string from JSON to a map
  final map = jsonDecode(mapJson) as Map<String, dynamic>;

  // Convert the map values to bool
  final weekdays = map.map((key, value) => MapEntry(key, value as bool));

  return weekdays;
}
