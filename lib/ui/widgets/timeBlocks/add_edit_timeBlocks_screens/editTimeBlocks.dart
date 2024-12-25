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
import 'package:schedule_app/core/services/notificationServices.dart';
import 'package:schedule_app/core/services/services.dart';
import 'package:schedule_app/data/models/timeBlocksModel.dart';
import 'package:schedule_app/ui/widgets/timeBlocks/checkDateOfTimeBlock.dart';
import 'package:schedule_app/ui/widgets/timeBlocks/editMultiplTimeBlocks.dart';
import 'package:schedule_app/ui/widgets/timeBlocks/messageForDeleting.dart';
import 'package:schedule_app/ui/widgets/timeBlocks/repeatDays.dart';

class EditTimeBlocks extends StatefulWidget {
  EditTimeBlocks({super.key});

  @override
  State<EditTimeBlocks> createState() => _EditTimeBlocksState();
}

class _EditTimeBlocksState extends State<EditTimeBlocks> {
  TextEditingController textController = TextEditingController();
  TimeBlocks? timeBlocks;
  final timeBlocksDatabaseController =
      Get.find<ImpTimeBlocksDatabaseController>();

  final timeBlockscontroller = Get.find<ImpTimeBlocksController>();

  final ImpSettingsController settingsController =
      Get.find<ImpSettingsController>();
  @override
  void initState() {
    super.initState();
    timeBlocks = Get.arguments;
    textController.text = timeBlocks!.title!;
    timeBlockscontroller.startTime =
        convertTimeStringToDateTime_MMMD(timeBlocks!.start_time!);
    timeBlockscontroller.eventPeriod =
        convertTimeStringToDateTime_MMMD(timeBlocks!.end_time!);
    timeBlockscontroller.alarmSwitchState =
        timeBlocks!.notification == 1 ? true : false;
    timeBlockscontroller.repeatDays = timeBlocks!.repeatDays!;
    timeBlockscontroller.idexColor =
        timeBlocks!.color == 7 ? 0 : timeBlocks!.color;
    timeBlockscontroller.day!["day"] = timeBlocks!.nameOfDay!;
    timeBlockscontroller.day!["date"] = timeBlocks!.numberOfDay!;
  }

  // Function to show a default dialog

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: CustomFloatingButtom(
          text: "100".tr,
          is_initializPage: false,
          press: () {
            editEventOfTimeBlocks(context);
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Column(
        children: [
          customCloseConfirmAppBar(
            text: '122'.tr,
            firstIcon: Icons.close,
            secondIcon: Icons.delete_outline_rounded,
            press_1: () {
              Get.back();
            },
            press_2: () {
              deleteEventOfTimeBlocks(context);
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
                        time: timeBlockscontroller.startTime!,
                      ),
                      SizedBox(height: 16.h),
                      CustomTitleText(title: "117".tr),
                      SizedBox(height: 18.h),
                      CustomTimePicker(
                        use24hFormat: true,
                        selectCurrentTime: (time) {
                          timeBlockscontroller.selectEndTime(time);
                        },
                        time: timeBlockscontroller.eventPeriod!,
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
                      //CustomTitleText(title: "Repeat Days"),
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
                      SizedBox(height: 8.h),
                      RepeatDays(),
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
                  height: 110.h,
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  void editEventOfTimeBlocks(BuildContext context) {
    try {
      if (timeBlockscontroller.repeatSwitchState == false ||
          timeBlockscontroller.repeatDays.isEmpty) {
        TimeBlocks timeBlockInstance = TimeBlocks(
          id: timeBlocks!.id,
          title: textController.text,
          start_time: DateFormat('MMM d h:mm a')
              .format(timeBlockscontroller.startTime!),
          end_time: DateFormat('MMM d h:mm a')
              .format(timeBlockscontroller.eventPeriod!),
          notification: timeBlockscontroller.alarmSwitchState == true ? 1 : 0,
          repeatDays: timeBlockscontroller.repeatDays,
          color: timeBlockscontroller.idexColor,
          day: timeBlockscontroller.currentDay,
          nameOfDay: timeBlockscontroller.day!["day"],
          numberOfDay: timeBlockscontroller.day!["date"],
        );
        customTextFormValidation(context,
                    textController: textController, missing: "115".tr) ==
                true
            ? timeBlocksDatabaseController
                .updateTimeBlocks(timeBlocks: timeBlockInstance)
                .then((value) {
                SettingServices.instance.write(Keys.textTask, true);
                // Get.offAllNamed(AppRoute.HomePage);
                Get.back();
              })
            : Container();
      } else {
        editDays(context: context, titleTextController: textController);
      }
    } catch (e) {
      print("Error \n\n ${e}");
    }
  }

  void deleteEventOfTimeBlocks(BuildContext context) {
    timeBlocksController.resetDeletingMessage();
    customShowCustomDialogToDeleteEvent(
      context: context,
      title: "124".tr,
      onTapFunDelete: () {
        if (timeBlocks!.category != "none") {
          if (timeBlocksController.changeDeletingMessage[2] == "142") {
            for (int i = 0;
                i < timeBlocksDatabaseController.timeBlocksForEdit.length;
                i++) {
              timeBlocksDatabaseController.deleteTimeBlocks(
                  id: timeBlocksDatabaseController.timeBlocksForEdit[i].id!);
              LocalNotifications.cancelSpecific(
                  timeBlocksDatabaseController.timeBlocksForEdit[i].id! +
                      111111);
              /*
                      timeBlock.id!.toInt() + 111111
                       */
            }
            Get.back();
            Get.back();
          }
          timeBlockscontroller.messageForDeleting();
        } else {
          timeBlocksDatabaseController
              .deleteTimeBlocks(id: timeBlocks!.id!)
              .then((value) {
            LocalNotifications.cancelSpecific(timeBlocks!.id! + 111111);
            Get.back();
            Get.back();
            // Get.offAllNamed(AppRoute.HomePage);
          });
        }
      },
      onTapFunCancel: () {
        if (timeBlocksController.changeDeletingMessage[1] == "141") {
          timeBlocksDatabaseController
              .deleteTimeBlocks(id: timeBlocks!.id!)
              .then((value) {
            Get.back();
            Get.back();
          });
        } else {
          Get.back();
        }
      },
    );
  }
}
