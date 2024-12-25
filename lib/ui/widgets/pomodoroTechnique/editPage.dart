import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:schedule_app/components/customCloseConfirmAppBar.dart';
import 'package:schedule_app/components/customFloatingButtom.dart';
import 'package:schedule_app/components/customSwitch.dart';
import 'package:schedule_app/components/customTitleText.dart';
import 'package:schedule_app/core/controller/pomodoroController.dart';
import 'package:schedule_app/ui/widgets/pomodoroTechnique/minutesPicker.dart';

class EditPomodoro extends StatelessWidget {
  EditPomodoro({super.key});
  final pomodoroController = Get.find<ImpPomodoroController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CustomFloatingButtom(
        is_initializPage: false,
        text: "100".tr,
        press: () {
          pomodoroController.workTime.value =
              pomodoroController.selectFocusPeriod!;
          pomodoroController.breakTime.value =
              pomodoroController.selectBreakPeriod!;
          pomodoroController.seconds.value =
              pomodoroController.workTime.value * 60;
          Get.back();
        },
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          customCloseConfirmAppBar(
              text: '104'.tr,
              firstIcon: Icons.close,
              secondIcon: Icons.check,
              press_1: () {
                Get.back();
              },
              press_2: () {
                Get.back();
              }),
          Padding(
            padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 72.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTitleText(title: "108".tr),
                MinutesPicker(
                  numberOfMinutes: 120,
                  initialItem: pomodoroController.workTime.value - 1,
                  changeTime: (index) {
                    pomodoroController.onSelectedFocusItemChanged(
                        index: index + 1);
                  },
                ),
                CustomTitleText(title: "109".tr),
                MinutesPicker(
                  numberOfMinutes: 60,
                  initialItem: pomodoroController.breakTime.value - 1,
                  changeTime: (index) {
                    pomodoroController.onSelectedBreakItemChanged(
                        index: index + 1);
                  },
                ),
                SizedBox(height: 52.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomTitleText(title: "110".tr),
                    GetBuilder<ImpPomodoroController>(
                      init: ImpPomodoroController(),
                      builder: (_) {
                        return customSwitch(context,
                            check: pomodoroController.alarmSwitchState!,
                            change: (val) {
                          pomodoroController.changeStateOfAlarmSwitch(val);
                        });
                      },
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
