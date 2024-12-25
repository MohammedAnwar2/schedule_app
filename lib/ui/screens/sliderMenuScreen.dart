import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:schedule_app/components/changesThemeButtom.dart';
import 'package:schedule_app/components/customIconAppBarButton.dart';
import 'package:schedule_app/components/customListTile.dart';
import 'package:schedule_app/core/constants/keys.dart';
import 'package:schedule_app/core/constants/themeOfApp/fonts.dart';
import 'package:schedule_app/core/controller/settingsController.dart';
import 'package:schedule_app/core/services/services.dart';
import 'package:schedule_app/routes/appRoutes.dart';

class SliderMenu extends StatelessWidget {
  SliderMenu({super.key, required this.press});

  final void Function() press;
  final settingsController = Get.find<ImpSettingsController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 12.h, left: 16.w, right: 16.h),
          child: Container(
            width: double.infinity,
            child: Align(
              alignment: SettingServices.instance.read(Keys.language) == 'ar'
                  ? Alignment.centerRight
                  : Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomAppBarButton(
                    icon: Icons.close,
                    press: press,
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  CustomListTile(
                    firstWidget: Text("45".tr, style: TextStyleFonts.BodyText),
                    secondWidget: GetBuilder<ImpSettingsController>(
                        init: ImpSettingsController(),
                        builder: (_) {
                          return Switch(
                            value:
                                settingsController.switchStateOfLightDarkMode!,
                            onChanged: (value) {
                              settingsController
                                  .changeSwitchStateOfDarkLightMode(value);
                              SettingServices.instance
                                  .write(Keys.darkLightMode, value);
                              ChangeTheme();
                            },
                          );
                        }),
                    space: 60,
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  CustomListTile(
                    firstWidget: Icon(
                      Icons.settings,
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                      size: 20.r,
                    ),
                    secondWidget: Text("46".tr, style: TextStyleFonts.BodyText),
                    space: 16,
                    press: () {
                      Get.toNamed(AppRoute.Settings);
                    },
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  CustomListTile(
                    firstWidget: Icon(
                      Icons.error_outline,
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                      size: 17.r,
                    ),
                    secondWidget: Text("47".tr, style: TextStyleFonts.BodyText),
                    space: 16,
                    press: () {
                      Get.toNamed(AppRoute.AbouteUs);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
