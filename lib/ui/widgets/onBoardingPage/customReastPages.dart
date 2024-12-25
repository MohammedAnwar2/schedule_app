// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:schedule_app/core/constants/keys.dart';
import 'package:schedule_app/core/constants/themeOfApp/fonts.dart';
import 'package:schedule_app/core/services/services.dart';
import 'package:schedule_app/data/datasource/onBoarding.dart';
import 'package:schedule_app/routes/appRoutes.dart';

class RestBoardingPages3 extends StatelessWidget {
  const RestBoardingPages3({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 24.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Align(
              alignment: SettingServices.instance.read(Keys.language) == "ar"
                  ? Alignment.centerLeft
                  : Alignment.centerRight,
              child: TextButton(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    minimumSize: Size(40, 30),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  onPressed: () {
                    Get.offAllNamed(AppRoute.InitailPage);
                  },
                  child: Text(
                    '6'.tr,
                    style: TextStyleFonts.HeadingText.apply(
                        color: Theme.of(context).colorScheme.primary),
                  ))),
          SvgPicture.asset(
            SettingServices.instance.read(Keys.language) == "ar"
                ? OnBoardingListArabic[index].image!
                : OnBoardingListEnglish[index].image!,
            width: 275.w,
            height: 275.h,
          ),
          SizedBox(
            height: 38.h,
          ),
          Container(
            height: 42.h,
            alignment: AlignmentDirectional.centerStart,
            child: Text(
              SettingServices.instance.read(Keys.language) == "ar"
                  ? OnBoardingListArabic[index].title!
                  : OnBoardingListEnglish[index].title!,
              style: TextStyleFonts.OnboardingText.apply(
                  color: Theme.of(context).colorScheme.onPrimaryContainer),
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
          RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  text: SettingServices.instance.read(Keys.language) == "ar"
                      ? OnBoardingListArabic[index].body!
                      : OnBoardingListEnglish[index].body!,
                  style: TextStyleFonts.HeadingText.apply(
                      color: Theme.of(context)
                          .colorScheme
                          .onPrimaryContainer
                          .withOpacity(0.7)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
