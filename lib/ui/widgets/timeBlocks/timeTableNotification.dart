import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:schedule_app/core/controller/settingsController.dart';
import 'package:schedule_app/core/services/notificationServices.dart';
import 'package:schedule_app/data/models/timeBlocksModel.dart';

final ImpSettingsController settingsController =
    Get.find<ImpSettingsController>(); //selectedCurrentAlarmBeforRadioValue
void notificationOfTimeBlocks(TimeBlocks timeBlocks) {
  //print("------------------->>>>> ${timeBlocks.start_time.toString()}");
  List<String> timeComponents = timeBlocks.start_time.toString().split(' ');
  String time = timeComponents[2]; // "2:52"
  String amPm = timeComponents[3]; // "PM"
  // print("--------time----------->>>>> ${timeComponents[2]}");
  // print("--------amPm----------->>>>> ${timeComponents[3]}");
  // print("--------dataOfToday----------->>>>> ${timeComponents[1]}");
  // print("--------month----------->>>>> ${timeComponents[0]}");
  // print(
  //     "--------month111----------->>>>> ${DateFormat('MMM').format(DateTime.now())}");
  // print(
  //     "--------day----------->>>>> ${DateFormat('dd').format(DateTime.now())}");
  int minutes = int.parse(time.split(":")[1]);
  int hour = int.parse(time.split(":")[0]);
  if (settingsController.selectedCurrentAlarmBeforRadioValue! > minutes) {
    if (settingsController.selectedCurrentAlarmBeforRadioValue == 60) {
      hour = hour - 1;
    } else {
      minutes = 60 +
          minutes -
          settingsController.selectedCurrentAlarmBeforRadioValue!;
      hour = hour - 1;
    }
  } else {
    minutes = minutes - settingsController.selectedCurrentAlarmBeforRadioValue!;
  }
  if (amPm == "PM") {
    hour = hour + 12;
  } else if (amPm == "AM" && hour == 12) {
    hour = 00;
  }
  // print(
  //     "timeBlocks.notification == ${timeBlocks.notification}   ---> ${timeBlocks.notification == 1}");
  // print(
  //     "timeComponents[0] == DateFormat('MMM').format(DateTime.now())   ---> ${timeComponents[0] == DateFormat('MMM').format(DateTime.now())}");
  // print(
  //     "timeComponents[1] == DateFormat('dd').format(DateTime.now())  ${timeComponents[1]} == ${DateFormat('dd').format(DateTime.now())}   ---> ${timeComponents[1] == DateFormat('dd').format(DateTime.now())}");

  timeBlocks.notification == 1
      ? LocalNotifications.showScheduleNotificationForTimeBlocks(
          month: getNumericMonth(timeComponents[0]),
          day: int.parse(timeComponents[1]),
          timeBlock: timeBlocks,
          minutes: minutes,
          hour: hour)
      : LocalNotifications.cancelSpecific(timeBlocks.id! + 111111);
  ;

  // timeBlocks.notification == 1 &&
  //         timeComponents[0] == DateFormat('MMM').format(DateTime.now()) &&
  //         timeComponents[1] == DateFormat('dd').format(DateTime.now())
  //     ? LocalNotifications.showScheduleNotificationForTimeBlocks(
  //         timeBlock: timeBlocks, minutes: minutes, hour: hour)
  //     : Container();
}

int getNumericMonth(String shortMonthName) {
  // Create a mapping between short month names and their numeric values
  Map<String, int> monthMap = {
    'Jan': 1,
    'Feb': 2,
    'Mar': 3,
    'Apr': 4,
    'May': 5,
    'Jun': 6,
    'Jul': 7,
    'Aug': 8,
    'Sep': 9,
    'Oct': 10,
    'Nov': 11,
    'Dec': 12,
  };

  // Retrieve the numeric value for the given short month name
  return monthMap[shortMonthName] ?? 0;
}
