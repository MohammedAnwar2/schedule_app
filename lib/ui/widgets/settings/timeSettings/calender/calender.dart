import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:schedule_app/core/constants/keys.dart';
import 'package:schedule_app/core/constants/themeOfApp/fonts.dart';
import 'package:schedule_app/core/controller/settingsController.dart';
import 'package:schedule_app/core/services/services.dart';
import 'package:schedule_app/ui/widgets/settings/timeSettings/calender/customCalenderShowDialog.dart';

class Calender extends StatelessWidget {
  Calender({super.key});
  final ImpSettingsController settingsController =
      Get.find<ImpSettingsController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Text("80".tr,
              style: TextStyleFonts.BodyText.copyWith(
                  color: Theme.of(context).colorScheme.onPrimary)),
        ),
        Row(
          children: [
            Text(
              SettingServices.instance.read(Keys.language) == 'ar'
                  ? settingsController.arabicCalender[
                      settingsController.selectedCurrentCalenderRadioValue!]
                  : settingsController.englishCalender[
                      settingsController.selectedCurrentCalenderRadioValue!],
              style: TextStyleFonts.Subtext.copyWith(
                  color: Theme.of(context).colorScheme.scrim),
            ),
            IconButton(
                onPressed: () {
                  settingsController.changeCalenderRaioValue(
                      settingsController.selectedCurrentCalenderRadioValue!);
                  settingsController.calendarDialogDismissedClosed.value =
                      false;
                  CustomCalenderShowDialog(context);
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
