// ignore_for_file: file_names

import 'package:get/get.dart';
import 'package:schedule_app/core/controller/task/taskController.dart';
import 'package:schedule_app/core/controller/timeBlocks/timeBlocksController.dart';
import 'package:schedule_app/core/controller/timeTable/timeTableController.dart';
import 'package:schedule_app/routes/appRoutes.dart';

final timeBlockscontroller = Get.find<ImpTimeBlocksController>();
final taskController = Get.find<ImpTaskController>();
final timeTableController = Get.find<ImpTimeTableController>();
currentAddButton(int index) {
  switch (index) {
    case 0:
      print("0");
      timeTableController.resetAllTheValues();
      Get.toNamed(AppRoute.AddTimeTable);
      break;
    case 1:
      print("1");
      break;
    case 2:
      taskController.resetAllTheValues();
      Get.toNamed(AppRoute.AddTask);

      break;
    case 3:
      timeBlockscontroller.resetAllTheValues();
      Get.toNamed(AppRoute.AddTimeBlocks);
      print("3");
      break;
  }
}
