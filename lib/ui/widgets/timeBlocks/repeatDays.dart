import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:schedule_app/core/constants/keys.dart';
import 'package:schedule_app/core/constants/themeOfApp/fonts.dart';
import 'package:schedule_app/core/controller/timeBlocks/timeBlocksController.dart';
import 'package:schedule_app/core/services/services.dart';

class RepeatDays extends GetView<ImpTimeBlocksController> {
  RepeatDays({super.key});

  final timeBlockscontroller = Get.find<ImpTimeBlocksController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ImpTimeBlocksController>(
        init: ImpTimeBlocksController(),
        builder: (_) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
                controller.days.length,
                (i) => GestureDetector(
                      onTap: timeBlockscontroller.repeatSwitchState!
                          ? () {
                              print(i);
                              controller.selectRepeatDays(controller.days[i]);
                            }
                          : null,
                      child: Container(
                          width: 46.w,
                          height: 32.h,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color:
                                controller.searchRepeatDays(controller.days[i])
                                    ? timeBlockscontroller.repeatSwitchState!
                                        ? Theme.of(context).colorScheme.primary
                                        : Theme.of(context)
                                            .colorScheme
                                            .primary
                                            .withOpacity(0.5)
                                    : Theme.of(context).colorScheme.background,
                            border: Border.all(
                                color: controller
                                        .searchRepeatDays(controller.days[i])
                                    ? timeBlockscontroller.repeatSwitchState!
                                        ? Theme.of(context).colorScheme.primary
                                        : Theme.of(context)
                                            .colorScheme
                                            .primary
                                            .withOpacity(0.0)
                                    : timeBlockscontroller.repeatSwitchState!
                                        ? Theme.of(context).colorScheme.primary
                                        : Theme.of(context)
                                            .colorScheme
                                            .primary
                                            .withOpacity(0.5)),
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.r)),
                          ),
                          child: Text(
                              SettingServices.instance.read(Keys.language) ==
                                      "ar"
                                  ? convertEnglishDayToArabic(
                                      controller.days[i])
                                  : controller.days[i],
                              // controller.days[i],
                              style: TextStyleFonts.Medium12.copyWith(
                                  fontSize: SettingServices.instance
                                              .read(Keys.language) ==
                                          "ar"
                                      ? 11.sp
                                      : 12.sp,
                                  color: controller
                                          .searchRepeatDays(controller.days[i])
                                      ? timeBlockscontroller.repeatSwitchState!
                                          ? Theme.of(context)
                                              .colorScheme
                                              .onSecondaryContainer
                                          : Theme.of(context)
                                              .colorScheme
                                              .background
                                              .withOpacity(0.5)
                                      : timeBlockscontroller.repeatSwitchState!
                                          ? Theme.of(context)
                                              .colorScheme
                                              .onPrimary
                                          : Theme.of(context)
                                              .colorScheme
                                              .onPrimary
                                              .withOpacity(0.5)))),
                    )),
          );
        });
  }
}

String convertEnglishDayToArabic(String englishDay) {
  // Map English short names of weekdays to their Arabic equivalents
  final Map<String, String> englishShortToArabicWeekdays = {
    'Mon': 'الاثنين',
    'Tue': 'الثلاثاء',
    'Wed': 'الأربعاء',
    'Thu': 'الخميس',
    'Fri': 'الجمعة',
    'Sat': 'السبت',
    'Sun': 'الأحد',
  };

  // Convert the input English day to uppercase (to handle case-insensitivity)

  // Look up the Arabic equivalent
  String arabicDay = englishShortToArabicWeekdays[englishDay] ?? 'Not found';

  return arabicDay;
}
/*
                              controller
                                      .searchRepeatDays(controller.days[i])
                                  ? Theme.of(context)
                                      .colorScheme
                                      .onSecondaryContainer
                                  : Theme.of(context).colorScheme.onPrimary
 */
/*
GetBuilder<ImpTimeBlocksController>(
                    init: ImpTimeBlocksController(),
                    builder: (_) {
                      return Container(
                        width: 46.w,
                        height: 32.h,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: controller.searchRepeatDays(controller.days[i])
                              ? Theme.of(context).colorScheme.primary
                              : Theme.of(context).colorScheme.background,
                          border: Border.all(
                              color: Theme.of(context).colorScheme.primary),
                          borderRadius: BorderRadius.all(Radius.circular(8.r)),
                        ),
                        child: Text(
                          controller.days[i],
                          style: TextStyleFonts.Medium12.apply(
                              color: controller
                                      .searchRepeatDays(controller.days[i])
                                  ? Theme.of(context)
                                      .colorScheme
                                      .onSecondaryContainer
                                  : Theme.of(context).colorScheme.onPrimary),
                        ),
                      );
                    })
 */
/*
Container(
                        width: 46.w,
                        height: 32.h,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: controller.searchRepeatDays(controller.days[i])
                              ? Theme.of(context).colorScheme.primary
                              : Theme.of(context).colorScheme.background,
                          border: Border.all(
                              color: Theme.of(context).colorScheme.primary),
                          borderRadius: BorderRadius.all(Radius.circular(8.r)),
                        ),
                        child: Text(
                          controller.days[i],
                          style: TextStyleFonts.Medium12.apply(
                              color: 
                              controller
                                      .searchRepeatDays(controller.days[i])
                                  ? Theme.of(context)
                                      .colorScheme
                                      .onSecondaryContainer
                                  : Theme.of(context).colorScheme.onPrimary
                                  ),
                        ),
                      )
 */