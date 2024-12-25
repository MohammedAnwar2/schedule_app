import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:jhijri/_src/_jHijri.dart';
import 'package:schedule_app/core/constants/keys.dart';
import 'package:schedule_app/core/constants/varibles.dart';
import 'package:schedule_app/core/controller/task/taskController.dart';
import 'package:schedule_app/core/controller/timeBlocks/timeBlocksController.dart';
import 'package:schedule_app/core/controller/timeTable/timeTableController.dart';
import 'package:schedule_app/core/services/services.dart';

ImpTaskController taskController = Get.find<ImpTaskController>();
ImpTimeBlocksController timeBlocksController1 =
    Get.find<ImpTimeBlocksController>();
ImpTimeTableController timeTableController = Get.find<ImpTimeTableController>();

abstract class SettingsController extends GetxController {
  void changeSwitchStateOfDarkLightMode(bool state);

  void changeSwitchStateOfClassAlarms(bool state);

  void changeSwitchStateOfTasksAlarms(bool state);

  void changeSwitchStateOfEventsAlarms(bool state);

  void changeLanguageRaioValue(String value);

  void changeCalenderRaioValue(int value);

  void changeCurrentCalenderRaioValue(int value);

  void changeWeekStartingOnRaioValue(int value);

  void changeCurrentWeekStartingOnRaioValue(int value);

  void changeAlarmBefoeRaioValue(int value);

  void changeCurrentAlarmBefoeRaioValue(int value);

  void changeSwitchStateOf24hr(bool state);

  void chnageCurrentDate();

  void changeCurrentClassificationRaioValue(int value);

  void changeClassificationRaioValue(int value);
}

class ImpSettingsController extends SettingsController {
  RxBool alarmDialogDismissedClosed = true.obs;
  List<String> arabicCalender = ["هجري", "ميلادي"];
  List<String> arabicWeeks = [
    "الاثنين",
    "الثلاثاء",
    "الأربعاء",
    "الخميس",
    "الجمعة",
    "السبت",
    "الأحد",
  ];
  List<String> englishWeeks = [
    "Saturday",
    "Sunday",
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
  ];
  List<String> classification = ["132".tr, "133".tr, "134".tr, "135".tr];
  RxBool calendarDialogDismissedClosed = true.obs;
  RxBool classificationDialogDismissedClosed = true.obs;
  String currentDate = "";
  List<String> englishCalender = ["Hijri date", "Gregorian date"];

  int? selectedAlarmBeforRadioValue;
  int? selectedCalenderRadioValue;
  int? selectedCurrentAlarmBeforRadioValue;
  int? selectedCurrentCalenderRadioValue;
  int? selectedCurrentClassificationRadioValue;
  int? selectedClassificationRadioValue;
  int? selectedCurrentWeekStartingOnRadioValue;
  String? selectedLanguageRadioValue;
  int? selectedWeekStartingOnRadioValue;
  bool? switchStateOf24hr;
  bool? switchStateOfClassAlarms;
  bool? switchStateOfEventsAlarms;
  bool? switchStateOfLightDarkMode;
  bool? switchStateOfTasksAlarms;
  RxBool weekStartDialogDismissedClosed = true.obs;

  @override
  void changeAlarmBefoeRaioValue(int value) {
    selectedAlarmBeforRadioValue = value;
    update();
  }

  @override
  void changeCalenderRaioValue(int value) {
    selectedCalenderRadioValue = value;
    update();
  }

  @override
  void changeCurrentAlarmBefoeRaioValue(int value) {
    selectedCurrentAlarmBeforRadioValue = value;
    update();
  }

  @override
  void changeCurrentCalenderRaioValue(int value) {
    selectedCurrentCalenderRadioValue = value;
    update();
  }

  @override
  void changeCurrentClassificationRaioValue(int value) {
    selectedCurrentClassificationRadioValue = value;
    SettingServices.instance
        .write(Keys.classification, selectedClassificationRadioValue);
    update();
  }

  @override
  void changeClassificationRaioValue(int value) {
    selectedClassificationRadioValue = value;
    update();
  }

  @override
  void changeCurrentWeekStartingOnRaioValue(int value) {
    selectedCurrentWeekStartingOnRadioValue = value;
    update();
  }

  @override
  void changeLanguageRaioValue(String value) {
    selectedLanguageRadioValue = value;
    update();
  }

  @override
  void changeSwitchStateOf24hr(bool state) {
    switchStateOf24hr = state;
    SettingServices.instance.write(Keys.timeOn24hr, state);
    update();
  }

  @override
  void changeSwitchStateOfClassAlarms(bool state) {
    switchStateOfClassAlarms = state;
    SettingServices.instance.write(Keys.classAlarms, state);
    timeTableController.changeStateOfAlarmSwitch(state);
    update();
  }

  @override
  changeSwitchStateOfDarkLightMode(bool state) {
    switchStateOfLightDarkMode = state;
    update();
  }

