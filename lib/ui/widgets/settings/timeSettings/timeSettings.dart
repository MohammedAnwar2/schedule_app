import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schedule_app/ui/widgets/settings/rectangularBox.dart';
import 'package:schedule_app/ui/widgets/settings/timeSettings/selectTimeSettings.dart';

class TimeSettings extends StatelessWidget {
  const TimeSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return RectangularBox(
      text: "62".tr,
      press: () {
        SelectTimeSettings(context: context);
      },
    );
  }
}
