import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schedule_app/core/constants/keys.dart';
import 'package:schedule_app/core/services/services.dart';

abstract class SliderMenuController extends GetxController {
  void sliderMenu(bool value);
  // void transferWidget(int value);
  void changeAnimationState(var state);
  void changeScaleAnimationState(var state);
  void resetEveryAnimation();
}

class ImpSliderMenuController extends SliderMenuController
    with GetSingleTickerProviderStateMixin {
  bool? isSlideMenuClosed;
  // int? transferValue;
  late Animation<double> animation;
  late Animation<double> sacleAnimation;
  late AnimationController animationController;

  @override
  void onInit() {
    isSlideMenuClosed = true;
    // transferValue = 0;
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 350))
      ..addListener(() {
        update();
      });
    changeAnimationState(animationController);
    changeScaleAnimationState(animationController);
    super.onInit();
  }

  @override
  void sliderMenu(bool value) {
    isSlideMenuClosed = value;
    update();
  }

  changeAnimationState(var state) {
    animation = Tween<double>(
            begin: 0,
            end: SettingServices.instance.read(Keys.language) == "ar" ? -1 : 1)

        ///1 , -1
        .animate(CurvedAnimation(
            parent: state, curve: Curves.fastOutSlowIn)); //from here
    update();
  }

  @override
  void changeScaleAnimationState(state) {
    sacleAnimation = Tween<double>(begin: 1, end: 0.8).animate(CurvedAnimation(
        parent: state, curve: Curves.fastOutSlowIn)); //from here
    update();
  }

  @override
  void resetEveryAnimation() {
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 350))
      ..addListener(() {
        update();
      });
    changeAnimationState(animationController);
  }
}
