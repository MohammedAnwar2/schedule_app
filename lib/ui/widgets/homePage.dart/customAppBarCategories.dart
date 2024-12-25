import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:schedule_app/core/constants/keys.dart';
import 'package:schedule_app/core/constants/themeOfApp/fonts.dart';
import 'package:schedule_app/core/controller/settingsController.dart';
import 'package:schedule_app/core/controller/sliderMenuController.dart';
import 'package:schedule_app/core/services/services.dart';
import 'package:schedule_app/routes/appRoutes.dart';
import 'package:schedule_app/ui/widgets/homePage.dart/categoryDaitals.dart';

class CustomAppBar extends StatelessWidget {
  CustomAppBar({
    super.key,
  });
  final ImpSettingsController settingsController =
      Get.find<ImpSettingsController>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ImpSliderMenuController>(
        init: ImpSliderMenuController(),
        builder: (SliderMenuController) {
          return Container(
            padding:
                EdgeInsetsDirectional.only(top: 45.h, start: 16.w, end: 16.w),
            width: double.infinity,
            height: 280.h,
            decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                  topLeft: Radius.circular(
                      SliderMenuController.isSlideMenuClosed == true
                          ? SliderMenuController.animationController.value * 0
                          : SliderMenuController.animationController.value *
                              16), //11111111111111111111111111
                  topRight: Radius.circular(
                      SliderMenuController.isSlideMenuClosed == true
                          ? SliderMenuController.animationController.value * 0
                          : SliderMenuController.animationController.value *
                              16), //1111111111111111111111111
                )),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        SliderMenuController.animationController.forward();
                        SliderMenuController.sliderMenu(false);
                      },
                      child: SvgPicture.asset(
                        "assets/icons/List.svg",
                        color: Theme.of(context).colorScheme.shadow,
                        width: 24.w,
                        height: 24.h,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(AppRoute.NotificationScreen);
                      },
                      child: SvgPicture.asset(
                        "assets/icons/notification.svg",
                        color: Theme.of(context).colorScheme.shadow,
                        width: 24.w,
                        height: 24.h,
                      ),
                    ),
                    //  Icon(Iconsax.)
                  ],
                ),
                SizedBox(height: 16.h),
                Text(
                  '${"14".tr} ${SettingServices.instance.read(Keys.userName)} , ${"15".tr}',
                  style: TextStyleFonts.HeadingText.apply(
                      color: Theme.of(context).colorScheme.onPrimary),
                ),
                SizedBox(height: 3.h),
                GetBuilder<ImpSliderMenuController>(
                    init: ImpSliderMenuController(),
                    builder: (_) {
                      return Text(
                        settingsController.currentDate!,
                        style: TextStyleFonts.Subtext.apply(
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimaryContainer
                                .withOpacity(0.6)),
                      );
                    }),
                SizedBox(height: 16.h),
                const Categories(),
              ],
            ),
          );
        });
  }
}
