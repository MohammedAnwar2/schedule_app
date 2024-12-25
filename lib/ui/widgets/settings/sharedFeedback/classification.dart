import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:schedule_app/core/controller/settingsController.dart';
import 'package:schedule_app/ui/widgets/settings/sharedFeedback/customClassificationShowDialog.dart';

class ClassificationFeedback extends StatelessWidget {
  ClassificationFeedback({super.key});
  final ImpSettingsController settingsController =
      Get.find<ImpSettingsController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48.h,
      margin: EdgeInsets.only(left: 16.w, right: 16, top: 8.w, bottom: 8.w),
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          color: Theme.of(context).cardColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('139'.tr),
          GestureDetector(
            onTap: () {
              settingsController.classificationDialogDismissedClosed.value =
                  false;
              settingsController.changeClassificationRaioValue(
                  settingsController.selectedCurrentClassificationRadioValue!);
              CustomClassificationShowDialog(context);
            },
            child: Row(
              children: [
                GetBuilder<ImpSettingsController>(
                    init: ImpSettingsController(),
                    builder: (_) {
                      return Text(settingsController
                          .classification[settingsController
                              .selectedCurrentClassificationRadioValue!]
                          .tr);
                    }),
                Icon(Icons.arrow_drop_down)
              ],
            ),
          )
        ],
      ),
    );
  }
}
