// ignore_for_file: unused_local_variable, unused_field

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:schedule_app/components/time_functions.dart';
import 'package:schedule_app/core/constants/keys.dart';
import 'package:schedule_app/core/services/services.dart';

abstract class TimeBlocksController extends GetxController {
  selectStartTime(DateTime time);

  selectEndTime(DateTime time);

  changeStateOfAlarmSwitch(bool state);

  changeStateOfRepeatSwitch(bool state);

  selectColor(int indexOfCurrentColor);

  changeDay(
      {required int indexDay,
      required int noOfDay,
      required String nameOfDay,
      required String nameOfMonth});

  selectRepeatDays(String day);

  searchRepeatDays(String day);

  List<Map<String, dynamic>> generateDateOfDayesList(
      DateTime date, int numberOfDays);

  getFormattedWeekday(DateTime date);

  resetAllTheValues();

  resetDaysValues();

  resetDeletingMessage();

  messageForDeleting();
}

class ImpTimeBlocksController extends TimeBlocksController {
  bool? alarmSwitchState;
  List<Color> changeColorDeletingMessage = [];

  List<String> changeDeletingMessage = [];
  int currentDay = 0;
  Map<String, dynamic>? day;
  List<String> days = [
    'Mon',
    'Tue',
    'Wed',
    'Thu',
    'Fri',
    'Sat',
    'Sun',
  ];

  List<Map<String, dynamic>>? daysList;
  DateTime? eventPeriod;
  int? idexColor;
  int? previousDay;
  List<String> repeatDays = [];
  bool? repeatSwitchState;
  ScrollController scrollController = ScrollController();
  DateTime? startTime;

  @override
  changeDay(
      {required int indexDay,
      required int noOfDay,
      required String nameOfDay,
      required String nameOfMonth}) {
    // previousDay = currentDay;
    previousDay = daysList!.indexWhere((element) =>
        element["day"] == DateFormat('E').format(DateTime.now()) &&
        element["date"] == int.parse(DateFormat('d').format(DateTime.now())));
    ;
    currentDay = indexDay;
    day!['day'] = nameOfDay;
    day!['date'] = noOfDay;
    print("تغيير");
    print("currentDay => $currentDay");
    print("nameOfDay => $nameOfDay");
    print("noOfDay => $noOfDay");
    print("nameOfMonth => $nameOfMonth");
    update();
  }

  @override
  changeStateOfAlarmSwitch(bool state) {
    alarmSwitchState = state;
    update();
  }

  @override
  changeStateOfRepeatSwitch(bool state) {
    repeatSwitchState = state;
    update();
  }

  @override
  // List<Map<String, dynamic>> generateDateOfDayesList(
  //     DateTime date, int numberOfDays) {
  //   List<Map<String, dynamic>> result = [];

  //   // Calculate the middle index
  //   int middleIndex = (numberOfDays / 2).floor();

  //   // Add the current day to the middle of the result list
  //   result.add({'date': date.day, 'day': getFormattedWeekday(date)});

  //   // Iterate backward from the middle index
  //   for (int i = 1; i <= middleIndex; i++) {
  //     DateTime previousDay = date.subtract(Duration(days: i));
  //     result.insert(0,
  //         {'date': previousDay.day, 'day': getFormattedWeekday(previousDay)});
  //   }

  //   // Iterate forward from the middle index
  //   for (int i = 1; i <= numberOfDays - middleIndex - 1; i++) {
  //     DateTime nextDay = date.add(Duration(days: i));
  //     result.add({'date': nextDay.day, 'day': getFormattedWeekday(nextDay)});
  //   }

  //   return result;
  // }

// String getFormattedWeekday(DateTime date) {
//   return DateFormat('E').format(date); // Use 'E' for short weekday name
// }

  String getFormattedMonth(DateTime date) {
    return DateFormat('MMM').format(date); // Use 'MMM' for short month name
  }

  List<Map<String, dynamic>> generateDateOfDayesList(
      DateTime date, int numberOfDays) {
    List<Map<String, dynamic>> result = [];

    // Calculate the middle index
    int middleIndex = (numberOfDays / 2).floor();

    // Add the current day to the middle of the result list
    result.add({
      'date': date.day,
      'month': getFormattedMonth(date),
      'day': getFormattedWeekday(date),
    });

    // Iterate backward from the middle index
    for (int i = 1; i <= middleIndex; i++) {
      DateTime previousDay = date.subtract(Duration(days: i));
      result.insert(0, {
        'date': previousDay.day,
        'month': getFormattedMonth(previousDay),
        'day': getFormattedWeekday(previousDay),
      });
    }

    // Iterate forward from the middle index
    for (int i = 1; i <= numberOfDays - middleIndex - 1; i++) {
      DateTime nextDay = date.add(Duration(days: i));
      result.add({
        'date': nextDay.day,
        'month': getFormattedMonth(nextDay),
        'day': getFormattedWeekday(nextDay),
      });
    }

    return result;
  }

