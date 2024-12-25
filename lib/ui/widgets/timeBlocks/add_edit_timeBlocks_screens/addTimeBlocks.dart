// ignore_for_file: must_be_immutable, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:schedule_app/components/customCloseConfirmAppBar.dart';
import 'package:schedule_app/components/customFloatingButtom.dart';
import 'package:schedule_app/components/customSwitch.dart';
import 'package:schedule_app/components/customTextFormField.dart';
import 'package:schedule_app/components/customTextFormValidation.dart';
import 'package:schedule_app/components/customTimePacker.dart';
import 'package:schedule_app/components/customTitleText.dart';
import 'package:schedule_app/components/selectColor.dart';
import 'package:schedule_app/components/time_functions.dart';
import 'package:schedule_app/core/constants/keys.dart';
import 'package:schedule_app/core/controller/settingsController.dart';
import 'package:schedule_app/core/controller/timeBlocks/timeBlocksController.dart';
import 'package:schedule_app/core/controller/timeBlocks/timeBlocksDatabaseController.dart';
import 'package:schedule_app/core/services/services.dart';
import 'package:schedule_app/data/models/timeBlocksModel.dart';
import 'package:schedule_app/ui/widgets/timeBlocks/add_edit_timeBlocks_screens/addMultiplTimeBlocks.dart';

import 'package:schedule_app/ui/widgets/timeBlocks/repeatDays.dart';

class AddTimeBlocks extends StatelessWidget {
  AddTimeBlocks({super.key});

