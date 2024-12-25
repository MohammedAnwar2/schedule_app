// ignore_for_file: file_names, prefer_const_literals_to_create_immutables, prefer_const_constructors, deprecated_member_use, prefer_final_fields, unused_field, must_be_immutable

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
import 'package:schedule_app/core/controller/timeTable/timeTableController.dart';
import 'package:schedule_app/core/controller/timeTable/timeTableDatabaseController.dart';
import 'package:schedule_app/core/services/services.dart';
import 'package:schedule_app/data/models/timeTableModel.dart';
import 'package:schedule_app/ui/widgets/pomodoroTechnique/minutesPicker.dart';
import 'package:schedule_app/ui/widgets/timeTable/add_edit/addMultibleTimeTable.dart';
import 'package:schedule_app/ui/widgets/timeTable/repeateDays.dart';

class AddTimeTable extends StatefulWidget {
  AddTimeTable({super.key});

  @override
  State<AddTimeTable> createState() => _AddTimeTableState();
}

class _AddTimeTableState extends State<AddTimeTable> {
  TextEditingController subjectName = TextEditingController();

  TextEditingController classRoomNO = TextEditingController();

  //final taskController = Get.find<TaskDatabaseController>();
  ImpTimeTableController timeTableController =
      Get.find<ImpTimeTableController>();

  ImpTimeTableDatabaseController timeTableDatabaseController =
      Get.find<ImpTimeTableDatabaseController>();

