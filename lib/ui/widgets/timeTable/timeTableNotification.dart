import 'package:get/get.dart';
import 'package:schedule_app/core/controller/settingsController.dart';
import 'package:schedule_app/core/services/notificationServices.dart';
import 'package:schedule_app/data/models/timeTableModel.dart';

final ImpSettingsController settingsController =
    Get.find<ImpSettingsController>(); //selectedCurrentAlarmBeforRadioValue
void notification(TimeTable timeTable) {
  List<String> timeComponents = timeTable.start_time.toString().split(' ');
  String day = timeTable.repeatDays!; // "Thu"
  String time = timeComponents[1]; // "22:10"
  // print("amPm = $amPm");
  int minutes = int.parse(time.split(":")[1]);
  int hour = int.parse(time.split(":")[0]);
  timeTable.notification == 1
      ? {
          // print("day = $day"),
          // print("time = $time"),
          // print("minutes = $minutes"),
          // print("hour = $hour"),
          // print("timeComponents of time table = $timeComponents")
        }
      : print("no notification");
  if (settingsController.selectedCurrentAlarmBeforRadioValue! > minutes) {
    if (settingsController.selectedCurrentAlarmBeforRadioValue == 60) {
      if (hour == 0) {
        hour = 23;
      } else {
        hour = hour - 1;
      }
    } else {
      minutes = 60 +
          minutes -
          settingsController.selectedCurrentAlarmBeforRadioValue!;
      if (hour == 0) {
        hour = 23;
      } else {
        hour = hour - 1;
      }
    }
  } else {
    minutes = minutes - settingsController.selectedCurrentAlarmBeforRadioValue!;
  }
  // if (amPm == "PM") {
  //   hour = hour + 12;
  // } else if (amPm == "AM" && hour == 12) {
  //   hour = 00;
  // }
  timeTable.notification == 1
      ? LocalNotifications.showScheduleNotificationForTimeTable(
          timeTable: timeTable,
          minutes: minutes,
          hour: hour,
          days: [getDayNumber(day)])
      : LocalNotifications.cancelSpecific(timeTable.id! + 888888);
  ;
}

int getDayNumber(String dayShortcut) {
  final Map<String, int> dayMapping = {
    'Mon': 1,
    'Tue': 2,
    'Wed': 3,
    'Thu': 4,
    'Fri': 5,
    'Sat': 6,
    'Sun': 7,
  };

  final normalizedDay = dayShortcut.substring(0, 3);

  return dayMapping[normalizedDay] ?? -1; // Return -1 for invalid input
}
