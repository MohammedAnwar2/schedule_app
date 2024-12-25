import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schedule_app/core/constants/themeOfApp/theme.dart';
import 'package:schedule_app/core/controller/ThemeController.dart';
import 'package:schedule_app/core/controller/localizationController.dart';
import 'package:schedule_app/core/controller/sliderMenuController.dart';

ImpSliderMenuController sliderMenuController =
    Get.find<ImpSliderMenuController>();

class ChangeThemeBottom extends StatelessWidget {
  const ChangeThemeBottom({
    super.key,
    required this.themeController,
  });

  final ThemeController themeController;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        if (!Get.isDarkMode) {
          print("light");
          //-------------> this one
          themeController.changeTheme(Themes.darkTheme);
          themeController.changeThemeMode(ThemeMode.dark);
          themeController.saveTheme(true);
          // LocalNotifications.showSimpleNotification(
          //     title: !Get.isDarkMode ? "Dark Mode" : "Light Mode",
          //     body: "sdfsdfsd",
          //     payload: "sdfsdfsdf");
        } else {
          print("dark");
          themeController.changeTheme(Themes.lightTheme);
          themeController.changeThemeMode(ThemeMode.light);
          themeController.saveTheme(false);
          // LocalNotifications.showSimpleNotification(
          //     title: !Get.isDarkMode ? "Light Mode" : "Light Mode",
          //     body: "sdfsdfsd",
          //     payload: "sdfsdfsdf");
        }
      },
      icon: Icon(Icons.add, color: Theme.of(context).colorScheme.primary),
    );
  }
}

void ChangeTheme() {
  final ThemeController themeController = Get.find<ThemeController>();
  if (!Get.isDarkMode) {
    print("light");
    //-------------> this one
    themeController.changeTheme(Themes.darkTheme);
    themeController.changeThemeMode(ThemeMode.dark);
    themeController.saveTheme(true);
    sliderMenuController
        .changeAnimationState(sliderMenuController.animationController);

    // LocalNotifications.showSimpleNotification(
    //      title: !Get.isDarkMode ? "Dark Mode" : "Light Mode",
    //     body: "sdfsdfsd",
    //     payload: "sdfsdfsdf");
  } else {
    print("dark");
    themeController.changeTheme(Themes.lightTheme);
    themeController.changeThemeMode(ThemeMode.light);
    themeController.saveTheme(false);
    sliderMenuController
        .changeAnimationState(sliderMenuController.animationController);
    // LocalNotifications.showSimpleNotification(
    //     title: !Get.isDarkMode ? "Light Mode" : "Light Mode",
    //     body: "sdfsdfsd",
    //     payload: "sdfsdfsdf");
  }
}
