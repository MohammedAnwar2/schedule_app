// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:schedule_app/core/constants/keys.dart';
import 'package:schedule_app/core/constants/themeOfApp/fonts.dart';
import 'package:schedule_app/core/controller/timeTable/timeTableController.dart';
import 'package:schedule_app/core/services/services.dart';

class RepeatDaysForTimeTable extends GetView<ImpTimeTableController> {
  RepeatDaysForTimeTable({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ImpTimeTableController>(
        init: ImpTimeTableController(),
        builder: (_) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
                controller.days.length,
                (i) => GestureDetector(
                      onTap: () {
                        print(i);

                        controller.selectRepeatDays(controller.days[i]);
                        print(controller.repeatDays);
                      },
                      child: Container(
                          width: 46.w,
                          height: 32.h,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color:
                                controller.searchRepeatDays(controller.days[i])
                                    ? Theme.of(context).colorScheme.primary
                                    : Theme.of(context).colorScheme.background,
                            border: Border.all(
                              color: controller
                                      .searchRepeatDays(controller.days[i])
                                  ? Theme.of(context).colorScheme.primary
                                  : Theme.of(context).colorScheme.primary,
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.r)),
                          ),
                          child: Text(
                              SettingServices.instance.read(Keys.language) != "ar"
                                  ? controller.days[i]
                                  : controller
                                      .arabicWorkDaysFullNameConstant[i],
                              style: TextStyleFonts.Medium12.copyWith(
                                  fontSize: SettingServices.instance
                                              .read(Keys.language) ==
                                          "ar"
                                      ? 11.sp
                                      : 12.sp,
                                  color: controller
                                          .searchRepeatDays(controller.days[i])
                                      ? Theme.of(context)
                                          .colorScheme
                                          .onSecondaryContainer
                                      : Theme.of(context)
                                          .colorScheme
                                          .onPrimary))),
                    )),
          );
        });
  }
}
/*
SettingServices.instance.read(Keys.language) != "ar"
                                  ? controller.days[i]
                                  : controller
                                      .arabicWorkDaysFullNameConstant[i],
                              style: TextStyleFonts.Medium12.copyWith(
                                  fontSize:
                                      SettingServices.instance.read(Keys.language) ==
                                              "ar"
                                          ? 11.sp
                                          : 12.sp,
 */