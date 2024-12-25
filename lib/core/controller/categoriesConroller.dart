// ignore_for_file: file_names

import 'package:get/get.dart';
import 'package:schedule_app/core/controller/task/taskDatabaseController.dart';
import 'package:schedule_app/core/controller/timeBlocks/timeBlocksController.dart';
import 'package:schedule_app/core/controller/timeBlocks/timeBlocksDatabaseController.dart';
import 'package:schedule_app/ui/widgets/timeBlocks/add_edit_timeBlocks_screens/deleteLater.dart';
import 'package:schedule_app/ui/widgets/timeBlocks/scorllingPosition.dart';

final taskController = Get.find<TaskDatabaseController>();
final timeBlocksController = Get.find<ImpTimeBlocksController>();
final timeBlocksDatabaseController =
    Get.find<ImpTimeBlocksDatabaseController>();

abstract class CategoriesController extends GetxController {
  onButtomChanged(int index);
}

class CategoriesCintrollerImp extends CategoriesController {
  late bool timeTable;
  late bool pomodoroTechnique;
  late bool tasks;
  late bool timeBlocks;
  late int result;
  @override
  onButtomChanged(int index) {
    switch (index) {
      case 0:
        timeTable = true;
        pomodoroTechnique = false;
        tasks = false;
        timeBlocks = false;
        result = 0;
        break;
      case 1:
        timeTable = false;
        pomodoroTechnique = true;
        tasks = false;
        timeBlocks = false;
        result = 1;
        break;
      case 2:
        timeTable = false;
        pomodoroTechnique = false;
        tasks = true;
        timeBlocks = false;
        result = 2;
        break;
      case 3:
        timeTable = false;
        pomodoroTechnique = false;
        tasks = false;
        timeBlocks = true;
        result = 3;
        break;
    }
    timeBlocksController.resetDaysValues();
    timeBlocksDatabaseController.fetchTimeBlocks();
    activeTheScrollToSpecificPosition();
    deleteTimeBlocksLater();
    update();
  }

  @override
  void onInit() {
    timeTable = true;
    pomodoroTechnique = false;
    tasks = false;
    timeBlocks = false;
    result = 0;
    super.onInit();
  }
}
