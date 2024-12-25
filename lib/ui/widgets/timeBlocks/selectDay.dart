import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:schedule_app/core/constants/keys.dart';
import 'package:schedule_app/core/constants/themeOfApp/fonts.dart';
import 'package:schedule_app/core/controller/timeBlocks/timeBlocksController.dart';
import 'package:schedule_app/core/services/services.dart';
import 'package:schedule_app/ui/widgets/timeBlocks/scorllingPosition.dart';

class SelectDay extends StatefulWidget {
  SelectDay({
    super.key,
  });

  @override
  State<SelectDay> createState() => _SelectDayState();
}

class _SelectDayState extends State<SelectDay> {
  final timeBlocksController = Get.find<ImpTimeBlocksController>();

  @override
  void initState() {
    super.initState();
    activeTheScrollToSpecificPosition();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ImpTimeBlocksController>(

        //autoRemove: false,
        //assignId: false,
        init: ImpTimeBlocksController(),
        builder: (_) {
          return SingleChildScrollView(
            controller: timeBlocksController.scrollController,
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: EdgeInsets.only(top: 5.h, left: 10.w, right: 2.w),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: List.generate(timeBlocksController.daysList!.length,
                      (index) {
                    return InkWell(
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onTap: () {
                        print(timeBlocksController.daysList![index]);
                        timeBlocksController.changeDay(
                          indexDay: index,
                          nameOfDay: timeBlocksController.daysList![index]
                              ["day"],
                          noOfDay: timeBlocksController.daysList![index]
                              ["date"],
                          nameOfMonth: timeBlocksController.daysList![index]
                              ["month"],
                        );
                      },
                      child: Padding(
                        padding: EdgeInsets.only(right: 8.w, top: 5.h),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            timeBlocksController.currentDay == index
                                ? SizedBox(
                                    height: 3.h,
                                  )
                                : Container(),
                            Text(
                              // timeBlocksController.dayes[index],
                              // timeBlocksController.daysList![index]["day"],
                              SettingServices.instance.read(Keys.language) ==
                                      "ar"
                                  ? convertEnglishDayToArabic(
                                      timeBlocksController.daysList![index]
                                          ["day"])
                                  : timeBlocksController.daysList![index]
                                      ["day"],
                              style: timeBlocksController.currentDay != index
                                  ? TextStyleFonts.Subtext.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimaryContainer)
                                  : TextStyleFonts.Bold14.apply(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary),
                            ),
                            SizedBox(height: 13.h),
                            Padding(
                              padding: EdgeInsets.only(bottom: 8.h),
                              child: Container(
                                height: timeBlocksController.currentDay != index
                                    ? timeBlocksController.previousDay != index
                                        ? 41.w
                                        : 53.w
                                    //? 41.w
                                    : 53.w,
                                width: 42.w,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: timeBlocksController.currentDay !=
                                            index
                                        ? timeBlocksController.previousDay !=
                                                index
                                            ? Theme.of(context)
                                                .colorScheme
                                                .onSecondaryContainer
                                            : Theme.of(context)
                                                .colorScheme
                                                .background
                                        : Theme.of(context)
                                            .colorScheme
                                            .secondary,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    border: Border.all(
                                        color: timeBlocksController
                                                        .previousDay ==
                                                    index ||
                                                timeBlocksController
                                                        .currentDay ==
                                                    index
                                            ? Theme.of(context)
                                                .colorScheme
                                                .secondary
                                            : Theme.of(context)
                                                .colorScheme
                                                .onSecondaryContainer)),
                                child: Text(
                                  SettingServices.instance
                                              .read(Keys.language) ==
                                          "ar"
                                      ? convertEnglishNumberToArabic(
                                          timeBlocksController.daysList![index]
                                              ["date"])
                                      : timeBlocksController.daysList![index]
                                              ["date"]
                                          .toString(),
                                  // timeBlocksController.daysList![index]["date"].toString(),
                                  style:
                                      timeBlocksController.currentDay != index
                                          ? timeBlocksController.previousDay !=
                                                  index
                                              ? TextStyleFonts.Subtext.apply(
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .onPrimaryContainer)
                                              : TextStyleFonts.CTAText.apply(
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .secondary)
                                          : TextStyleFonts.CTAText.apply(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .background),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  })),
            ),
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
  String arabicDay = englishShortToArabicWeekdays[englishDay] ?? 'Not found';
  return arabicDay;
}

String convertEnglishNumberToArabic(int number) {
  // Map English numbers to their Arabic equivalents
  final Map<int, String> englishToArabicNumbers = {
    1: '١',
    2: '٢',
    3: '٣',
    4: '٤',
    5: '٥',
    6: '٦',
    7: '٧',
    8: '٨',
    9: '٩',
    10: '١٠',
    11: '١١',
    12: '١٢',
    13: '١٣',
    14: '١٤',
    15: '١٥',
    16: '١٦',
    17: '١٧',
    18: '١٨',
    19: '١٩',
    20: '٢٠',
    21: '٢١',
    22: '٢٢',
    23: '٢٣',
    24: '٢٤',
    25: '٢٥',
    26: '٢٦',
    27: '٢٧',
    28: '٢٨',
    29: '٢٩',
    30: '٣٠',
    31: '٣١',
  };

  // Look up the Arabic equivalent
  String arabicNumber = englishToArabicNumbers[number]!;
  return arabicNumber;
}
