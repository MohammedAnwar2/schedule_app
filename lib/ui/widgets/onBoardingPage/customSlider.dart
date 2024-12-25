// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:schedule_app/core/controller/onBoardingController.dart';
import 'package:schedule_app/data/datasource/onBoarding.dart';
import 'package:schedule_app/ui/widgets/onBoardingPage/customFirstPageOnBoarding.dart';
import 'package:schedule_app/ui/widgets/onBoardingPage/customReastPages.dart';

class CustomSlider extends StatelessWidget {
  CustomSlider({super.key});
  final onBoardingController = Get.find<OnBoardingCintrollerImp>();
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: onBoardingController.pageController,
      onPageChanged: (value) {
        onBoardingController.onPageChanged(value);
      },
      itemCount: OnBoardingListEnglish.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(left: 24.w, right: 24.w),
          child: Column(
            children: [
              index == 0
                  ? CustomFirstPageOnBoarding(index: index)
                  : Container(),
              index != 0
                  ? RestBoardingPages3(
                      index: index,
                    )
                  : Container(),
            ],
          ),
        );
      },
    );
  }
}
