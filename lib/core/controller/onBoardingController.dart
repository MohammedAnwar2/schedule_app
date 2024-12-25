import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schedule_app/data/datasource/onBoarding.dart';
import 'package:schedule_app/routes/appRoutes.dart';

abstract class OnBoardingController extends GetxController {
  next();
  onPageChanged(int index);
}

class OnBoardingCintrollerImp extends OnBoardingController {
  int currentPage = 0;
  late PageController pageController;
  @override
  next() {
    currentPage++;
    if (currentPage >= OnBoardingListEnglish.length) {
      Get.offAllNamed(AppRoute.InitailPage);
    } else {
      pageController.animateToPage(
        currentPage,
        duration: const Duration(milliseconds: 900),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  onPageChanged(int index) {
    currentPage = index;
    update();
  }

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }
}
