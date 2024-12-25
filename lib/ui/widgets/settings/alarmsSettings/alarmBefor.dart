import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:schedule_app/core/constants/themeOfApp/fonts.dart';
import 'package:schedule_app/core/controller/settingsController.dart';
import 'package:schedule_app/ui/widgets/settings/alarmsSettings/customShowDialog.dart';

class AlarmBefor extends StatelessWidget {
  AlarmBefor({super.key});
  final ImpSettingsController settingsController =
      Get.find<ImpSettingsController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Text("76".tr,
              style: TextStyleFonts.BodyText.copyWith(
                  color: Theme.of(context).colorScheme.onPrimary)),
        ),
        Row(
          children: [
            Text(
              "${settingsController.selectedCurrentAlarmBeforRadioValue} ${"44".tr}",
              style: TextStyleFonts.Subtext.copyWith(
                  color: Theme.of(context).colorScheme.scrim),
            ),
            IconButton(
                onPressed: () {
                  settingsController.alarmDialogDismissedClosed.value = false;
                  settingsController.changeAlarmBefoeRaioValue(
                      settingsController.selectedCurrentAlarmBeforRadioValue!);
                  CustomAlarmShowDialog(context);
                },
                icon: Icon(
                  Icons.keyboard_arrow_down_outlined,
                  color: Colors.black,
                )),
          ],
        ),
      ],
    );
  }
}
