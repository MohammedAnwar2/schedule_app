import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schedule_app/core/controller/timeBlocks/timeBlocksController.dart';

final timeBlocksController = Get.find<ImpTimeBlocksController>();
void scrollToPosition(int position) {
  double itemExtent = 50.0; // Adjust this based on your item height

  timeBlocksController.scrollController.animateTo(
    position * itemExtent,
    duration: Duration(milliseconds: 1),
    curve: Curves.easeInOut,
  );
}

activeTheScrollToSpecificPosition() =>
    WidgetsBinding.instance.addPostFrameCallback((_) {
      scrollToPosition(timeBlocksController.currentDay -
          3); // Scroll to the 6th item (index 5)
    });
