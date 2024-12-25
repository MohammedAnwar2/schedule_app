// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:schedule_app/ui/widgets/onBoardingPage/customButtomOnBoarding.dart';
import 'package:schedule_app/ui/widgets/onBoardingPage/customDotController.dart';
import 'package:schedule_app/ui/widgets/onBoardingPage/customSlider.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  // final themeController = Get.find<ThemeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //    appBar: _appBar(context),
      // backgroundColor: Color(0xff202122),
      body: Padding(
        padding: EdgeInsets.only(top: 37.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 5,
              child: CustomSlider(),
            ),
            Expanded(
                flex: 1,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Spacer(),
                    CustomDotController(),
                    SizedBox(
                      height: 24.h,
                    ),
                    CustomButtomOnBoarding(),
                    SizedBox(
                      height: 42.h,
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}













// _appBar(BuildContext context) => AppBar(
//       elevation: 0,
//       leading: IconButton(
//           onPressed: () {
//             if (!Get.isDarkMode) {
//               //-------------> this one
//               themeController.changeTheme(Themes().darkTheme);
//               themeController.changeThemeMode(ThemeMode.dark);
//               themeController.saveTheme(true);
//               LocalNotifications.showSimpleNotification(
//                   title: !Get.isDarkMode ? "Dark Mode" : "Light Mode",
//                   body: "sdfsdfsd",
//                   payload: "sdfsdfsdf");
//             } else {
//               themeController.changeTheme(Themes().lightTheme);
//               themeController.changeThemeMode(ThemeMode.light);
//               themeController.saveTheme(false);
//               LocalNotifications.showSimpleNotification(
//                   title: !Get.isDarkMode ? "Dark Mode" : "Light Mode",
//                   body: "sdfsdfsd",
//                   payload: "sdfsdfsdf");
//             }
//           },
//           icon: Icon(Icons.dark_mode,
//               color: Theme.of(context).colorScheme.onPrimary)),
//     );















//     Container(
//   height: 100,
//   width: 100,
//   color: Theme.of(context).colorScheme.secondary,
//   child: Text('text',
//       style: Theme.of(context)
//           .textTheme
//           .bodyLarge!
//           .apply(color: Theme.of(context).cardColor)),
// )
