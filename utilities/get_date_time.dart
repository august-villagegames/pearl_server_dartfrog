bool checkDayAndTimeMatch({
  required String scheduledTimeString,
  required Map<String, bool> scheduledWeekdaysIntList,
}) {
  //converts map to list of integers for weekdays that are set as true
  final trueWeekdays = <int>[];
  scheduledWeekdaysIntList.forEach((weekday, isTrue) {
    if (isTrue) {
      switch (weekday) {
        case 'Monday':
          trueWeekdays.add(1);
        case 'Tuesday':
          trueWeekdays.add(2);
        case 'Wednesday':
          trueWeekdays.add(3);
        case 'Thursday':
          trueWeekdays.add(4);
        case 'Friday':
          trueWeekdays.add(5);
        case 'Saturday':
          trueWeekdays.add(6);
        case 'Sunday':
          trueWeekdays.add(7);
      }
    }
  });

  final scheduledTimeList = scheduledTimeString.split(':');
  final hour = int.parse(scheduledTimeList[0]);
  final minutes = int.parse(scheduledTimeList[1]);

  DateTime getCurrentTime() {
    return DateTime.now();
  }

  int getCurrentWeekday() {
    return DateTime.now().weekday;
  }

  if (getCurrentTime().hour == hour &&
      getCurrentTime().minute == minutes &&
      trueWeekdays.contains(getCurrentWeekday())) {
    return true;
  } else {
    return false;
  }
}