  @override
  String getFormattedWeekday(DateTime date) {
    return DateFormat.E().format(date); // Format day of the week (e.g., Mon)
  }

  @override
  messageForDeleting() {
    changeDeletingMessage = [
      "140".tr,
      "141".tr,
      "142".tr,
    ];
    changeColorDeletingMessage = [
      changeDeletingMessage[1] == '141'
          ? Get.isDarkMode
              ? Color(0xff3AC7BA)
              : Color(0xff188983)
          : Get.isDarkMode
              ? Color(0xff3AC7BA)
              : Color(0xff188983),
      changeDeletingMessage[2] == '142'
          ? Get.isDarkMode
              ? Color(0xff3AC7BA)
              : Color(0xff188983)
          : Get.isDarkMode
              ? Color(0xff3AC7BA)
              : Color(0xff188983)
    ];
    update();
  }

  // Function to scroll to a specific position

  @override
  void onInit() {
    startTime = DateTime.now();
    //endTime = DateTime.now().add(Duration(minutes: 45));
    eventPeriod = convertTimeStringToDateTime_HMMA("00:45 AM");
    daysList = generateDateOfDayesList(DateTime.now(), 30);
    currentDay = daysList!.indexWhere((element) =>
        element["day"] == DateFormat('E').format(DateTime.now()) &&
        element["date"] == int.parse(DateFormat('d').format(DateTime.now())) &&
        element["month"] == DateFormat('MMM').format(DateTime.now()));
    day = {
      "day": DateFormat('E').format(DateTime.now()),
      "date": DateTime.now().day,
      "month": DateFormat('M').format(DateTime.now())
    };
    startTime = DateTime.now();
    alarmSwitchState = SettingServices.instance.read(Keys.eventsAlarms) ?? true;
    ;
    repeatSwitchState = false;

    idexColor = 7;
    super.onInit();
  }

  @override
  resetAllTheValues() {
    startTime = DateTime.now();
    eventPeriod = convertTimeStringToDateTime_HMMA("00:45 AM");
    startTime = DateTime.now();
    alarmSwitchState = SettingServices.instance.read(Keys.eventsAlarms) ?? true;
    ;
    repeatSwitchState = false;
    idexColor = 7;
    repeatDays = [];
    changeDeletingMessage = [
      "140".tr,
      "42".tr,
      "43".tr,
    ];

    update();
  }

  @override
  resetDaysValues() {
    currentDay = daysList!.indexWhere((element) =>
        element["day"] == DateFormat('E').format(DateTime.now()) &&
        element["date"] == int.parse(DateFormat('d').format(DateTime.now())));
    day = {
      "day": DateFormat('E').format(DateTime.now()),
      "date": DateTime.now().day,
      "month": DateFormat('MMM')
          .format(DateTime.now()) //--------------------------------
    };
    // previousDay = currentDay;
    previousDay = daysList!.indexWhere((element) =>
        element["day"] == DateFormat('E').format(DateTime.now()) &&
        element["date"] == int.parse(DateFormat('d').format(DateTime.now())));
    ;
    update();
  }

  @override
  resetDeletingMessage() {
    changeDeletingMessage = [
      "140".tr,
      "42".tr,
      "43".tr,
    ];
    changeColorDeletingMessage = [
      changeDeletingMessage[1] == '141'
          ? Get.isDarkMode
              ? Color(0xff3AC7BA)
              : Color(0xff188983)
          : Get.isDarkMode
              ? Color(0xff3AC7BA)
              : Color(0xff188983),
      changeDeletingMessage[2] == '142'
          ? Get.isDarkMode
              ? Color(0xff3AC7BA)
              : Color(0xff188983)
          : Get.isDarkMode
              ? Color(0xff3AC7BA)
              : Color(0xff188983)
    ];
    update();
  }

  @override
  searchRepeatDays(String day) {
    if (repeatDays.contains(day)) {
      return true;
    } else {
      return false;
    }
  }

  @override
  selectColor(int indexOfCurrentColor) {
    idexColor = indexOfCurrentColor;
    update();
  }

  @override
  selectEndTime(DateTime time) {
    this.eventPeriod = time;
    update();
  }

  @override
  selectRepeatDays(String day) {
    if (repeatDays.contains(day)) {
      repeatDays.remove(day);
    } else {
      repeatDays.add(day);
    }
    update();
  }

  @override
  selectStartTime(DateTime time) {
    this.startTime = time;
    update();
  }
}
