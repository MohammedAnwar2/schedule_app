import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:schedule_app/components/customFloatingButtom.dart';
import 'package:schedule_app/core/controller/settingsController.dart';
import 'package:schedule_app/ui/widgets/settings/alarmsSettings/alarmBefor.dart';
import 'package:schedule_app/ui/widgets/settings/customDivider.dart';
import 'package:schedule_app/ui/widgets/settings/customListTileForSettings.dart';

final ImpSettingsController settingsController =
    Get.find<ImpSettingsController>();

SelectAlarms({required BuildContext context}) {
  return showModalBottomSheet(
    isDismissible: false,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(32.0),
      ),
    ),
    context: context,
    builder: (context) {
      return Obx(() => AnimatedContainer(
            duration: Duration(microseconds: 300),
            width: double.infinity,
            height: settingsController.alarmDialogDismissedClosed.value
                ? 360.h
                : 470.h,
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onSecondaryContainer,
                // color: Colors.red,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32)),
                border: Border.all(
                  color: Theme.of(context).colorScheme.onSecondaryContainer,
                )),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
              // SizedBox(height: 16.h),
              SizedBox(height: 10.h),
              GetBuilder<ImpSettingsController>(
                  init: ImpSettingsController(),
                  builder: (controller) => customListTileForSettings(
                        text: "73".tr,
                        cotrollerVlaue:
                            settingsController.switchStateOfClassAlarms!,
                        press: (classAlarmValue) {
                          settingsController
                              .changeSwitchStateOfClassAlarms(classAlarmValue);
                        },
                      )),
              SizedBox(height: 10.h),
              CustomDivider(),
              SizedBox(height: 10.h),
              //SizedBox(height: 16.h),
              GetBuilder<ImpSettingsController>(
                init: ImpSettingsController(),
                builder: (controller) => customListTileForSettings(
                    text: "74".tr,
                    cotrollerVlaue:
                        settingsController.switchStateOfTasksAlarms!,
                    press: (tasksAlarmValue) {
                      settingsController
                          .changeSwitchStateOfTasksAlarms(tasksAlarmValue);
                    }),
              ),
              SizedBox(height: 10.h),
              CustomDivider(),
              SizedBox(height: 10.h),
              // SizedBox(height: 16.h),
              GetBuilder<ImpSettingsController>(
                  init: ImpSettingsController(),
                  builder: (controller) => customListTileForSettings(
                        text: "75".tr,
                        cotrollerVlaue:
                            settingsController.switchStateOfEventsAlarms!,
                        press: (eventsAlarmValue) {
                          settingsController.changeSwitchStateOfEventsAlarms(
                              eventsAlarmValue);
                        },
                      )),
              SizedBox(height: 10.h),
              CustomDivider(),
              AlarmBefor(),
              Spacer(),
              Center(
                child: CustomFloatingButtom(
                  is_initializPage: false,
                  text: "38".tr,
                  press: () {
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
}
