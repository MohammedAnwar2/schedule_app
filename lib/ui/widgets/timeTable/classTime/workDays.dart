// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:schedule_app/core/constants/keys.dart';
import 'package:schedule_app/core/constants/themeOfApp/fonts.dart';
import 'package:schedule_app/core/controller/timeTable/timeTableController.dart';
import 'package:schedule_app/core/services/services.dart';

class WorkDays extends StatelessWidget {
  WorkDays({super.key});
  ImpTimeTableController controller = Get.find<ImpTimeTableController>();
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

                        controller.selectWorkDays(controller.days[i]);
                        controller.selectArabicWorkDays(
                            controller.arabicWorkDaysFullNameConstant[i]);
                        // controller.getTheFirstNameOfSelection(
                        //     shortCutDaysName: controller.workDays[0]);
                        // controller.changeWorkDays(controller.workDays);
                        // controller.sortWorkDays(
                        //     shortCutDaysName: controller.workDays);
                        // print(controller.workDays);
                        print("controller.workDays = ${controller.workDays}");
                      },
                      child: Container(
                          width: 46.w,
                          height: 32.h,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: controller.searchWorkDays(controller.days[i])
                                ? Theme.of(context).colorScheme.primary
                                : Theme.of(context)
                                    .colorScheme
                                    .onSecondaryContainer,
                            border: Border.all(
                              color:
                                  controller.searchWorkDays(controller.days[i])
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
                                  fontSize:
                                      SettingServices.instance.read(Keys.language) ==
                                              "ar"
                                          ? 11.sp
                                          : 12.sp,
                                  color: controller
                                          .searchWorkDays(controller.days[i])
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
