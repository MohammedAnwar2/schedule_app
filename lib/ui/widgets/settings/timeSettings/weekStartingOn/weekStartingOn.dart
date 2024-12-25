import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:schedule_app/core/constants/keys.dart';
import 'package:schedule_app/core/constants/themeOfApp/fonts.dart';
import 'package:schedule_app/core/controller/settingsController.dart';
import 'package:schedule_app/core/services/services.dart';
import 'package:schedule_app/ui/widgets/settings/timeSettings/weekStartingOn/customShowDialog.dart';

class WeekStartingOn extends StatelessWidget {
  WeekStartingOn({super.key});
  final ImpSettingsController settingsController =
      Get.find<ImpSettingsController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Text("79".tr,
              style: TextStyleFonts.BodyText.copyWith(
                  color: Theme.of(context).colorScheme.onPrimary)),
        ),
        Row(
          children: [
            Text(
              SettingServices.instance.read(Keys.language) == 'ar'
                  ? settingsController.arabicWeeks[settingsController
                      .selectedCurrentWeekStartingOnRadioValue!]
                  : settingsController.englishWeeks[settingsController
                      .selectedCurrentWeekStartingOnRadioValue!],
              style: TextStyleFonts.Subtext.copyWith(
                  color: Theme.of(context).colorScheme.scrim),
            ),
            IconButton(
                onPressed: () {
                  settingsController.changeWeekStartingOnRaioValue(
                      settingsController
                          .selectedCurrentWeekStartingOnRadioValue!);
                  settingsController.weekStartDialogDismissedClosed.value =
                      false;
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
