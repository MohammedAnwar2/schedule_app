import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:schedule_app/core/constants/keys.dart';
import 'package:schedule_app/core/constants/themeOfApp/fonts.dart';
import 'package:schedule_app/core/controller/settingsController.dart';
import 'package:schedule_app/core/services/services.dart';

class CustomRadioListTile extends StatelessWidget {
  CustomRadioListTile({super.key, required this.radioValue});

  final int radioValue;
  final ImpSettingsController settingsController =
      Get.find<ImpSettingsController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ImpSettingsController>(
        init: ImpSettingsController(),
        builder: (_) {
          return Padding(
            padding: EdgeInsets.only(top: 8.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                    SettingServices.instance.read(Keys.language) == 'ar'
                        ? settingsController.arabicCalender[radioValue]
                        : settingsController.englishCalender[radioValue],
                    // Text("$radioValue",
                    style: TextStyleFonts.BodyText.copyWith(
                        color: settingsController.selectedLanguageRadioValue ==
                                radioValue
                            ? Theme.of(context).colorScheme.onPrimary
                            : Theme.of(context).colorScheme.scrim)),
                Theme(
                  data: ThemeData(
                    //here change to your color
                    unselectedWidgetColor:
                        Theme.of(context).colorScheme.primary,
                  ),
                  child: Radio(
                    visualDensity: const VisualDensity(
                        horizontal: VisualDensity.minimumDensity,
                        vertical: VisualDensity.minimumDensity),
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    value: radioValue,
                    activeColor: Theme.of(context).colorScheme.primary,
                    focusColor: Theme.of(context).colorScheme.primary,
                    hoverColor: Theme.of(context).colorScheme.primary,
                    groupValue: settingsController.selectedCalenderRadioValue,
                    onChanged: (value) {
                      settingsController.changeCalenderRaioValue(value!);
                    },
                  ),
                )
              ],
            ),
          );
        });
  }
}
