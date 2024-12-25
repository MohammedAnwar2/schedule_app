import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:schedule_app/components/customFloatingButtom.dart';
import 'package:schedule_app/core/constants/keys.dart';
import 'package:schedule_app/core/controller/timeTable/timeTableController.dart';
import 'package:schedule_app/core/controller/timeTable/timeTableDatabaseController.dart';
import 'package:schedule_app/core/services/services.dart';
import 'package:schedule_app/data/database/configrationsDatabase.dart';
import 'package:schedule_app/routes/appRoutes.dart';
import 'package:schedule_app/ui/widgets/timeTable/changeDay.dart';
import 'package:schedule_app/ui/widgets/timeTable/classTime/addClassTime.dart';
import 'package:schedule_app/ui/widgets/timeTable/classTime/classTime.dart';
import 'package:schedule_app/ui/widgets/timeTable/customPageView.dart';
import 'package:schedule_app/ui/widgets/timeTable/initPage.dart';

// int findElementIndexUsingLinearSearch(List<String> list, String searchTerm) {
//   return list.indexOf(searchTerm);
// }

class TimeTableScreen extends StatefulWidget {
  TimeTableScreen({super.key});

  @override
  State<TimeTableScreen> createState() => _TimeTableScreenState();
}

class _TimeTableScreenState extends State<TimeTableScreen> {
  SQLite sq = SQLite();
  final ImpTimeTableController timeTableController =
      Get.find<ImpTimeTableController>();

  ImpTimeTableDatabaseController timeTableDatabaseController =
      Get.find<ImpTimeTableDatabaseController>();

  @override
  void initState() {
    super.initState();
    timeTableDatabaseController.fetchTimeTable();
    //sq.MydeleteDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Spacer(
              flex: 3,
            ),
            GetBuilder<ImpTimeTableController>(
              init: ImpTimeTableController(),
              builder: (controller) => timeTableController.workDays.isNotEmpty
                  ? ChangeDay(
                      //put one condition
                      day: timeTableController.workDaysFullName.isNotEmpty
                          ? SettingServices.instance.read(Keys.language) != "ar"
                              ? timeTableController.workDaysFullName[
                                  timeTableController.activePage!]
                              : timeTableController.arabicWorkDaysFullName[
                                  timeTableController.activePage!]
                          : "",
                      leftButton: () =>
                          timeTableController.pageController.previousPage(
                            duration: const Duration(milliseconds: 600),
                            curve: Curves.easeInOut,
                          ),
                      rightButton: () {
                        timeTableController.pageController.nextPage(
                          duration: const Duration(milliseconds: 600),
                          curve: Curves.easeInOut,
                        );
                      })
                  : Container(),
            ),
            Spacer(
              flex: 2,
            ),
            classTime()
          ],
        ),
        GetBuilder<ImpTimeTableController>(
          init: ImpTimeTableController(),
          builder: (_) {
            return timeTableController.workDays.isNotEmpty
                ? Expanded(child: CustomPageView())
                : Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TimeTableInitPage(),

                      //Spacer(),
                    ],
                  );
          },
        ),
        GetBuilder<ImpTimeTableController>(
            init: ImpTimeTableController(),
            builder: (controller) => timeTableController.workDays.isEmpty
                ? Expanded(child: Container())
                : Container()),
        GetBuilder<ImpTimeTableController>(
          init: ImpTimeTableController(),
          builder: (controller) =>
              Obx(() => timeTableDatabaseController.timeTable.length == 0
                  ? CustomFloatingButtom(
                      text: timeTableController.workDaysFullName.isEmpty
                          ? "25".tr
                          : "24".tr,
                      is_initializPage: true,
                      press: () {
                        timeTableController.workDaysFullName.isEmpty
                            ? showModelButtonSheet(
                                context: context) //classTime()
                            : Get.toNamed(AppRoute.AddTimeTable);
                      },
                    )
                  : timeTableController.workDaysFullName.isEmpty
                      ? CustomFloatingButtom(
                          text: timeTableController.workDaysFullName.isEmpty
                              ? "25".tr
                              : "24".tr,
                          is_initializPage: true,
                          press: () {
                            timeTableController.workDaysFullName.isEmpty
                                ? showModelButtonSheet(
                                    context: context) //classTime()
                                : Get.toNamed(AppRoute.AddTimeTable);
                          },
                        )
                      : Container()),
        ),
        SizedBox(
          height: 22.h,
        )
      ],
    );
  }
}

    // return GetBuilder<ImpTimeTableController>(
    //     init: ImpTimeTableController(),
    //     builder: (_) {
    //       return ;
    //     });