  TextEditingController textController = TextEditingController();
  final timeBlocksDatabaseController =
      Get.find<ImpTimeBlocksDatabaseController>();
  final ImpSettingsController settingsController =
      Get.find<ImpSettingsController>();
  //final taskController = Get.find<TaskDatabaseController>();
  final timeBlockscontroller = Get.find<ImpTimeBlocksController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: CustomFloatingButtom(
          text: "123".tr,
          is_initializPage: false,
          press: () {
            addEventOfTimeTable(context);
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Column(
        children: [
          customCloseConfirmAppBar(
            text: '114'.tr,
            firstIcon: Icons.close,
            secondIcon: Icons.check,
            press_1: () {
              Get.back();
            },
            press_2: () {
              addEventOfTimeTable(context);
            },
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 16.h),
                      CustomTitleText(title: "115".tr),
                      SizedBox(height: 8.h),
                      CustomTextForm(
                        controller: textController,
                      ),
                      SizedBox(height: 24.h),
                      CustomTitleText(title: "116".tr),
                      SizedBox(height: 18.h),
                      CustomTimePicker(
                        use24hFormat: settingsController.switchStateOf24hr!,
                        selectCurrentTime: (time) {
                          timeBlockscontroller.selectStartTime(time);
                        },
                        time: DateTime.now(),
                      ),
                      SizedBox(height: 16.h),
                      CustomTitleText(title: "117".tr),
                      SizedBox(height: 18.h),
                      CustomTimePicker(
                        use24hFormat: true,
                        selectCurrentTime: (time) {
                          timeBlockscontroller.selectEndTime(time);
                        },
                        //  time: DateTime.now(),
                        time: convertTimeStringToDateTime_HMMA("00:45 AM"),
                      ),
                      SizedBox(height: 16.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomTitleText(title: "118".tr),
                          GetBuilder<ImpTimeBlocksController>(
                            init: ImpTimeBlocksController(),
                            builder: (_) {
                              return customSwitch(context,
                                  check: timeBlockscontroller.alarmSwitchState!,
                                  change: (val) {
                                timeBlockscontroller
                                    .changeStateOfAlarmSwitch(val);
                              });
                            },
                          )
                        ],
                      ),
                      SizedBox(height: 24.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomTitleText(title: "119".tr),
                          GetBuilder<ImpTimeBlocksController>(
                            init: ImpTimeBlocksController(),
                            builder: (_) {
                              return customSwitch(context,
                                  check: timeBlockscontroller
                                      .repeatSwitchState!, change: (val) {
                                timeBlockscontroller
                                    .changeStateOfRepeatSwitch(val);
                              });
                            },
                          )
                        ],
                      ),
                      // CustomTitleText(title: "Repeat Days"),
                      SizedBox(height: 8.h),
                      RepeatDays(),
                      //CustomShowButtomSheet(),
                      SizedBox(height: 24.h),
                      CustomTitleText(title: "120".tr),
                      SizedBox(height: 8.h),
                      GetBuilder<ImpTimeBlocksController>(
                        init: ImpTimeBlocksController(),
                        builder: (_) {
                          return selectColorFunction(
                              selectColor: timeBlockscontroller.idexColor!,
                              selectColorFun: (int val) {
                                return timeBlockscontroller.selectColor(val);
                              });
                        },
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 100.h,
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  void addEventOfTimeTable(BuildContext context) {
    try {
      if (timeBlockscontroller.repeatSwitchState == false ||
          timeBlockscontroller.repeatDays.isEmpty) {
        print("timeBlockscontroller.repeatSwitchState == false");
        print("timeBlockscontroller.repeatDays.isEmpty");
        TimeBlocks timeBlocks = TimeBlocks(
            title: textController.text,
            start_time:
                "${timeBlockscontroller.daysList![timeBlockscontroller.currentDay]["month"]} ${timeBlockscontroller.daysList![timeBlockscontroller.currentDay]["date"]} ${DateFormat('h:mm a').format(timeBlockscontroller.startTime!)}",
            // start_time: DateFormat('MMM d, h:mm a')
            //     .format(timeBlockscontroller.startTime!),
            end_time: DateFormat('MMM d h:mm a')
                .format(timeBlockscontroller.eventPeriod!),
            notification: timeBlockscontroller.alarmSwitchState == true ? 1 : 0,
            repeatDays: timeBlockscontroller.repeatDays,
            color: timeBlockscontroller.idexColor,
            day: timeBlockscontroller.currentDay,
            nameOfDay: timeBlockscontroller.day!["day"],
            numberOfDay: timeBlockscontroller.day!["date"],
            category: "none");
        customTextFormValidation(context,
                    textController: textController, missing: "115".tr) ==
                true
            ? timeBlocksDatabaseController
                .addTimeBlocks(timeBlocks: timeBlocks)
                .then((value) {
                SettingServices.instance.write(Keys.textTask, true);
                // Get.offAllNamed(AppRoute.HomePage);
                Get.back();
              })
            : Container();
      } else {
        bool checkExists = timeBlockscontroller.repeatDays
            .contains(timeBlockscontroller.day!["day"]);
        TimeBlocks timeBlocks = TimeBlocks(
            title: textController.text,
            start_time:
                "${timeBlockscontroller.daysList![timeBlockscontroller.currentDay]["month"]} ${timeBlockscontroller.daysList![timeBlockscontroller.currentDay]["date"]} ${DateFormat('h:mm a').format(timeBlockscontroller.startTime!)}",
            // start_time: DateFormat('MMM d h:mm a')
            //     .format(timeBlockscontroller.startTime!),
            end_time: DateFormat('MMM d h:mm a')
                .format(timeBlockscontroller.eventPeriod!),
            notification: timeBlockscontroller.alarmSwitchState == true ? 1 : 0,
            repeatDays: timeBlockscontroller.repeatDays,
            color: timeBlockscontroller.idexColor,
            day: timeBlockscontroller.currentDay,
            nameOfDay: timeBlockscontroller.day!["day"],
            numberOfDay: timeBlockscontroller.day!["date"],
            category: "none");

        textController.text.isNotEmpty && !checkExists
            ? timeBlocksDatabaseController.addTimeBlocks(timeBlocks: timeBlocks)
            : {SettingServices.instance.write(Keys.timeBlocks, true)};

        String rundomCategory = generateRandomCategory();
        addDaysInRangeBeforCurrentDay(
            daysToDisplay: timeBlockscontroller.repeatDays,
            titleTextController: textController,
            context: context,
            rundomCategory: rundomCategory);
        addDaysInRangeAfterCurrentDay(
            daysToDisplay: timeBlockscontroller.repeatDays,
            titleTextController: textController,
            context: context,
            rundomCategory: rundomCategory);
      }
    } catch (e) {
      print("Error \n\n ${e}");
    }
  }

  // void addEventFirstButton(BuildContext context) {
  //   try {
  //     if (timeBlockscontroller.repeatSwitchState == false ||
  //         timeBlockscontroller.repeatDays.isEmpty) {
  //       TimeBlocks timeBlocks = TimeBlocks(
  //           title: textController.text,
  //           start_time:
  //               "${timeBlockscontroller.daysList![timeBlockscontroller.currentDay]["month"]} ${timeBlockscontroller.daysList![timeBlockscontroller.currentDay]["date"]} ${DateFormat('h:mm a').format(timeBlockscontroller.startTime!)}",
  //           // start_time: DateFormat('MMM d h:mm a')
  //           //     .format(timeBlockscontroller.startTime!),
  //           end_time: DateFormat('MMM d h:mm a')
  //               .format(timeBlockscontroller.eventPeriod!),
  //           notification: timeBlockscontroller.alarmSwitchState == true ? 1 : 0,
  //           repeatDays: timeBlockscontroller.repeatDays,
  //           color: timeBlockscontroller.idexColor,
  //           day: timeBlockscontroller.currentDay,
  //           nameOfDay: timeBlockscontroller.day!["day"],
  //           numberOfDay: timeBlockscontroller.day!["date"],
  //           category: "none");
  //       customTextFormValidation(context,
  //                   textController: textController, missing: "event") ==
  //               true
  //           ? timeBlocksDatabaseController
  //               .addTimeBlocks(timeBlocks: timeBlocks)
  //               .then((value) {
  //               SettingServices.instance.write(Keys.timeBlocks, true);
  //               // Get.offAllNamed(AppRoute.HomePage);
  //               Get.back();
  //             })
  //           : Container();
  //     } else {
  //       bool checkExists = timeBlockscontroller.repeatDays
  //           .contains(timeBlockscontroller.day!["day"]);
  //       TimeBlocks timeBlocks = TimeBlocks(
  //           title: textController.text,
  //           start_time:
  //               "${timeBlockscontroller.daysList![timeBlockscontroller.currentDay]["month"]} ${timeBlockscontroller.daysList![timeBlockscontroller.currentDay]["date"]} ${DateFormat('h:mm a').format(timeBlockscontroller.startTime!)}",
  //           // start_time: DateFormat('MMM d h:mm a')
  //           //     .format(timeBlockscontroller.startTime!),
  //           end_time: DateFormat('MMM d h:mm a')
  //               .format(timeBlockscontroller.eventPeriod!),
  //           notification: timeBlockscontroller.alarmSwitchState == true ? 1 : 0,
  //           repeatDays: timeBlockscontroller.repeatDays,
  //           color: timeBlockscontroller.idexColor,
  //           day: timeBlockscontroller.currentDay,
  //           nameOfDay: timeBlockscontroller.day!["day"],
  //           numberOfDay: timeBlockscontroller.day!["date"],
  //           category: "none");

  //       textController.text.isNotEmpty && !checkExists
  //           ? timeBlocksDatabaseController.addTimeBlocks(timeBlocks: timeBlocks)
  //           : {SettingServices.instance.write(Keys.timeBlocks, true)};

  //       String rundomCategory = generateRandomCategory();
  //       addDaysInRangeBeforCurrentDay(
  //           daysToDisplay: timeBlockscontroller.repeatDays,
  //           titleTextController: textController,
  //           context: context,
  //           rundomCategory: rundomCategory);
  //       addDaysInRangeAfterCurrentDay(
  //           daysToDisplay: timeBlockscontroller.repeatDays,
  //           titleTextController: textController,
  //           context: context,
  //           rundomCategory: rundomCategory);
  //     }
  //   } catch (e) {
  //     print("Error \n\n ${e}");
  //   }
  // }
}
