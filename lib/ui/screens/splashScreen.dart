// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:schedule_app/core/constants/keys.dart';
import 'package:schedule_app/core/services/services.dart';
import 'package:schedule_app/routes/appRoutes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 2),
      () {
        SettingServices.instance.read(Keys.userName) == null
            ? Get.offAllNamed(AppRoute.Onboarding)
            : Get.offAllNamed(AppRoute.HomePage);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
        ),
        body: SizedBox(
          width: double.infinity,
          child: Padding(
            padding:
                EdgeInsetsDirectional.only(top: 100.h, start: 72.w, end: 73.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Get.isDarkMode
                    ? SvgPicture.asset(
                        "assets/splashScreenImagesDarkMod/splash1.svg")
                    : SvgPicture.asset("assets/splashScreenImages/splash1.svg",
                        width: 245.w, height: 245.h),
                SizedBox(
                  height: 69.h,
                ),
                Text(
                  'جـــــــــــــــــــــــــــــــــــــــدول',
                  style: TextStyle(
                          fontSize: 28.sp,
                          fontWeight: FontWeight.w500,
                          fontFamily: "Tajawal-Medium")
                      .apply(color: Theme.of(context).colorScheme.secondary),
                  // style: GoogleFonts.tajawal(
                  //   fontSize: 28.sp,
                  //   fontWeight: FontWeight.w700,
                  //   // height: 0.05,
                  //   // letterSpacing: -0.28,
                  // ).apply(color: Theme.of(context).colorScheme.secondary),
                ),
              ],
            ),
          ),
        ));
  }
}
