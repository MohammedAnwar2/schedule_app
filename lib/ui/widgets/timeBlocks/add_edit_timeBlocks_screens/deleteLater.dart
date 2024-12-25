import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:schedule_app/core/controller/timeBlocks/timeBlocksDatabaseController.dart';
import 'package:schedule_app/core/services/notificationServices.dart';

final timeBlocksDatabaseController =
    Get.find<ImpTimeBlocksDatabaseController>();

void deleteTimeBlocksLater() {
  for (int i = 0; i < timeBlocksDatabaseController.timeBlocks.length; i++) {
    if (compareDates(timeBlocksDatabaseController.timeBlocks[i].start_time!)) {
      timeBlocksDatabaseController.deleteTimeBlocks(
          id: timeBlocksDatabaseController.timeBlocks[i].id!);
      LocalNotifications.cancelSpecific(
          timeBlocksDatabaseController.timeBlocks[i].id! + 111111);
    }
  }
}

bool compareDates(String userSelectedDate) {
  // Parse the user-selected and current dates
  DateTime userDate = DateFormat('MMM d h:mm a').parse(userSelectedDate);
  DateTime currentDateParsed =
      DateFormat('MMM d h:mm a').parse(getCurrentFormattedTime());

  // Calculate the date 16 days ago from the current date
  DateTime sixteenDaysAgo = currentDateParsed.subtract(Duration(days: 16));

  // Compare the user-selected date with the calculated date
  if (userDate.isBefore(sixteenDaysAgo)) {
    return true;
  } else {
    return false;
  }
}

String getCurrentFormattedTime() {
  DateTime now = DateTime.now();
  return DateFormat('MMM d h:mm a').format(now);
}
