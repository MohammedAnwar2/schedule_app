import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:schedule_app/components/customFloatingButtom.dart';
import 'package:schedule_app/core/constants/keys.dart';
import 'package:schedule_app/core/constants/themeOfApp/fonts.dart';
import 'package:schedule_app/core/controller/localizationController.dart';
import 'package:schedule_app/core/controller/settingsController.dart';
import 'package:schedule_app/core/services/services.dart';
import 'package:schedule_app/ui/widgets/settings/timeSettings/calender/customRadioListTile.dart';

class DefultCalender extends StatelessWidget {
  DefultCalender({super.key});

  final ImpMyLanguageController languageController =
      Get.find<ImpMyLanguageController>();
  final ImpSettingsController settingsController =
      Get.find<ImpSettingsController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 238.h,
      margin: EdgeInsets.only(
        bottom: 15.w,
        top: 570.h,
        left: 24.w,
        right: 24.h,
      ),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onSecondaryContainer,
          // color: Colors.red,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32), topRight: Radius.circular(32)),
          border: Border.all(
            color: Theme.of(context).colorScheme.onSecondaryContainer,
          )),
      child: Material(
        borderRadius: BorderRadius.circular(8.0),
        //color: Colors.amber,
        color: Theme.of(context).cardColor,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Center(
            child: Container(
              margin: EdgeInsetsDirectional.only(top: 4.h),
              height: 4.h,
              width: 60.w,
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(10.r),
              ),
            ),
          ),
          SizedBox(height: 16.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Text("80".tr,
                style: TextStyleFonts.CTAText.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary)),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.w),
            child: Divider(
              color: Color(0xffCBD2E0),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: CustomRadioListTile(
              radioValue: 0,
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: CustomRadioListTile(
              radioValue: 1,
            ),
          ),
          Spacer(),
          Center(
            child: CustomFloatingButtom(
              is_initializPage: false,
              text: "38".tr,
              press: () {
                SettingServices.instance.write(Keys.calender,
                    settingsController.selectedCalenderRadioValue!);
                settingsController.changeCurrentCalenderRaioValue(
                    settingsController.selectedCalenderRadioValue!);
                settingsController.chnageCurrentDate();
                Get.back();
              },
            ),
          ),
          SizedBox(
            height: 15.h,
          )
        ]),
      ),
    );
  }
}
