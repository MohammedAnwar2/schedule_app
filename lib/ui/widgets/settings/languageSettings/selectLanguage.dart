import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:schedule_app/components/customFloatingButtom.dart';
import 'package:schedule_app/core/constants/themeOfApp/fonts.dart';
import 'package:schedule_app/core/controller/localizationController.dart';
import 'package:schedule_app/core/controller/settingsController.dart';
import 'package:schedule_app/core/controller/sliderMenuController.dart';
import 'package:schedule_app/ui/widgets/settings/languageSettings/customRadioListTile.dart';

final ImpMyLanguageController languageController =
    Get.find<ImpMyLanguageController>();
final ImpSettingsController settingsController =
    Get.find<ImpSettingsController>();
ImpSliderMenuController sliderMenuController =
    Get.find<ImpSliderMenuController>();
SelectLanguage({required BuildContext context}) {
  return showModalBottomSheet(
    isDismissible: false,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(32.0),
      ),
    ),
    context: context,
    builder: (context) {
      return Container(
        width: double.infinity,
        height: 238.h,
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.onSecondaryContainer,
            // color: Colors.red,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(32), topRight: Radius.circular(32)),
            border: Border.all(
              color: Theme.of(context).colorScheme.onSecondaryContainer,
            )),
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
            child: Text("72".tr,
                style: TextStyleFonts.CTAText.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary)),
          ),
          Divider(
            color: Color(0xffCBD2E0),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: CustomRadioListTile(
              radioValue: "3".tr,
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: CustomRadioListTile(
              radioValue: "2".tr,
            ),
          ),
          Spacer(),
          Center(
            child: CustomFloatingButtom(
              is_initializPage: false,
              text: "38".tr,
              press: () {
                if (settingsController.selectedLanguageRadioValue == "3".tr) {
                  languageController.changeLangauge("en");
                  settingsController.changeLanguageRaioValue("English");
                  settingsController.chnageCurrentDate();
                } else {
                  languageController.changeLangauge("ar");
                  settingsController.changeLanguageRaioValue("عربي");
                  settingsController.chnageCurrentDate();
                }
                sliderMenuController.changeAnimationState(
                    sliderMenuController.animationController);
                Get.back();
              },
            ),
          ),
          SizedBox(
            height: 15.h,
          )
        ]),
      );
    },
  );
}
