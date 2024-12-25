import 'package:get/get.dart';
import 'package:schedule_app/core/constants/keys.dart';
import 'package:schedule_app/core/controller/timeTable/timeTableDatabaseController.dart';
import 'package:schedule_app/core/services/services.dart';
import 'package:schedule_app/data/models/timeTableModel.dart';

ImpTimeTableDatabaseController timeTableDatabaseController =
    Get.find<ImpTimeTableDatabaseController>();

void addMultibleTimeTable(
    {required TimeTable timeTable,
    required List<String> days,
    String? currentDayOfThisClass,
    int? id}) {
  bool isTheCurrentDayThere = false;
  int index = 0;
  for (int i = 0; i < days.length; i++) {
    print("timeTable.repeatDays = ${days[i]}\n");
    timeTable.repeatDays = days[i];
    if (currentDayOfThisClass != null && currentDayOfThisClass == days[i]) {
      print("update later");
      isTheCurrentDayThere = true;
      index = i;
    } else {
      timeTableDatabaseController.addTimeTable(timeTable: timeTable);
      print("no\n\n\n\nno");
    }
  }
  if (isTheCurrentDayThere) {
    timeTable.repeatDays = days[index];
    timeTableDatabaseController.updateTimeTable(timeTable: timeTable, id: id);
  }
  SettingServices.instance.write(Keys.timeTable, true);
  Get.back();
}

/*

                  repeatDays: timeTableController.repeatDays.isEmpty
                      ? [
                          timeTableController
                              .workDays[timeTableController.activePage!]
                        ]
                      : timeTableController.repeatDays,

 */

/**
     timeTableDatabaseController
        .addTimeTable(timeTable: timeTable)
        .then((value) {
        SettingServices.instance.write(Keys.timeTable, true);
        // Get.offAllNamed(AppRoute.HomePage);
        Get.back();
      })

 */