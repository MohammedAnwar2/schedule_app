import 'package:get/get.dart';
import 'package:schedule_app/core/controller/timeBlocks/timeBlocksController.dart';
import 'package:schedule_app/core/controller/timeBlocks/timeBlocksDatabaseController.dart';

final timeBlocksDatabaseController =
    Get.find<ImpTimeBlocksDatabaseController>();
final timeBlocksController = Get.find<ImpTimeBlocksController>();

bool checkTimeBlockEvents() {
  return timeBlocksDatabaseController.timeBlocks.contains(
      (timeBlocks) => timeBlocks.day == timeBlocksController.currentDay);
}
