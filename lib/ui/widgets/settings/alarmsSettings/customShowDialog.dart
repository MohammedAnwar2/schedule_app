import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schedule_app/core/controller/settingsController.dart';
import 'package:schedule_app/ui/widgets/settings/alarmsSettings/defultAlarmBefore.dart';

final ImpSettingsController settingsController =
    Get.find<ImpSettingsController>();

void CustomAlarmShowDialog(BuildContext context) async {
  final result = await showGeneralDialog(
    barrierColor: Colors.transparent,
    context: context,
    pageBuilder: (context, _, __) => DefultAlarmBefore(),
    barrierDismissible:
        true, // Set to false if you don't want to dismiss on outside tap
    barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
  );

  // The result is null if the dialog is dismissed by tapping outside it
  if (result != null) {
    // Dialog closed with a result, handle it here
    print('Dialog closed with result: $result');
  } else {
    settingsController.alarmDialogDismissedClosed.value = true;
    // Dialog dismissed by tapping outside
    print('Dialog dismissed');
  }
}