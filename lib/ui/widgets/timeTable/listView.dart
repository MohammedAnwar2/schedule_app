// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:schedule_app/core/constants/themeOfApp/colorConstants.dart';
import 'package:schedule_app/core/controller/timeTable/timeTableController.dart';
import 'package:schedule_app/core/controller/timeTable/timeTableDatabaseController.dart';
import 'package:schedule_app/data/models/timeTableModel.dart';
import 'package:schedule_app/routes/appRoutes.dart';
import 'package:schedule_app/ui/widgets/timeTable/initPage.dart';
import 'package:schedule_app/ui/widgets/timeTable/timeTabkeDesign.dart';
import 'package:schedule_app/ui/widgets/timeTable/timeTableNotification.dart';

class ListVeiwData extends StatelessWidget {
  ListVeiwData({
    Key? key,
    required this.index,
  }) : super(key: key);
  final int index;
  final ImpTimeTableController timeTableController =
      Get.find<ImpTimeTableController>();

  ImpTimeTableDatabaseController timeTableDatabaseController =
      Get.find<ImpTimeTableDatabaseController>();

  @override
  Widget build(BuildContext context) {
    //  print(
    // "timeTableDatabaseController.timeTableMapsResult =>>>>>>>> ${timeTableDatabaseController.timeTableMapsResult}\n${timeTableController.workDays[index]}");
    return Obx(() => timeTableDatabaseController.timeTableMapsResult != null
        ? hasRepeatDay(timeTableDatabaseController.timeTableMapsResult!,
                timeTableController.workDays[index])
            ? ListView.builder(
                itemCount: timeTableDatabaseController
                    .timeTable.length, //number of TimeTable Task
                padding: EdgeInsets.only(bottom: 90),
                itemBuilder: (context, i) {
                  TimeTable timeTable =
                      timeTableDatabaseController.timeTable[i];
                  notification(timeTable);
                  return GestureDetector(
                    onTap: () {
                      timeTableController.resetAllTheValues();
                      Get.toNamed(AppRoute.EditTimeTable, arguments: {
                        "timeTable": timeTable,
                        "numberOfPages": timeTableController.activePage
                      });
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: findElementIndexUsingLinearSearch(
                                  timeTable.repeatDays!,
                                  timeTableController.workDays[index]) ==
                              0
                          ? TimeTableDesign(
                              color: colors[
                                  timeTable.color == 7 ? 0 : timeTable.color!],
                              // color: timeTable.color!=7?timeTable.color,

                              period: timeTable.period.toString(),
                              startTime: timeTable.start_time.toString(),
                              subject: timeTable.subject.toString(),
                              classRoomNo: timeTable.roomNo.toString(),
                            )
                          : Container(),
                    ),
                  );
                })
            : Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  timeTableDatabaseController.timeTable.length == 0
                      ? TimeTableInitPage()
                      : TimeTableInitPage(),
                  Spacer(),
                ],
              )
        : Center(
            child: timeTableDatabaseController.timeTable.length == 0
                ? TimeTableInitPage()
                : CircularProgressIndicator()));
  }
}

bool hasRepeatDay(List<Map<String, dynamic>> listDays, String targetDay) {
  // Check if any map in the list has the same repeatDays as the target day
  return listDays.any((map) {
    List<String> repeatDaysList = map['repeatDays'].split(',');
    // Trim each day to remove any leading or trailing whitespace
    repeatDaysList = repeatDaysList.map((day) => day.trim()).toList();
    return repeatDaysList.contains(targetDay);
  });
}

int findElementIndexUsingLinearSearch(String day, String searchTerm) {
  return day.compareTo(searchTerm);
}
