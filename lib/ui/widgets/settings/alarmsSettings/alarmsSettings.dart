import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schedule_app/ui/widgets/settings/alarmsSettings/selectAlarmSettings.dart';
import 'package:schedule_app/ui/widgets/settings/rectangularBox.dart';

class AlarmsSettings extends StatelessWidget {
  const AlarmsSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return RectangularBox(
      text: "63".tr,
      press: () {
        SelectAlarms(context: context);
      },
    );
  }
}
