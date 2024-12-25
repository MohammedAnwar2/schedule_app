import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:schedule_app/components/customFloatingButtom.dart';
import 'package:schedule_app/core/constants/themeOfApp/fonts.dart';
import 'package:schedule_app/core/controller/settingsController.dart';
import 'package:schedule_app/ui/widgets/settings/customDivider.dart';
import 'package:schedule_app/ui/widgets/settings/customListTileForSettings.dart';
import 'package:schedule_app/ui/widgets/settings/timeSettings/calender/calender.dart';

final ImpSettingsController settingsController =
    Get.find<ImpSettingsController>();
SelectTimeSettings({required BuildContext context}) {
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
            height: settingsController.calendarDialogDismissedClosed.value &&
                    settingsController.weekStartDialogDismissedClosed.value
                ? 230.h
                : settingsController.calendarDialogDismissedClosed.value ==
                        false
                    ? 400.h
                    : 455.h,
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
              SizedBox(height: 5.h),
              // =-=-=-=-=-=-=-=-=--=-=-=-=-=-=-=-=-=-=-=
              // WeekStartingOn(),                      =
              // SizedBox(height: 5.h),                 = [ we will comeback to this feature soon after we build the timeTable ]
              // CustomDivider(),                       =
              // =-=-=-=-=-=-=-=-=--=-=-=-=-=-=-=-=-=-=-=
              SizedBox(height: 5.h),
              Calender(),
              SizedBox(height: 5.h),
              CustomDivider(),
              SizedBox(height: 7.h),
              GetBuilder<ImpSettingsController>(
                  init: ImpSettingsController(),
                  builder: (_) {
                    return customListTileForSettings(
                        text: "78".tr,
                        cotrollerVlaue: settingsController.switchStateOf24hr!,
                        press: (time24Value) {
                          settingsController
                              .changeSwitchStateOf24hr(time24Value);
                        });
                  }),
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

class customListTileForAlarmSettings extends StatelessWidget {
  const customListTileForAlarmSettings({
    super.key,
    required this.press,
    required this.text,
    required this.cotrollerVlaue,
  });

  final bool cotrollerVlaue;
  final void Function(bool) press;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text,
              style: TextStyleFonts.BodyText.copyWith(
                  color: Theme.of(context).colorScheme.onPrimary)),
          Switch(value: cotrollerVlaue, onChanged: press),
        ],
      ),
    );
  }
}
