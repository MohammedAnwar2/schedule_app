import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:schedule_app/components/customFloatingButtom.dart';
import 'package:schedule_app/core/constants/keys.dart';
import 'package:schedule_app/core/constants/themeOfApp/fonts.dart';
import 'package:schedule_app/core/controller/timeTable/timeTableController.dart';
import 'package:schedule_app/core/controller/timeTable/timeTableDatabaseController.dart';
import 'package:schedule_app/core/services/services.dart';
import 'package:schedule_app/ui/widgets/timeTable/classTime/customShowDialog.dart';
import 'package:schedule_app/ui/widgets/timeTable/classTime/workDays.dart';

final ImpTimeTableController timeTableController =
    Get.find<ImpTimeTableController>();
ImpTimeTableDatabaseController timeTableDatabaseController =
    Get.find<ImpTimeTableDatabaseController>();

class classTime extends StatelessWidget {
  classTime({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 10.w),
      child: MaterialButton(
          minWidth: 0,
          height: 0,
          padding: EdgeInsets.zero,
          onPressed: () {
            // if (timeTableController.currentWorkDays.isEmpty) {
            //   timeTableController.changeWorkDays([]);
            // } else {
            //   timeTableController
            //       .changeWorkDays(timeTableController.currentWorkDays);
            // }
            // print(
            //     "timeTableController.currentWorkDays = ${timeTableController.currentWorkDays}");

            //change to database controller
            if (timeTableController.workDays.isNotEmpty) {
              timeTableController.onPageChanged(0);
              timeTableController.pageController.jumpTo(0);
            }

            showModalBottomSheet(
              isDismissible: false,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(32.0),
                ),
              ),
              context: context,
              builder: (context) {
                return Obx(() => AnimatedContainer(
                      duration: Duration(milliseconds: 200),
                      width: double.infinity,
                      height: timeTableController.dialogDismissedClosed.value
                          ? 280.h
                          : 374.h,
                      // padding: EdgeInsets.symmetric(horizontal: 16.w),
                      decoration: BoxDecoration(
                          color: Theme.of(context)
                              .colorScheme
                              .onSecondaryContainer,
                          // color: Colors.red,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(32),
                              topRight: Radius.circular(32)),
                          border: Border.all(
                            color: Theme.of(context)
                                .colorScheme
                                .onSecondaryContainer,
                          )),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Container(
                                margin: EdgeInsetsDirectional.only(top: 4.h),
                                height: 4.h,
                                width: 60.w,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).cardColor,
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                              ),
                            ),
                            SizedBox(height: 16.h),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.w),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("36".tr,
                                      style: TextStyleFonts.CTAText.copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onPrimary)),
                                  Row(
                                    children: [
                                      Text(
                                        "${timeTableController.selectedCurrentRadioValue} ${"37".tr}",
                                        style: TextStyleFonts.Subtext.copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .scrim),
                                      ),
                                      IconButton(
                                          onPressed: () {
                                            timeTableController.changeRaioValue(
                                                timeTableController
                                                    .selectedCurrentRadioValue);
                                            timeTableController
                                                .dialogDismissedClosed
                                                .value = false;
                                            CustomClassTimeShowDialog(context);
                                          },
                                          icon: Icon(
                                            Icons.keyboard_arrow_down_outlined,
                                            color: Colors.black,
                                          )),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Divider(
                              color: Color(0xffCBD2E0),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.w),
                              child: Text("39".tr,
                                  style: TextStyleFonts.CTAText.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary)),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.w),
                              child: WorkDays(),
                            ),
                            Spacer(),
                            Center(
                              child: CustomFloatingButtom(
                                is_initializPage: false,
                                text: "38".tr,
                                press: () {
                                  // print(
                                  //     "timeTableController.currentWorkDays = ${timeTableController.currentWorkDays}");

                                  SettingServices.instance.write(Keys.workDays,
                                      timeTableController.workDays);

                                  timeTableController.changeWorkDays(
                                      timeTableController.workDays);

                                  timeTableController.sortWorkDays(
                                      shortCutDaysName:
                                          timeTableController.workDays);
                                  timeTableController.sortArabicWorkDays(
                                      shortCutDaysName:
                                          timeTableController.workDays);

                                  // timeTableController.changeCurrentWorkDays(
                                  //     timeTableController.workDays);
                                  // timeTableController.onPageChanged(pageNo!);

                                  Get.back();
                                },
                              ),
                            ),
                            SizedBox(
                              height: 15.h,
                            )
                          ]),
                    ));
              },
            );
          },
          child: SvgPicture.asset(
            "assets/icons/classTime.svg",
            width: 24.w,
            height: 24.h,
            color: Theme.of(context).colorScheme.shadow,
          )),
    );
    // child: Icon(Icons.pin_drop, color: Colors.black));
  }
}
