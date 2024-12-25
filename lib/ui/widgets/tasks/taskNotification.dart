import 'package:get/get.dart';
import 'package:schedule_app/core/controller/settingsController.dart';
import 'package:schedule_app/core/services/notificationServices.dart';
import 'package:schedule_app/data/models/taskModel.dart';

final ImpSettingsController settingsController =
    Get.find<ImpSettingsController>(); //selectedCurrentAlarmBeforRadioValue
void notificationOfTask(Task task) {
  List<String> timeComponents = task.time.toString().split(' ');
  // print("timeComponents =================> $timeComponents");
  String time = timeComponents[2]; // "2:52"
  String amPm = timeComponents[3]; // "PM"
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
  task.notification == 1
      ? LocalNotifications.showScheduleNotificationForTask(
          task: task, minutes: minutes, hour: hour)
      : LocalNotifications.cancelSpecific(task.id! + 444444);
  ;
}
