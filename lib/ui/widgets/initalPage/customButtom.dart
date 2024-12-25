// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:schedule_app/core/constants/keys.dart';
import 'package:schedule_app/core/constants/themeOfApp/fonts.dart';
import 'package:schedule_app/core/services/services.dart';
import 'package:schedule_app/routes/appRoutes.dart';

class CustomButtom extends StatelessWidget {
  CustomButtom({
    super.key,
    required this.textController,
    required this.keyForm,
  });

  final TextEditingController textController;

  final GlobalKey<FormState> keyForm;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (keyForm.currentState!.validate()) {
          keyForm.currentState!.save();
          if (textController.text.isEmpty) {
            Get.defaultDialog(
                title: "",
                backgroundColor:
                    Theme.of(context).colorScheme.onSecondaryContainer,
                content: SizedBox(
                  width: 342.w,
                  //   height: 60.h,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(bottom: 7.h),
                            child: Icon(
                              Icons.error_outline,
                              color: Theme.of(context)
                                  .colorScheme
                                  .onPrimaryContainer,
                              size: 16.r,
                            ),
                          ),
                          SizedBox(
                            width: 4.w,
                          ),
                          Text(
                            'You forgot to write your name',
                            style: TextStyleFonts.CTAText.apply(
                                color: Theme.of(context).colorScheme.error),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Text(
                        'Please fill the missing fields',
                        style: TextStyleFonts.Subtext.apply(
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimaryContainer),
                      ),
                    ],
                  ),
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: Text("OK",
                        style: TextStyleFonts.CTAText.apply(
                            color: Theme.of(context).colorScheme.secondary)),
                  ),
                ]);
          } else {
            SettingServices.instance.write(Keys.userName, textController.text);
            Get.offAllNamed(AppRoute.HomePage);
          }
        }
      },
      child: Container(
        width: 294.w,
        height: 48.h,
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 12.h),
        decoration: ShapeDecoration(
          color: Theme.of(context).colorScheme.primary,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
        ),
        child: Container(
            alignment: Alignment.center,
            child: Text(
              '9'.tr,
              textAlign: TextAlign.right,
              style: TextStyleFonts.CTAText.apply(
                  color: Theme.of(context).cardColor),
            )),
      ),
    );
  }
}
