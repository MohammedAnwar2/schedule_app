import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:schedule_app/core/constants/keys.dart';
import 'package:schedule_app/core/services/services.dart';

abstract class TimeTableController extends GetxController {
  void onPageChanged(int index);

  void selectTime(DateTime time);

  void onSelectedItemChanged(int index);

  void changeStateOfAlarmSwitch(bool state);

  void selectRepeatDays(String day);

  bool searchRepeatDays(String day);

  void selectWorkDays(String day);

  void selectArabicWorkDays(String day);

  bool searchWorkDays(String day);

  selectColor(int indexOfCurrentColor);

  void resetAllTheValues();

  void changeRaioValue(int value);

  void changeCurrentRaioValue(int value);

  void changeWorkDays(List<String> value);

  void sortWorkDays({required List shortCutDaysName});

  void sortArabicWorkDays({required List shortCutDaysName});

  //int searchCurrentDay();
}

class ImpTimeTableController extends TimeTableController {
  int? activePage;
  List<String> arabicWorkDaysFullNameConstant = [
    "الاثنين",
    "الثلاثاء",
    "الأربعاء",
    "الخميس",
    "الجمعة",
    "السبت",
    "الأحد",
  ];
  List<String> workDaysFullNameConstant = [
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
    "Sunday",
  ];
  // bool? repeatSwitchState;
  List<String> days = [
    'Mon',
    'Tue',
    'Wed',
    'Thu',
    'Fri',
    'Sat',
    'Sun',
  ];

  //List<String> currentWorkDays = [];
  RxBool dialogDismissedClosed = true.obs;

  String? firstNameOfSelection;
  List<String> fullDayNames = [];
  int? idexColor;
  int? lecturePeriodTime;
  DateTime? lectureStartingTime;
  PageController pageController = PageController();
  List<String> repeatDays = [];
  int selectedCurrentRadioValue = 45;
  int selectedRadioValue = 45;
  bool? switchState;
  List<String> workDays = [];
  List<String> arabicWorkDays = [];
  List<String> workDaysFullName = [];
  List<String> arabicWorkDaysFullName = [];

  @override
  void changeCurrentRaioValue(int value) {
    selectedCurrentRadioValue = value;
    update();
  }

  @override
  void changeRaioValue(int value) {
    selectedRadioValue = value;
    update();
  }

  @override
  void changeWorkDays(List<String> value) {
    workDays = value;
    update();
  }

  @override
  void onInit() {
    activePage = 0;
    lecturePeriodTime = 44;
    lectureStartingTime = DateTime.now();
    switchState = SettingServices.instance.read(Keys.classAlarms) ?? true;
    idexColor = 7;
    selectedRadioValue = SettingServices.instance.read(Keys.classTime) ?? 45;
    selectedCurrentRadioValue =
        SettingServices.instance.read(Keys.classTime) ?? 45;
    List<dynamic> workDaysDynamic =
        SettingServices.instance.read(Keys.workDays) ?? [];
    workDays = workDaysDynamic.cast<String>().toList();
    sortWorkDays(shortCutDaysName: workDays);
    sortArabicWorkDays(shortCutDaysName: workDays);
    // searchCurrentDay();
    super.onInit();
  }

  @override
  void onPageChanged(int index) {
    activePage = index;
    update();
  }

  @override
  void onSelectedItemChanged(int index) {
    lecturePeriodTime = index;
    update();
  }

  @override
  resetAllTheValues() {
    // activePage = 0;
    lecturePeriodTime = 44;
    lectureStartingTime = DateTime.now();
    switchState = SettingServices.instance.read(Keys.classAlarms) ?? true;
    idexColor = 7;
    repeatDays = [];
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
  bool searchWorkDays(String day) {
    if (workDays.contains(day)) {
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
  selectRepeatDays(String day) {
    if (repeatDays.contains(day)) {
      repeatDays.remove(day);
    } else {
      repeatDays.add(day);
    }
    update();
  }

  @override
  void selectWorkDays(String day) {
    if (workDays.contains(day)) {
      workDays.remove(day);
    } else {
      workDays.add(day);
    }
    update();
  }

  @override
  void selectArabicWorkDays(String day) {
    if (arabicWorkDays.contains(day)) {
      arabicWorkDays.remove(day);
    } else {
      arabicWorkDays.add(day);
    }
    update();
  }

  @override
  changeStateOfAlarmSwitch(bool state) {
    switchState = state;
    update();
  }

  sortWorkDays({required List shortCutDaysName}) {
    shortCutDaysName.sort((a, b) => days.indexOf(a).compareTo(days.indexOf(b)));
    List<String> fullDayNames = shortCutDaysName.map((shortCut) {
      int index = days.indexOf(shortCut);
      return workDaysFullNameConstant[index];
    }).toList();
    workDaysFullName = fullDayNames;
    update();
  }

  sortArabicWorkDays({required List shortCutDaysName}) {
    shortCutDaysName.sort((a, b) => days.indexOf(a).compareTo(days.indexOf(b)));
    List<String> fullDayNames = shortCutDaysName.map((shortCut) {
      int index = days.indexOf(shortCut);
      return arabicWorkDaysFullNameConstant[index];
    }).toList();
    arabicWorkDaysFullName = fullDayNames;
    update();
  }

  selectTime(DateTime time) {
    this.lectureStartingTime = time;
    update();
  }

  // @override
  // int searchCurrentDay() {
  //   String currentDay = DateFormat('E').format(DateTime.now());
  //   int result = workDays.indexWhere((element) => element == currentDay);
  //   if (result != -1) {
  //     onPageChanged(result);
  //   } else {
  //     onPageChanged(0);
  //   }
  //   return result;
  // }
}
