import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:schedule_app/components/customFloatingButtom.dart';
import 'package:schedule_app/core/constants/keys.dart';
import 'package:schedule_app/core/constants/themeOfApp/fonts.dart';
import 'package:schedule_app/core/controller/settingsController.dart';
import 'package:schedule_app/core/services/services.dart';
import 'package:schedule_app/ui/widgets/settings/alarmsSettings/customListTileForAlarmBefor.dart';

class DefultAlarmBefore extends StatelessWidget {
  DefultAlarmBefore({Key? key}) : super(key: key);
  final ImpSettingsController settingsController =
      Get.find<ImpSettingsController>(); //selectedCurrentAlarmBeforRadioValue
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: 15.w,
        top: 450.h,
        left: 24.w,
        right: 24.h,
      ),
      //  padding: EdgeInsets.all(16),
      child: Material(
        borderRadius: BorderRadius.circular(8.0),
        //color: Colors.amber,
        color: Theme.of(context).cardColor,
        //color: Theme.of(context).colorScheme.onSecondaryContainer,
        // color: Color(0xff2F2E2E),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "76".tr,
                style: TextStyleFonts.CTAText.copyWith(
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
              Divider(
                color: Theme.of(context).hintColor,
              ),
              customListTileForAlarmBefor(
                radioValue: 5,
              ),
              customListTileForAlarmBefor(
                radioValue: 10,
              ),
              customListTileForAlarmBefor(
                radioValue: 15,
              ),
              customListTileForAlarmBefor(
                radioValue: 20,
              ),
              customListTileForAlarmBefor(
                radioValue: 25,
              ),
              customListTileForAlarmBefor(
                radioValue: 30,
              ),
              customListTileForAlarmBefor(
                radioValue: 60,
              ),
              Spacer(),
              Center(
                child: CustomFloatingButtom(
                  is_initializPage: true,
                  text: "38".tr,
                  press: () {
                    settingsController.changeCurrentAlarmBefoeRaioValue(
                        settingsController.selectedAlarmBeforRadioValue!);
                    SettingServices.instance.write(Keys.alarmBefore,
                        settingsController.selectedAlarmBeforRadioValue);
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
