import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:schedule_app/components/customTextFormValidation.dart';
import 'package:schedule_app/components/time_functions.dart';
import 'package:schedule_app/core/constants/keys.dart';
import 'package:schedule_app/core/controller/timeBlocks/timeBlocksController.dart';
import 'package:schedule_app/core/controller/timeBlocks/timeBlocksDatabaseController.dart';
import 'package:schedule_app/core/services/services.dart';
import 'package:schedule_app/data/models/timeBlocksModel.dart';
import 'dart:math';

final timeBlockscontroller = Get.find<ImpTimeBlocksController>();
final timeBlocksDatabaseController =
    Get.find<ImpTimeBlocksDatabaseController>();
String getDayName(int dayNumber) {
  switch (dayNumber) {
    case 1:
      return 'Mon';
    case 2:
      return 'Tue';
    case 3:
      return 'Wed';
    case 4:
      return 'Thu';
    case 5:
      return 'Fri';
    case 6:
      return 'Sat';
    case 7:
      return 'Sun';
    default:
      return '';
  }
}

String generateRandomCategory() {
  // Assuming you want categories in the format "Category_<random_number>"
  Random random = Random();
  int randomNumber = random.nextInt(1000000) + 1;
  return 'Category_$randomNumber';
}

void addDaysInRangeAfterCurrentDay(
    {required List<String> daysToDisplay,
    required TextEditingController titleTextController,
    required BuildContext context,
    required String rundomCategory}) {
  DateTime currentDate = DateTime.now();
  DateTime start = DateTime.now();
  DateTime end = currentDate.add(Duration(days: 30));
  for (int i = 1; i <= end.difference(start).inDays; i++) {
    DateTime currentDay = start.add(Duration(days: i));
    if (daysToDisplay.contains(getDayName(currentDay.weekday))) {
      if (customTextFormValidation(context,
              textController: titleTextController, missing: "event") ==
          true) {
        // print('${getDayName(currentDay.weekday)} ${currentDay.day}');

        TimeBlocks timeBlocks = TimeBlocks(
            title: titleTextController.text +
                " after -> ${convertDateTimeToString_MMMDHMMA(timeBlockscontroller.startTime!.add(Duration(days: i)))}}",
            start_time: convertDateTimeToString_MMMDHMMA(
                timeBlockscontroller.startTime!.add(Duration(days: i))),
            // start_time: DateFormat('MMM d h:mm a')
            //     .format(timeBlockscontroller.startTime!),
            end_time: convertDateTimeToString_MMMDHMMA(
                timeBlockscontroller.eventPeriod!),
            // end_time: DateFormat('MMM d h:mm a')
            //     .format(timeBlockscontroller.eventPeriod!),
            notification: timeBlockscontroller.alarmSwitchState == true ? 1 : 0,
            repeatDays: timeBlockscontroller.repeatDays,
            color: timeBlockscontroller.idexColor,
            day: timeBlockscontroller.currentDay,
            nameOfDay: getDayName(currentDay.weekday),
            numberOfDay: currentDay.day,
            category: rundomCategory);
        timeBlocksDatabaseController.addTimeBlocks(timeBlocks: timeBlocks);
      } else {
        break;
      }
    }
  }
}

void addDaysInRangeBeforCurrentDay(
    {required List<String> daysToDisplay,
    required TextEditingController titleTextController,
    required BuildContext context,
    required String rundomCategory}) {
  SettingServices.instance.write(Keys.timeBlocks, true);
  DateTime currentDate = DateTime.now();
  DateTime end = DateTime.now();
  DateTime start = currentDate.subtract(const Duration(days: 16));
  for (int i = 0; i <= end.difference(start).inDays; i++) {
    DateTime currentDay = start.add(Duration(days: i));
    if (daysToDisplay.contains(getDayName(currentDay.weekday))) {
      if (customTextFormValidation(context,
              textController: titleTextController, missing: "event") !=
          true) {
        break;
      } else {
        print('${getDayName(currentDay.weekday)} ---- ${currentDay.day}');
        TimeBlocks timeBlocks = TimeBlocks(
            title: titleTextController.text +
                " before ->  ${convertDateTimeToString_MMMDHMMA(timeBlockscontroller.startTime!.subtract(Duration(days: end.difference(start).inDays - i)))}",
            start_time: convertDateTimeToString_MMMDHMMA(timeBlockscontroller
                .startTime!
                .subtract(Duration(days: end.difference(start).inDays - i))),
            end_time: convertDateTimeToString_MMMDHMMA(
                timeBlockscontroller.eventPeriod!),
            notification: timeBlockscontroller.alarmSwitchState == true ? 1 : 0,
            repeatDays: timeBlockscontroller.repeatDays,
            color: timeBlockscontroller.idexColor,
            day: timeBlockscontroller.currentDay,
            nameOfDay: getDayName(currentDay.weekday),
            numberOfDay: currentDay.day,
            category: rundomCategory);
        timeBlocksDatabaseController.addTimeBlocks(timeBlocks: timeBlocks);
      }
    }
  }
  Get.back();
}
