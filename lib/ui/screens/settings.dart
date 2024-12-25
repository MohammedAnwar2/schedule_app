import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:schedule_app/components/customSimpleAppBar.dart';
import 'package:schedule_app/components/customTextFormField.dart';
import 'package:schedule_app/core/constants/keys.dart';
import 'package:schedule_app/core/constants/themeOfApp/fonts.dart';
import 'package:schedule_app/core/services/services.dart';
import 'package:schedule_app/ui/widgets/settings/alarmsSettings/alarmsSettings.dart';
import 'package:schedule_app/ui/widgets/settings/contactUs/cuntactUs.dart';
import 'package:schedule_app/ui/widgets/settings/editNameButton.dart';
import 'package:schedule_app/ui/widgets/settings/languageSettings/languageSettings.dart';
import 'package:schedule_app/ui/widgets/settings/timeSettings/timeSettings.dart';

class Settings extends StatefulWidget {
  Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  TextEditingController username = TextEditingController();
  @override
  void initState() {
    super.initState();
    username.text = SettingServices.instance.read(Keys.userName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SimplAppBar(
                press: () {
                  Get.back();
                },
                text: "60".tr,
              ),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.only(top: 12.h),
                  children: [
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("61".tr,
                                style: TextStyleFonts.BodyText.copyWith(
                                    color:
                                        Theme.of(context).colorScheme.scrim)),
                            SizedBox(
                              height: 8.h,
                            ),
                            //================================================================
                            CustomTextForm(
                              controller: username,
                              suffixIcon: GestureDetector(
                                child: Padding(
                                  padding: const EdgeInsets.all(11.0),
                                  child: SvgPicture.asset(
                                    "assets/icons/classTime.svg",
                                    color: Theme.of(context).colorScheme.scrim,
                                  ),
                                ),
                                onTap: () {
                                  customShowCustomDialogToEditUserName(
                                      username: username, context: context);
                                },
                              ),
                              readOnly: true,
                            ),
                            //================================================================
                            TimeSettings(),
                            AlarmsSettings(),
                            LanguageSettings(),
                            SizedBox(
                              height: 24.h,
                            ),
                            Text("65".tr,
                                style: TextStyleFonts.BodyText.copyWith(
                                    color:
                                        Theme.of(context).colorScheme.scrim)),
                            SizedBox(
                              height: 11.h,
                            ),
                            CuntactUs(),
                            SizedBox(
                              height: 26.h,
                            ),
                            Center(
                                child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Text("70".tr,
                                      style: TextStyleFonts.Regular14.copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onPrimary
                                              .withOpacity(0.5))),
                                  SizedBox(
                                    height: 8.h,
                                  ),
                                  Center(
                                    child: SvgPicture.asset(
                                        "assets/icons/rukin2.svg",
                                        width: 50.w,
                                        height: 50.h),
                                  ),
                                  SizedBox(
                                    height: 8.h,
                                  ),
                                  Text("71".tr,
                                      style: TextStyleFonts.Regular12.copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onPrimary
                                              .withOpacity(0.5))),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                ],
                              ),
                            ))
                          ],
                        )),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
