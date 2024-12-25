import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:schedule_app/core/constants/themeOfApp/fonts.dart';
import 'package:schedule_app/core/controller/timeTable/timeTableController.dart';

class CustomRadioListTile extends StatelessWidget {
  CustomRadioListTile({super.key, required this.radioValue});

  final int radioValue;
  final ImpTimeTableController timeTableController =
      Get.find<ImpTimeTableController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ImpTimeTableController>(
        init: ImpTimeTableController(),
        builder: (_) {
          return Padding(
            padding: EdgeInsets.only(top: 8.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("$radioValue ${"37".tr}",
                    style: TextStyleFonts.BodyText.copyWith(
                        color:
                            timeTableController.selectedRadioValue == radioValue
                                ? Theme.of(context).colorScheme.onPrimary
                                : Theme.of(context).colorScheme.scrim)),
                Theme(
                  data: ThemeData(
                    //here change to your color
                    unselectedWidgetColor:
                        Theme.of(context).colorScheme.primary,
                  ),
                  child: Radio(
                    visualDensity: const VisualDensity(
                        horizontal: VisualDensity.minimumDensity,
                        vertical: VisualDensity.minimumDensity),
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    value: radioValue,
                    activeColor: Theme.of(context).colorScheme.primary,
                    focusColor: Theme.of(context).colorScheme.primary,
                    hoverColor: Theme.of(context).colorScheme.primary,
                    groupValue: timeTableController.selectedRadioValue,
                    onChanged: (value) {
                      timeTableController.changeRaioValue(value!);
                    },
                  ),
                )
              ],
            ),
          );
        });
  }
}
/*
ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Text("45 Min",
                style: TextStyleFonts.BodyText.copyWith(color: Colors.black87)),
            trailing: Theme(
              data: ThemeData(
                //here change to your color
                unselectedWidgetColor: Theme.of(context).colorScheme.primary,
              ),
              child: Radio(
                visualDensity: const VisualDensity(
                    horizontal: VisualDensity.minimumDensity,
                    vertical: VisualDensity.minimumDensity),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                value: radioValue,
                activeColor: Theme.of(context).colorScheme.primary,
                focusColor: Theme.of(context).colorScheme.primary,
                hoverColor: Theme.of(context).colorScheme.primary,
                groupValue: timeTableController.selectedRadioValue,
                onChanged: (value) {
                  timeTableController.changeRaioValue(value!);
                },
              ),
            ),
          );
 */