  @override
  void changeSwitchStateOfEventsAlarms(bool state) {
    switchStateOfEventsAlarms = state;
    SettingServices.instance.write(Keys.eventsAlarms, state);
    timeBlocksController1.changeStateOfAlarmSwitch(state);
    update();
  }

  @override
  void changeSwitchStateOfTasksAlarms(bool state) {
    switchStateOfTasksAlarms = state;
    SettingServices.instance.write(Keys.tasksAlarms, state);
    taskController.changeStateOfAlarmSwitch(state);
    update();
  }

  @override
  void changeWeekStartingOnRaioValue(int value) {
    selectedWeekStartingOnRadioValue = value;
    update();
  }

  @override
  void chnageCurrentDate() {
    final hijri = JHijri.now();

    int? arabicYearIndex;
    int? englishYearIndex;
    final dateOfToday = DateTime.now();

    arabicYearIndex =
        arabicYears.indexWhere((element) => element == hijri.year.toString());
    englishYearIndex =
        englishYears.indexWhere((element) => element == hijri.year.toString());

    arabicYearIndex == -1
        ? arabicYearIndex = englishYearIndex
        : englishYearIndex = arabicYearIndex;

    final arabicHijriDate =
        '${arabicNumbers[hijri.day - 1]} / ${arabicMonths[hijri.month - 1]} / ${arabicYears[arabicYearIndex]} , ${arabicDays[dateOfToday.weekday - 1]}';
    final englishHijriDate =
        '${englishNumbers[hijri.day - 1]} / ${englishMonths[hijri.month - 1]} / ${englishYears[englishYearIndex]} , ${englishDays[dateOfToday.weekday - 1]}'; //englishYears[englishYearIndex]}

    final gregorianFormat = DateFormat('dd / MM / yyyy , EEEE', 'ar_SA');
    final englishGregorianFormat = DateFormat('dd / MM / yyyy , EEEE', 'en_US');

    final gregorianDate = DateTime.now();
    final arabicGregorianDate = gregorianFormat.format(gregorianDate);
    final englishGregorianDate = englishGregorianFormat.format(gregorianDate);

    if (SettingServices.instance.read(Keys.language) == 'ar') {
      if (selectedCurrentCalenderRadioValue == 0) {
        currentDate = arabicHijriDate;
        print("هجري عربي");
      } else {
        currentDate = arabicGregorianDate;
      }
    } else {
      if (selectedCurrentCalenderRadioValue == 0) {
        currentDate = englishHijriDate;
        print("هجري انجليزي");
      } else {
        currentDate = englishGregorianDate;
      }
    }

    update();
  }

  @override
  void onInit() {
    switchStateOfLightDarkMode =
        SettingServices.instance.read(Keys.darkLightMode) ?? true;
    switchStateOfClassAlarms =
        SettingServices.instance.read(Keys.classAlarms) ?? true;
    switchStateOfTasksAlarms =
        SettingServices.instance.read(Keys.tasksAlarms) ?? true;
    switchStateOfEventsAlarms =
        SettingServices.instance.read(Keys.eventsAlarms) ?? true;
    switchStateOf24hr = SettingServices.instance.read(Keys.timeOn24hr) ?? false;

    selectedLanguageRadioValue =
        SettingServices.instance.read(Keys.language) == 'ar'
            ? "عربي"
            : "English";
    selectedAlarmBeforRadioValue =
        SettingServices.instance.read(Keys.alarmBefore) ?? 5;

    selectedCurrentAlarmBeforRadioValue =
        SettingServices.instance.read(Keys.alarmBefore) ?? 5;

    selectedCurrentCalenderRadioValue =
        SettingServices.instance.read(Keys.calender) ?? 0;
    selectedCurrentClassificationRadioValue =
        SettingServices.instance.read(Keys.classification) ?? 0;
    selectedClassificationRadioValue =
        SettingServices.instance.read(Keys.classification) ?? 0;

    selectedCalenderRadioValue =
        SettingServices.instance.read(Keys.calender) ?? 0;

    selectedCurrentWeekStartingOnRadioValue =
        SettingServices.instance.read(Keys.weekStartingOn) ?? 1;

    selectedWeekStartingOnRadioValue =
        SettingServices.instance.read(Keys.weekStartingOn) ?? 1;

    chnageCurrentDate();
    super.onInit();
  }
}

String getFormattedHijriDate(String localeCode) {
  // Use DateFormat with appropriate locale for Arabic ('ar') or English ('en')
  DateFormat formatter = DateFormat.yMEd(localeCode);
  // Convert Gregorian date to Hijri using your preferred method
  // For simplicity, we're using the current Gregorian date here
  DateTime gregorianDate = DateTime.now();
  // For demonstration, you might have your own method to convert to Hijri
  String formattedDate = formatter.format(gregorianDate);
  return formattedDate;
}
