import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:schedule_app/core/constants/themeOfApp/fonts.dart';

customTextFormValidation(BuildContext context,
    {required TextEditingController textController, required String missing}) {
  if (textController.text.isEmpty) {
    return Get.defaultDialog(
        title: "",
        backgroundColor: Theme.of(context).colorScheme.onSecondaryContainer,
        content: SizedBox(
          width: 342.w,
          height: 60.h,
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
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                      size: 16.r,
                    ),
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                  Text(
                    '105'.tr + '$missing',
                    style: TextStyleFonts.CTAText.apply(
                        color: Theme.of(context).colorScheme.error),
                  ),
                ],
              ),
              SizedBox(
                height: 8.h,
              ),
              Text(
                '106'.tr,
                style: TextStyleFonts.Subtext.apply(
                    color: Theme.of(context).colorScheme.onPrimaryContainer),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: Text("107".tr,
                style: TextStyleFonts.CTAText.apply(
                    color: Theme.of(context).colorScheme.secondary)),
          ),
        ]);
  } else {
    return true;
  }
}
