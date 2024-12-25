import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:schedule_app/core/constants/keys.dart';
import 'package:schedule_app/core/constants/themeOfApp/fonts.dart';
import 'package:schedule_app/core/controller/timeTable/timeTableController.dart';
import 'package:schedule_app/core/services/services.dart';
import 'package:schedule_app/data/datasource/categories.dart';

class TimeTableInitPage extends StatelessWidget {
  TimeTableInitPage({super.key});
  final ImpTimeTableController timeTableController =
      Get.find<ImpTimeTableController>();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 50.h),
        SvgPicture.asset(
          SettingServices.instance.read(Keys.language) == "en"
              ? categoriesListEnglish["timeTable"]
              : categoriesListArabic["timeTable"],
          width: 104.w,
          height: 232.h,
        ),
        SizedBox(height: 31.h),
        Text(
            timeTableController.workDaysFullName.isEmpty
                ? "21".tr
                : SettingServices.instance.read(Keys.timeTable) == null
                    ? "22".tr
                    : "23".tr,
            style: TextStyleFonts.HeadingText.apply(
                color: Theme.of(context).colorScheme.onPrimary))
      ],
    );
  }
}