  final ImpSettingsController settingsController =
      Get.find<ImpSettingsController>();
  @override
  void initState() {
    super.initState();
    timeTableController.lecturePeriodTime =
        timeTableController.selectedCurrentRadioValue - 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: CustomFloatingButtom(
          text: "24".tr,
          is_initializPage: false,
          press: () {
            addTimeTabkeClass(context);
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Column(
        children: [
          customCloseConfirmAppBar(
            text: '24'.tr,
            firstIcon: Icons.close,
            secondIcon: Icons.check,
            press_1: () {
              Get.back();
            },
            press_2: () {
              addTimeTabkeClass(context);
            },
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.only(bottom: 90),
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 16.h),
                      CustomTitleText(title: "27".tr),
                      SizedBox(height: 8.h),
                      CustomTextForm(
                        controller: subjectName,
                      ),
                      SizedBox(height: 16.h),
                      CustomTitleText(title: "28".tr),
                      SizedBox(height: 8.h),
                      CustomTextForm(
                        controller: classRoomNO,
                      ),
                      SizedBox(height: 24.h),
                      CustomTitleText(title: "29".tr),
                      SizedBox(height: 16.h),
                      CustomTimePicker(
                        use24hFormat: settingsController.switchStateOf24hr!,
                        selectCurrentTime: (time) {
                          timeTableController.selectTime(time);
                        },
                        time: DateTime.now(),
                      ),
                      SizedBox(height: 24.h),
                      CustomTitleText(title: "30".tr),
                      SizedBox(height: 16.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 54.w),
                        child: MinutesPicker(
                          initialItem:
                              timeTableController.selectedRadioValue - 1,
                          numberOfMinutes: 120,
                          changeTime: (int lecturePeriod) {
                            timeTableController
                                .onSelectedItemChanged(lecturePeriod);
                          },
                        ),
                      ),
                      SizedBox(height: 16.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomTitleText(title: "31".tr),
                          GetBuilder<ImpTimeTableController>(
                            init: ImpTimeTableController(),
                            builder: (_) {
                              return customSwitch(context,
                                  check: timeTableController.switchState!,
                                  change: (val) {
                                timeTableController
                                    .changeStateOfAlarmSwitch(val);
                              });
                            },
                          )
                        ],
                      ),
                      CustomTitleText(title: "32".tr),
                      SizedBox(height: 8.h),
                      RepeatDaysForTimeTable(),
                      SizedBox(height: 24.h),
                      CustomTitleText(title: "33".tr),
                      SizedBox(height: 8.h),
                      GetBuilder<ImpTimeTableController>(
                        init: ImpTimeTableController(),
                        builder: (_) {
                          return selectColorFunction(
                              selectColor: timeTableController.idexColor!,
                              selectColorFun: (int val) {
                                return timeTableController.selectColor(val);
                              });
                        },
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  void addTimeTabkeClass(BuildContext context) {
    if (timeTableController.repeatDays.isEmpty) {
      TimeTable timeTable = TimeTable(
          subject: subjectName.text,
          roomNo: classRoomNO.text,
          start_time: convertTo24HourFormat(
            //????????????????????????
            DateFormat('E h:mm a')
                .format(timeTableController.lectureStartingTime!),
          ),
          period: timeTableController.lecturePeriodTime.toString(),
          notification: timeTableController.switchState == true ? 1 : 0,
          repeatDays:
              timeTableController.workDays[timeTableController.activePage!],
          color: timeTableController.idexColor);

      customTextFormValidation(context,
                      textController: subjectName, missing: "27".tr) ==
                  true &&
              customTextFormValidation(context,
                      textController: classRoomNO, missing: "28".tr) ==
                  true
          ? timeTableDatabaseController
              .addTimeTable(timeTable: timeTable)
              .then((value) {
              SettingServices.instance.write(Keys.timeTable, true);
              // Get.offAllNamed(AppRoute.HomePage);
              Get.back();
            })
          : Container();
    } else {
      TimeTable timeTable = TimeTable(
          subject: subjectName.text,
          roomNo: classRoomNO.text,
          start_time: convertTo24HourFormat(
            DateFormat('E h:mm a') //????????????????????????????????
                .format(timeTableController.lectureStartingTime!),
          ),
          period: timeTableController.lecturePeriodTime.toString(),
          notification: timeTableController.switchState == true ? 1 : 0,
          color: timeTableController.idexColor);

      customTextFormValidation(context,
                      textController: subjectName, missing: "27".tr) ==
                  true &&
              customTextFormValidation(context,
                      textController: classRoomNO, missing: "28".tr) ==
                  true
          ? addMultibleTimeTable(
              timeTable: timeTable, days: timeTableController.repeatDays)
          : Container();
    }
  }
}


// final MaterialStateProperty<Color?> overlayColor =
//     MaterialStateProperty.resolveWith<Color?>(
//   (Set<MaterialState> states) {
//     // Material color when switch is selected.
//     if (states.contains(MaterialState.selected)) {
//       return Colors.amber.withOpacity(0.54);
//     }
//     // Material color when switch is disabled.
//     if (states.contains(MaterialState.disabled)) {
//       return Colors.grey.shade400;
//     }
//     // Otherwise return null to set default material color
//     // for remaining states such as when the switch is
//     // hovered, or focused.
//     return null;
//   },
// );









/*

// TimeTable timeTable = TimeTable(
              //     subject: subjectName.text,
              //     roomNo: classRoomNO.text,
              //     start_time: convertTo24HourFormat(
              //       DateFormat('h:mm a')
              //           .format(timeTableController.lectureStartingTime!),
              //     ),
              //     period: timeTableController.lecturePeriodTime.toString(),
              //     notification: timeTableController.switchState == true ? 1 : 0,
              //     repeatDays: timeTableController.repeatDays.isEmpty
              //         ? [
              //             timeTableController
              //                 .workDays[timeTableController.activePage!]
              //           ]
              //         : timeTableController.repeatDays,
              //     color: timeTableController.idexColor);

              // customTextFormValidation(context,
              //                 textController: subjectName,
              //                 missing: "subject name") ==
              //             true &&
              //         customTextFormValidation(context,
              //                 textController: classRoomNO,
              //                 missing: "class room no") ==
              //             true
              //     ? timeTableDatabaseController
              //         .addTimeTable(timeTable: timeTable)
              //         .then((value) {
              //         SettingServices.instance.write(Keys.timeTable, true);
              //         // Get.offAllNamed(AppRoute.HomePage);
              //         Get.back();
              //       })
              //     : Container();
 */






/*
// ignore_for_file: file_names, prefer_const_literals_to_create_immutables, prefer_const_constructors, deprecated_member_use, prefer_final_fields, unused_field, must_be_immutable

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
import 'package:schedule_app/core/controller/timeTable/timeTableController.dart';
import 'package:schedule_app/core/controller/timeTable/timeTableDatabaseController.dart';
import 'package:schedule_app/core/services/services.dart';
import 'package:schedule_app/data/models/timeTableModel.dart';
import 'package:schedule_app/ui/widgets/pomodoroTechnique/minutesPicker.dart';
import 'package:schedule_app/ui/widgets/timeTable/repeateDays.dart';

class AddTimeTable extends StatefulWidget {
  AddTimeTable({super.key});

  @override
  State<AddTimeTable> createState() => _AddTimeTableState();
}

class _AddTimeTableState extends State<AddTimeTable> {
  TextEditingController subjectName = TextEditingController();

  TextEditingController classRoomNO = TextEditingController();

  //final taskController = Get.find<TaskDatabaseController>();
  ImpTimeTableController timeTableController =
      Get.find<ImpTimeTableController>();

  ImpTimeTableDatabaseController timeTableDatabaseController =
      Get.find<ImpTimeTableDatabaseController>();

  final ImpSettingsController settingsController =
      Get.find<ImpSettingsController>();
  @override
  void initState() {
    super.initState();
    timeTableController.lecturePeriodTime =
        timeTableController.selectedCurrentRadioValue - 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: CustomFloatingButtom(
          text: "24".tr,
          is_initializPage: false,
          press: () {
            // print(convert12To24Hour(
            //   DateFormat('h:mm a')
            //       .format(timeTableController.lectureStartingTime!),
            // ));
            TimeTable timeTable = TimeTable(
                subject: subjectName.text,
                roomNo: classRoomNO.text,
                start_time: convertTo24HourFormat(
                  DateFormat('h:mm a')
                      .format(timeTableController.lectureStartingTime!),
                ),
                period: timeTableController.lecturePeriodTime.toString(),
                notification: timeTableController.switchState == true ? 1 : 0,
                repeatDays: timeTableController.repeatDays.isEmpty
                    ? [
                        timeTableController
                            .workDays[timeTableController.activePage!]
                      ]
                    : timeTableController.repeatDays,
                color: timeTableController.idexColor);

            customTextFormValidation(context,
                            textController: subjectName,
                            missing: "subject name") ==
                        true &&
                    customTextFormValidation(context,
                            textController: classRoomNO,
                            missing: "class room no") ==
                        true
                ? timeTableDatabaseController
                    .addTimeTable(timeTable: timeTable)
                    .then((value) {
                    SettingServices.instance.write(Keys.timeTable, true);
                    // Get.offAllNamed(AppRoute.HomePage);
                    Get.back();
                  })
                : Container();
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Column(
        children: [
          customCloseConfirmAppBar(
            text: '24'.tr,
            firstIcon: Icons.close,
            secondIcon: Icons.check,
            press_1: () {
              Get.back();
            },
            press_2: () {
              TimeTable timeTable = TimeTable(
                  subject: subjectName.text,
                  roomNo: classRoomNO.text,
                  start_time: convertTo24HourFormat(
                    DateFormat('h:mm a')
                        .format(timeTableController.lectureStartingTime!),
                  ),
                  period: timeTableController.lecturePeriodTime.toString(),
                  notification: timeTableController.switchState == true ? 1 : 0,
                  repeatDays: timeTableController.repeatDays.isEmpty
                      ? [
                          timeTableController
                              .workDays[timeTableController.activePage!]
                        ]
                      : timeTableController.repeatDays,
                  color: timeTableController.idexColor);

              customTextFormValidation(context,
                              textController: subjectName,
                              missing: "subject name") ==
                          true &&
                      customTextFormValidation(context,
                              textController: classRoomNO,
                              missing: "class room no") ==
                          true
                  ? timeTableDatabaseController
                      .addTimeTable(timeTable: timeTable)
                      .then((value) {
                      SettingServices.instance.write(Keys.timeTable, true);
                      // Get.offAllNamed(AppRoute.HomePage);
                      Get.back();
                    })
                  : Container();
            },
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.only(bottom: 90),
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 16.h),
                      CustomTitleText(title: "27".tr),
                      SizedBox(height: 8.h),
                      CustomTextForm(
                        controller: subjectName,
                      ),
                      SizedBox(height: 16.h),
                      CustomTitleText(title: "28".tr),
                      SizedBox(height: 8.h),
                      CustomTextForm(
                        controller: classRoomNO,
                      ),
                      SizedBox(height: 24.h),
                      CustomTitleText(title: "29".tr),
                      SizedBox(height: 16.h),
                      CustomTimePicker(
                        use24hFormat: settingsController.switchStateOf24hr!,
                        selectCurrentTime: (time) {
                          timeTableController.selectTime(time);
                        },
                        time: DateTime.now(),
                      ),
                      SizedBox(height: 24.h),
                      CustomTitleText(title: "30".tr),
                      SizedBox(height: 16.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 54.w),
                        child: MinutesPicker(
                          initialItem:
                              timeTableController.selectedRadioValue - 1,
                          numberOfMinutes: 120,
                          changeTime: (int lecturePeriod) {
                            timeTableController
                                .onSelectedItemChanged(lecturePeriod);
                          },
                        ),
                      ),
                      SizedBox(height: 16.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomTitleText(title: "31".tr),
                          GetBuilder<ImpTimeTableController>(
                            init: ImpTimeTableController(),
                            builder: (_) {
                              return customSwitch(context,
                                  check: timeTableController.switchState!,
                                  change: (val) {
                                timeTableController
                                    .changeStateOfAlarmSwitch(val);
                              });
                            },
                          )
                        ],
                      ),
                      CustomTitleText(title: "32".tr),
                      SizedBox(height: 8.h),
                      RepeatDaysForTimeTable(),
                      SizedBox(height: 24.h),
                      CustomTitleText(title: "33".tr),
                      SizedBox(height: 8.h),
                      GetBuilder<ImpTimeTableController>(
                        init: ImpTimeTableController(),
                        builder: (_) {
                          return selectColorFunction(
                              selectColor: timeTableController.idexColor!,
                              selectColorFun: (int val) {
                                return timeTableController.selectColor(val);
                              });
                        },
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}


// final MaterialStateProperty<Color?> overlayColor =
//     MaterialStateProperty.resolveWith<Color?>(
//   (Set<MaterialState> states) {
//     // Material color when switch is selected.
//     if (states.contains(MaterialState.selected)) {
//       return Colors.amber.withOpacity(0.54);
//     }
//     // Material color when switch is disabled.
//     if (states.contains(MaterialState.disabled)) {
//       return Colors.grey.shade400;
//     }
//     // Otherwise return null to set default material color
//     // for remaining states such as when the switch is
//     // hovered, or focused.
//     return null;
//   },
// );

 */