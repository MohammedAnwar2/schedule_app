import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:schedule_app/components/customFloatingButtom.dart';
import 'package:schedule_app/core/constants/themeOfApp/fonts.dart';
import 'package:schedule_app/core/controller/settingsController.dart';
import 'package:schedule_app/ui/widgets/settings/sharedFeedback/customRadioListTile.dart';

class DefultClassification extends StatelessWidget {
  DefultClassification({Key? key}) : super(key: key);
  final ImpSettingsController settingsController =
      Get.find<ImpSettingsController>(); //selectedCurrentAlarmBeforRadioValue
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: 15.w,
        top: 540.h,
        left: 24.w,
        right: 24.h,
      ),
      //  padding: EdgeInsets.all(16),
      child: Material(
        borderRadius: BorderRadius.circular(8.0),
        color: Theme.of(context).cardColor,
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "130".tr,
                style: TextStyleFonts.CTAText.copyWith(
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
              Divider(
                color: Theme.of(context).hintColor,
              ),
              customListTileForClassification(
                radioValue: 0,
              ),
              customListTileForClassification(
                radioValue: 1,
              ),
              customListTileForClassification(
                radioValue: 2,
              ),
              customListTileForClassification(
                radioValue: 3,
              ),
              Spacer(),
              Center(
                child: CustomFloatingButtom(
                  is_initializPage: true,
                  text: "38".tr,
                  press: () {
                    settingsController.changeCurrentClassificationRaioValue(
                        settingsController.selectedClassificationRadioValue!);
                    Get.back();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
