// ignore_for_file: file_names, prefer_const_literals_to_create_immutables, prefer_const_constructors, deprecated_member_use, prefer_final_fields, unused_field, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:schedule_app/components/customCloseConfirmAppBar.dart';
import 'package:schedule_app/components/customFloatingButtom.dart';
import 'package:schedule_app/components/customSwitch.dart';
import 'package:schedule_app/components/customTextFormField.dart';
import 'package:schedule_app/components/customTextFormValidation.dart';
import 'package:schedule_app/components/customTimePacker.dart';
import 'package:schedule_app/components/customTitleText.dart';
import 'package:schedule_app/components/selectColor.dart';
import 'package:schedule_app/core/constants/keys.dart';
import 'package:schedule_app/core/controller/settingsController.dart';
import 'package:schedule_app/core/controller/task/taskDatabaseController.dart';
import 'package:schedule_app/core/controller/task/taskController.dart';
import 'package:schedule_app/core/services/services.dart';
import 'package:schedule_app/data/models/taskModel.dart';
import 'package:schedule_app/routes/appRoutes.dart';
import 'package:schedule_app/ui/widgets/tasks/customButtomSheet.dart';
import 'package:intl/intl.dart';

class AddTask extends StatelessWidget {
  AddTask({super.key});

  TextEditingController textController = TextEditingController();
  final taskController = Get.find<TaskDatabaseController>();
  final controller = Get.find<ImpTaskController>();
  final ImpSettingsController settingsController =
      Get.find<ImpSettingsController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: CustomFloatingButtom(
          text: "94".tr,
          is_initializPage: false,
          press: () {
            addTask(context);
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SingleChildScrollView(
        child: Column(
          children: [
            customCloseConfirmAppBar(
              text: '88'.tr,
              firstIcon: Icons.close,
              secondIcon: Icons.check,
              press_1: () {
                Get.back();
              },
              press_2: () {
                addTask(context);
              },
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 25.h),
                  CustomTitleText(title: "89".tr),
                  SizedBox(height: 15.h),
                  CustomTextForm(
                    controller: textController,
                  ),
                  SizedBox(height: 25.h),
                  CustomTitleText(title: "90".tr),
                  SizedBox(height: 18.h),
                  CustomTimePicker(
                    use24hFormat: settingsController.switchStateOf24hr!,
                    selectCurrentTime: (time) {
                      controller.selectTime(time);
                    },
                    time: DateTime.now(),
                  ),
                  SizedBox(height: 16.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomTitleText(title: "91".tr),
                      GetBuilder<ImpTaskController>(
                        init: ImpTaskController(),
                        builder: (_) {
                          return customSwitch(context,
                              check: controller.taskSwitchStateValue!,
                              change: (val) {
                            controller.changeStateOfAlarmSwitch(val);
                          });
                        },
                      )
                    ],
                  ),
                  SizedBox(height: 34.h),
                  CustomTitleText(title: "92".tr),
                  SizedBox(height: 15.h),
                  CustomShowButtomSheet(),
                  SizedBox(height: 25.h),
                  CustomTitleText(title: "93".tr),
                  SizedBox(height: 15.h),
                  GetBuilder<ImpTaskController>(
                    init: ImpTaskController(),
                    builder: (_) {
                      return selectColorFunction(
                          selectColor: controller.idexColor!,
                          selectColorFun: (int val) {
                            return controller.selectColor(val);
                          });
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void addTask(BuildContext context) {
    controller.onButtomSheetStart(controller.selectClassification);
    Task task = Task(
        title: textController.text,
        time: DateFormat('MMM d h:mm a').format(controller.time!),
        notification: controller.taskSwitchStateValue == true ? 1 : 0,
        classification: controller.resultOfClssificationIndex,
        color: controller.idexColor,
        isCompleted: 0);

    customTextFormValidation(context,
                textController: textController, missing: "103".tr) ==
            true
        ? taskController.addTask(task: task).then((value) {
            SettingServices.instance.write(Keys.textTask, true);
            Get.offAllNamed(AppRoute.HomePage);
          })
        : Container();
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
