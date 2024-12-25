// ignore_for_file: file_names, prefer_const_literals_to_create_immutables, prefer_const_constructors, deprecated_member_use, prefer_final_fields, unused_field, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:schedule_app/components/customCloseConfirmAppBar.dart';
import 'package:schedule_app/components/customFloatingButtom.dart';
import 'package:schedule_app/components/customMessageToDelete.dart';
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
import 'package:schedule_app/core/services/notificationServices.dart';
import 'package:schedule_app/core/services/services.dart';
import 'package:schedule_app/data/models/timeTableModel.dart';
import 'package:schedule_app/ui/widgets/pomodoroTechnique/minutesPicker.dart';
import 'package:schedule_app/ui/widgets/timeTable/add_edit/addMultibleTimeTable.dart';
import 'package:schedule_app/ui/widgets/timeTable/repeateDays.dart';

class EditTimeTable extends StatefulWidget {
  EditTimeTable({super.key});

  @override
  State<EditTimeTable> createState() => _EditTimeTableState();
}

class _EditTimeTableState extends State<EditTimeTable> {
  TextEditingController classRoomNO = TextEditingController();
/*
     "timeTable": timeTable,
     "numberOfPages": timeTableController.activePage
 */
  int? numberOfPages;

  TextEditingController subjectName = TextEditingController();
  TimeTable? timeTableArguments;
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
    numberOfPages = Get.arguments["numberOfPages"];
    timeTableArguments = Get.arguments["timeTable"];
    subjectName.text = timeTableArguments!.subject.toString();
    classRoomNO.text = timeTableArguments!.roomNo.toString();
    timeTableController.lectureStartingTime =
        convertTimeStringToDateTime_HMMA_forTimeTable(
            convertTo12HourFormat(timeTableArguments!.start_time!));
    timeTableController.lecturePeriodTime =
        int.parse(timeTableArguments!.period!);
    timeTableController.switchState =
        timeTableArguments!.notification == 1 ? true : false;
    //  timeTableController.repeatDays = [timeTableArguments!.repeatDays!];
    timeTableController.idexColor = timeTableArguments!.color;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: CustomFloatingButtom(
          text: "34".tr,
          is_initializPage: false,
          press: () {
            editTimeTableClass(context);
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Column(
        children: [
          customCloseConfirmAppBar(
            text: "34",
            firstIcon: Icons.close,
            secondIcon: Icons.delete_outline_rounded,
            press_1: () {
              Get.back();
            },
            press_2: () {
              deleteTimeTableClass(context);
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
                        time: timeTableController.lectureStartingTime!,
                      ),
                      SizedBox(height: 24.h),
                      CustomTitleText(title: "30".tr),
                      SizedBox(height: 16.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 54.w),
                        child: MinutesPicker(
                          initialItem: timeTableController.lecturePeriodTime!,
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
                                print(val);
                                timeTableController
                                    .changeStateOfAlarmSwitch(val);
                                val == false
                                    ? LocalNotifications.cancelSpecific(
                                        timeTableArguments!.id! + 888888)
                                    : Container();
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

  void deleteTimeTableClass(BuildContext context) {
    customShowCustomDialogToDelete(
      context: context,
      title: "40".tr,
      subTitle: "41".tr,
      nameButton1: "42".tr,
      nameButton2: "43".tr,
      onTapFun: () {
        timeTableDatabaseController
            .deleteTimeTable(id: timeTableArguments!.id!)
            .then((value) {
          LocalNotifications.cancelSpecific(timeTableArguments!.id! + 888888);
          timeTableController.onPageChanged(
              numberOfPages!); //number of page should be pass as argument in class or with getX
          Get.back();
          //  Get.offAllNamed(AppRoute.HomePage);
          Get.back();
        });
      },
    );
  }

  void editTimeTableClass(BuildContext context) {
    if (timeTableController.repeatDays.isEmpty) {
      TimeTable timeTable = TimeTable(
          id: timeTableArguments!.id,
          subject: subjectName.text,
          roomNo: classRoomNO.text,
          start_time: convertTo24HourFormat(
            DateFormat('E h:mm a') //???????????????????????????????????
                .format(timeTableController.lectureStartingTime!),
          ),
          period: timeTableController.lecturePeriodTime.toString(),
          notification: timeTableController.switchState == true ? 1 : 0,
          repeatDays: timeTableArguments!.repeatDays!, //ركز هنا ممكن في خطأ
          // repeatDays:
          //     timeTableController.repeatDays[0], //ركز هنا ممكن في خطأ
          color: timeTableController.idexColor);
      customTextFormValidation(context,
                      textController: subjectName, missing: "27".tr) ==
                  true &&
              customTextFormValidation(context,
                      textController: classRoomNO, missing: "28".tr) ==
                  true
          ? timeTableDatabaseController
              .updateTimeTable(timeTable: timeTable)
              .then((value) {
              SettingServices.instance.write(Keys.timeTable, true);
              Get.back();
              //Get.offAllNamed(AppRoute.HomePage);
            })
          : Container();
    } else {
      //================================================================
      TimeTable timeTable1 = TimeTable(
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
              timeTable: timeTable1,
              days: timeTableController.repeatDays,
              currentDayOfThisClass: timeTableArguments!.repeatDays!,
              id: timeTableArguments!.id)
          : Container();
      //================================================================
    }
  }
}
