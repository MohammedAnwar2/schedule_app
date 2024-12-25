import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:schedule_app/core/constants/keys.dart';
import 'package:schedule_app/core/constants/themeOfApp/fonts.dart';
import 'package:schedule_app/core/services/services.dart';
import 'package:schedule_app/data/datasource/categories.dart';

class TaskInitPage extends StatelessWidget {
  const TaskInitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 95.h),
        SvgPicture.asset(
          SettingServices.instance.read(Keys.language) == "en"
              ? categoriesListEnglish["task"]
              : categoriesListArabic["task"],
          width: 104.w,
          height: 232.h,
        ),
        SizedBox(height: 31.h),
        Text(
            SettingServices.instance.read(Keys.textTask) == null
                ? "17".tr
                : "18".tr,
            style: TextStyleFonts.HeadingText.apply(
                color: Theme.of(context).colorScheme.onPrimary))
      ],
    );
  }
}
