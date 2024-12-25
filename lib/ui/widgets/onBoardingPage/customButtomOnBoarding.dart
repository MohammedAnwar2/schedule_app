import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:schedule_app/core/constants/themeOfApp/fonts.dart';
import 'package:schedule_app/core/controller/onBoardingController.dart';

class CustomButtomOnBoarding extends StatelessWidget {
  CustomButtomOnBoarding({super.key});

  final onBoardingController = Get.find<OnBoardingCintrollerImp>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onBoardingController.next();
      },
      child: Container(
          width: 294.w,
          height: 48.h,
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 12.h),
          decoration: ShapeDecoration(
            color: Theme.of(context).colorScheme.primary,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r)),
          ),
          child: Align(
            alignment: Alignment.center,
            child: Text(
              '5'.tr,
              textAlign: TextAlign.right,
              //style: TextStyle(color: Colors.black),
              style: TextStyleFonts.CTAText.apply(
                  color: Theme.of(context).cardColor),
            ),
          )),
    );
  }
}
