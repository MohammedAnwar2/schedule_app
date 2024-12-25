import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schedule_app/core/controller/timeTable/timeTableController.dart';
import 'package:schedule_app/ui/widgets/timeTable/classTime/defultClassTime.dart';

final ImpTimeTableController timeTableController =
    Get.find<ImpTimeTableController>();
void CustomClassTimeShowDialog(BuildContext context) async {
  final result = await showGeneralDialog(
    barrierColor: Colors.transparent,
    context: context,
    pageBuilder: (context, _, __) => DefultClassTime(),
    barrierDismissible:
        true, // Set to false if you don't want to dismiss on outside tap
    barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
  );

  // The result is null if the dialog is dismissed by tapping outside it
  if (result != null) {
    // Dialog closed with a result, handle it here
    print('Dialog closed with result: $result');
  } else {
    timeTableController.dialogDismissedClosed.value = true;
    // Dialog dismissed by tapping outside
    print('Dialog dismissed');
  }
}
