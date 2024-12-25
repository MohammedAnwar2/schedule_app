// ignore_for_file: file_names, prefer_is_empty, invalid_use_of_protected_member, use_key_in_widget_constructors
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schedule_app/core/constants/keys.dart';
import 'package:schedule_app/core/controller/categoriesConroller.dart';
import 'package:schedule_app/core/controller/task/taskController.dart';
import 'package:schedule_app/core/controller/task/taskDatabaseController.dart';
import 'package:schedule_app/core/controller/timeBlocks/timeBlocksDatabaseController.dart';
import 'package:schedule_app/core/controller/timeTable/timeTableController.dart';
import 'package:schedule_app/core/controller/timeTable/timeTableDatabaseController.dart';
import 'package:schedule_app/core/services/services.dart';
import 'package:schedule_app/ui/widgets/homePage.dart/custmizeAddIcon.dart';
import 'package:schedule_app/ui/widgets/timeBlocks/scorllingPosition.dart';

final categoryController = Get.find<CategoriesCintrollerImp>();
final taskController = Get.find<ImpTaskController>();
final taskDatabaseController = Get.find<TaskDatabaseController>();
final timeBlocksDatabaseController =
    Get.find<ImpTimeBlocksDatabaseController>();
final timeTableDatabaseController = Get.find<ImpTimeTableDatabaseController>();
final ImpTimeTableController timeTableController =
    Get.find<ImpTimeTableController>();
translationPages(int index) {
  switch (index) {
    case 0:
      return timeTableDatabaseController.timeTable.length != 0
          ? timeTableController.workDays.length != 0
              ? CustomizeAddIcons()
              : Container()
          : Container();
    // return timeTableDatabaseController.timeTable.length != 0
    //     ? CustomizeAddIcons()
    //     : Container();
    //  return CustomizeAddIcons();
    case 1:
      return timeBlocksDatabaseController.timeBlocks.length != 0
          ? Container()
          : Container();
    case 2:
      if (taskDatabaseController.tasks.length != 0) {
        return CustomizeAddIcons();
      }
      return Container();

    case 3:
      activeTheScrollToSpecificPosition();
      if (timeBlocksDatabaseController.timeBlocks.length != 0) {
        return CustomizeAddIcons();
      }
      return Container();
  }
}

translationButtons(int index) {
  switch (index) {
    case 0:
      return SettingServices.instance.read(Keys.language) == "ar"
          ? FloatingActionButtonLocation.startFloat
          : FloatingActionButtonLocation.endFloat;
    case 1:
      return SettingServices.instance.read(Keys.language) == "ar"
          ? FloatingActionButtonLocation.startFloat
          : FloatingActionButtonLocation.endFloat;
    case 2:
      return taskDatabaseController.tasks.length == 0
          ? FloatingActionButtonLocation.centerFloat
          : SettingServices.instance.read(Keys.language) == "ar"
              ? FloatingActionButtonLocation.startFloat
              : FloatingActionButtonLocation.endFloat;

    case 3:
      return SettingServices.instance.read(Keys.language) == "ar"
          ? FloatingActionButtonLocation.startFloat
          : FloatingActionButtonLocation.endFloat;
  }
  return null;
}

// Widget conditionalWidget(bool condition) {
//   return condition ? TrueWidget() : FalseWidget();
// }

// class TrueWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }

// class FalseWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }

// // FloatingActionButtonLocation? translationButtons(int index) {
// //   switch (index) {
// //     case 0:
// //     //  return CustomizeAddIcons();
// //     case 1:
// //     // return Container();
// //     case 2:
// //       GetX<TaskDatabaseController>(
// //           init: TaskDatabaseController(),
// //           builder: (controller) {
// //             if (controller.tasks.length == 0) {
// //               return SettingServices.instance.read(Keys.language) == "ar"
// //                   ? FloatingActionButtonLocation.startFloat
// //                   : FloatingActionButtonLocation.endFloat;
// //             } else {
// //               return CustomizeAddIcons();
// //             }
// //           });

// //     case 3:
// //     //return CustomizeAddIcons();
// //   }
// //   return null;
// // }
// /*
//                   SettingServices.instance.read(Keys.language) == "ar"
//                       ? FloatingActionButtonLocation.startFloat
//                       : FloatingActionButtonLocation.endFloat,
//  */
