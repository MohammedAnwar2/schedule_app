// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:schedule_app/core/constants/themeOfApp/fonts.dart';

class CustomTimePicker extends StatelessWidget {
  const CustomTimePicker({
    super.key,
    required this.selectCurrentTime,
    required this.time,
    required this.use24hFormat,
  });

  final void Function(DateTime) selectCurrentTime;
  final DateTime time;
  final bool use24hFormat;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 134.h,
      width: 358.w,
      padding:
          EdgeInsetsDirectional.symmetric(horizontal: 48.w, vertical: 16.h),
      child: CupertinoTheme(
        data: CupertinoThemeData(
          brightness: Brightness.light,
          scaffoldBackgroundColor: Colors.amber,
          primaryColor: Theme.of(context).colorScheme.primary,
          primaryContrastingColor: Colors.redAccent,
          barBackgroundColor: Colors.amber,
          textTheme: CupertinoTextThemeData(
            dateTimePickerTextStyle: TextStyleFonts.BodyText.apply(
              color: Theme.of(context).colorScheme.primary,
              //decorationColor: Colors.amber
            ),
          ),
        ),
        child: CupertinoDatePicker(
            // backgroundColor: Colors.blue,

            mode: CupertinoDatePickerMode.time,
            initialDateTime: time,
            use24hFormat: use24hFormat,
            // showDayOfWeek: true,
            onDateTimeChanged: selectCurrentTime),
      ),
    );
  }
}
