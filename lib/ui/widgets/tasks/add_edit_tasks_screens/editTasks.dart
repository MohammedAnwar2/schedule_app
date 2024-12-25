import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
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
import 'package:schedule_app/core/controller/task/taskDatabaseController.dart';
import 'package:schedule_app/core/controller/task/taskController.dart';
import 'package:schedule_app/core/services/notificationServices.dart';
import 'package:schedule_app/core/services/services.dart';
import 'package:schedule_app/data/models/taskModel.dart';
import 'package:schedule_app/routes/appRoutes.dart';
import 'package:schedule_app/ui/widgets/tasks/customButtomSheet.dart';
import 'package:intl/intl.dart';

class EditTask extends StatefulWidget {
  const EditTask({
    super.key,
  });

  @override
  State<EditTask> createState() => _EditTaskState();
}

class _EditTaskState extends State<EditTask> {
  TextEditingController textController = TextEditingController();

  final taskController = Get.find<TaskDatabaseController>();
  final ImpSettingsController settingsController =
      Get.find<ImpSettingsController>();
  final controller = Get.find<ImpTaskController>();
  Task? task;
  @override
  void initState() {
    super.initState();
    task = Get.arguments;
    textController.text = task!.title!;
    controller.taskSwitchStateValue = task!.notification == 1 ? true : false;
    controller.selectClassification =
        controller.classificationList[task!.classification!];
    controller.idexColor = task!.color;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: CustomFloatingButtom(
          text: "100".tr,
          is_initializPage: false,
          press: () {
            editTask(context);
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SingleChildScrollView(
        child: Column(
          children: [
            customCloseConfirmAppBar(
              text: '99'.tr,
              firstIcon: Icons.close,
              secondIcon: Icons.delete_outline_rounded,
              press_1: () {
                Get.back();
              },
              press_2: () {
                deleteTask(context);
              },
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 16.h),
                  CustomTitleText(title: "89".tr),
                  SizedBox(height: 8.h),
                  CustomTextForm(
                    controller: textController,
                  ),
                  SizedBox(height: 24.h),
                  CustomTitleText(title: "90".tr),
                  SizedBox(height: 18.h),
                  CustomTimePicker(
                      use24hFormat: settingsController.switchStateOf24hr!,
                      selectCurrentTime: (time) {
                        controller.selectTime(time);
                      },
                      time: convertTimeStringToDateTime_MMMD(task!.time!)),
                  //time: DateTime.parse(widget.task.time!)),
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
                  SizedBox(height: 8.h),
                  CustomShowButtomSheet(),
                  SizedBox(height: 24.h),
                  CustomTitleText(title: "93".tr),
                  SizedBox(height: 8.h),
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

  void deleteTask(BuildContext context) {
    customShowCustomDialogToDelete(
      context: context,
      title: "101".tr,
      subTitle: "102".tr,
      nameButton1: "42".tr,
      nameButton2: "43".tr,
      onTapFun: () {
        taskController.deleteTask(id: task!.id!).then((value) {
          SettingServices.instance.write(Keys.textTask, true);
          LocalNotifications.cancelSpecific(task!.id! + 444444);
          Get.back();
          Get.back();
        });
      },
    );
  }

  void editTask(BuildContext context) {
    controller.onButtomSheetStart(controller.selectClassification);
    Task taskInstance = Task(
        id: task!.id,
        title: textController.text,
        time: DateFormat('MMM d h:mm a').format(controller.time!),
        notification: controller.taskSwitchStateValue == true ? 1 : 0,
        classification: controller.resultOfClssificationIndex,
        color: controller.idexColor,
        isCompleted: task!.isCompleted);

    customTextFormValidation(context,
                textController: textController, missing: "103".tr) ==
            true
        ? taskController
            .updateTask(task: taskInstance)
            .then((value) => Get.offAllNamed(AppRoute.HomePage))
        : Container();
  }
}
