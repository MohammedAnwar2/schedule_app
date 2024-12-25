import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:schedule_app/core/constants/keys.dart';
import 'package:schedule_app/core/constants/themeOfApp/fonts.dart';
import 'package:schedule_app/core/controller/localizationController.dart';
import 'package:schedule_app/core/controller/sliderMenuController.dart';
import 'package:schedule_app/core/services/services.dart';
import 'package:schedule_app/data/datasource/onBoarding.dart';

class CustomFirstPageOnBoarding extends StatefulWidget {
  const CustomFirstPageOnBoarding({Key? key, required this.index})
      : super(key: key);

  final int index;

  @override
  State<CustomFirstPageOnBoarding> createState() =>
      _CustomFirstPageOnBoardingState();
}

final controller = Get.find<ImpMyLanguageController>();

ImpSliderMenuController sliderMenuController =
    Get.find<ImpSliderMenuController>();

class _CustomFirstPageOnBoardingState extends State<CustomFirstPageOnBoarding> {
  bool checkBoxForArabic = false;
  bool checkBoxForEnglish = true;

  @override
  void initState() {
    super.initState();

    String deviceLangauge = Get.deviceLocale.toString();
    if (SettingServices.instance.read(Keys.language) == null) {
      if (deviceLangauge.substring(0, 2) == "ar") {
        SettingServices.instance.write(Keys.language, "ar");
        checkBoxForArabic = true;
        checkBoxForEnglish = false;
        sliderMenuController
            .changeAnimationState(sliderMenuController.animationController);
      } else {
        SettingServices.instance.write(Keys.language, "en");
        checkBoxForArabic = false;
        checkBoxForEnglish = true;
        sliderMenuController
            .changeAnimationState(sliderMenuController.animationController);
      }
    } else {
      if (SettingServices.instance.read(Keys.language) == "ar") {
        checkBoxForArabic = true;
        checkBoxForEnglish = false;
        sliderMenuController
            .changeAnimationState(sliderMenuController.animationController);
      } else {
        checkBoxForArabic = false;
        checkBoxForEnglish = true;
        sliderMenuController
            .changeAnimationState(sliderMenuController.animationController);
      }
    }
  }

  Container localizationSelect(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      width: 342.w,
      height: 144.h,
      decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(16.r)),
      child: Column(
        children: <Widget>[
          Container(
            height: 48.h,
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.background,
                //color: Color(0xff202122),
                borderRadius: BorderRadius.circular(8)),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "3".tr,
                      style: TextStyleFonts.CTAText.apply(
                          color: Theme.of(context).colorScheme.onPrimary),
                    ),
                    IconButton(
                        onPressed: () {
                          controller.changeLangauge("en");
                          setState(() {});
                          checkBoxForArabic = false;
                          checkBoxForEnglish = true;
                          sliderMenuController.changeAnimationState(
                              sliderMenuController.animationController);
                          settingsController.changeLanguageRaioValue("English");
                          settingsController.chnageCurrentDate();
                        },
                        icon: checkBoxForEnglish == true
                            ? Icon(
                                Icons.radio_button_checked,
                                color: Theme.of(context).colorScheme.secondary,
                              )
                            : Icon(
                                Icons.radio_button_unchecked,
                                color: Theme.of(context).colorScheme.secondary,
                              ))
                  ]),
            ),
          ),
          SizedBox(
            height: 16.h,
          ),
          Container(
            height: 48.h,
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.background,
                //color: Color(0xff202122),
                borderRadius: BorderRadius.circular(8)),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "2".tr,
                      style: TextStyleFonts.CTAText.apply(
                          color: Theme.of(context).colorScheme.onPrimary),
                    ),
                    IconButton(
                        onPressed: () {
                          controller.changeLangauge("ar");
                          setState(() {});
                          checkBoxForArabic = true;
                          checkBoxForEnglish = false;
                          sliderMenuController.changeAnimationState(
                              sliderMenuController.animationController);
                          settingsController.changeLanguageRaioValue("عربي");
                          settingsController.chnageCurrentDate();
                        },
                        icon: checkBoxForArabic == true
                            ? Icon(Icons.radio_button_checked,
                                color: Theme.of(context).colorScheme.secondary)
                            : Icon(Icons.radio_button_unchecked,
                                color: Theme.of(context).colorScheme.secondary))
                  ]),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(top: 50.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SvgPicture.asset(
            SettingServices.instance.read(Keys.language) == "ar"
                ? OnBoardingListArabic[widget.index].image!
                : OnBoardingListEnglish[widget.index].image!,
            width: 275.w,
            height: 275.h,
          ),
          SizedBox(
            height: 24.h,
          ),
          localizationSelect(context),
          SizedBox(
            height: 24.h,
          ),
          RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  text: SettingServices.instance.read(Keys.language) == "ar"
                      ? OnBoardingListArabic[widget.index].title!
                      : OnBoardingListEnglish[widget.index].title!,
                  style: TextStyleFonts.OnboardingText.apply(
                      color: Theme.of(context).colorScheme.onPrimary),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
