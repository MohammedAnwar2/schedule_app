import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:schedule_app/components/customTextFormValidation.dart';
import 'package:schedule_app/core/constants/keys.dart';
import 'package:schedule_app/core/controller/timeBlocks/timeBlocksController.dart';
import 'package:schedule_app/core/controller/timeBlocks/timeBlocksDatabaseController.dart';
import 'package:schedule_app/core/services/services.dart';
import 'package:schedule_app/ui/widgets/timeBlocks/add_edit_timeBlocks_screens/addMultiplTimeBlocks.dart';

final timeBlockscontroller = Get.find<ImpTimeBlocksController>();
final timeBlocksDatabaseController =
    Get.find<ImpTimeBlocksDatabaseController>();
editDays({
  required TextEditingController titleTextController,
  required BuildContext context,
}) {
  for (int i = 0;
      i < timeBlocksDatabaseController.timeBlocksForEdit.length;
      i++) {
    if (customTextFormValidation(context,
            textController: titleTextController, missing: "event") ==
        true) {
      // timeBlocksDatabaseController.deleteTimeBlocks(
      //     id: timeBlocksDatabaseController.timeBlocksForEdit[i].id!);
    } else {
      break;
    }
  }
  String rundomCategory = generateRandomCategory();
  addDaysInRangeBeforCurrentDay(
      daysToDisplay: timeBlockscontroller.repeatDays,
      titleTextController: titleTextController,
      context: context,
      rundomCategory: rundomCategory);
  addDaysInRangeAfterCurrentDay(
      daysToDisplay: timeBlockscontroller.repeatDays,
      titleTextController: titleTextController,
      context: context,
      rundomCategory: rundomCategory);
  Get.back();
}
