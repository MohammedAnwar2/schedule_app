import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:schedule_app/components/customFloatingButtom.dart';
import 'package:schedule_app/core/constants/keys.dart';
import 'package:schedule_app/core/constants/themeOfApp/fonts.dart';
import 'package:schedule_app/core/controller/timeTable/timeTableController.dart';
import 'package:schedule_app/core/services/services.dart';
import 'package:schedule_app/ui/widgets/timeTable/classTime/customListTile.dart';

final ImpTimeTableController timeTableController =
    Get.find<ImpTimeTableController>();

class DefultClassTime extends StatelessWidget {
  const DefultClassTime({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: 15.w,
        top: 550.h,
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
                "36".tr,
                style: TextStyleFonts.CTAText.copyWith(
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
              Divider(
                color: Theme.of(context).hintColor,
              ),
              CustomRadioListTile(
                radioValue: 45,
              ),
              CustomRadioListTile(
                radioValue: 50,
              ),
              CustomRadioListTile(
                radioValue: 60,
              ),
              CustomRadioListTile(
                radioValue: 90,
              ),
              Spacer(),
              Center(
                child: CustomFloatingButtom(
                  is_initializPage: true,
                  text: "38".tr,
                  press: () {
                    timeTableController.changeCurrentRaioValue(
                        timeTableController.selectedRadioValue);
                    SettingServices.instance.write(
                        Keys.classTime, timeTableController.selectedRadioValue);
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
