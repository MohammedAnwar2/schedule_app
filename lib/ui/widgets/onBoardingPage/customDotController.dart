import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:schedule_app/core/controller/onBoardingController.dart';
import 'package:schedule_app/data/datasource/onBoarding.dart';

class CustomDotController extends StatelessWidget {
  CustomDotController({super.key});
  final onBoardingController = Get.find<OnBoardingCintrollerImp>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingCintrollerImp>(
      init: OnBoardingCintrollerImp(),
      builder: (controller) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(
                OnBoardingListEnglish.length,
                (index) => AnimatedContainer(
                      margin: EdgeInsetsDirectional.only(end: 10.w),
                      height: 8.h,
                      width: onBoardingController.currentPage != index
                          ? 16.w
                          : 34.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: onBoardingController.currentPage == index
                            ? Theme.of(context).colorScheme.primary
                            : Theme.of(context).colorScheme.onPrimary,
                      ),
                      duration: const Duration(milliseconds: 350),
                    ))
          ],
        );
      },
    );
  }
}
