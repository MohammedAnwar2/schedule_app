// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:schedule_app/core/constants/themeOfApp/fonts.dart';

class MinutesPicker extends StatelessWidget {
  MinutesPicker({
    Key? key,
    required this.changeTime,
    required this.numberOfMinutes,
    required this.initialItem,
  }) : super(key: key);

  final void Function(int) changeTime;
  final int initialItem;
  final int numberOfMinutes;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.h,
      child: CupertinoTheme(
        data: CupertinoThemeData(
          // Customize the theme properties here
          primaryColor: CupertinoColors.systemBlue,
          textTheme: CupertinoTextThemeData(
              pickerTextStyle: TextStyleFonts.BodyText.apply(
            color: Theme.of(context).colorScheme.primary,
            //decorationColor: Colors.amber
          )),
        ),
        child: CupertinoPicker(
          scrollController:
              FixedExtentScrollController(initialItem: initialItem),
          itemExtent: 40,
          onSelectedItemChanged: changeTime,
          children: List.generate(numberOfMinutes, (index) {
            return Center(
              child: Text(
                '${index + 1}  ${"44".tr}',
                style: TextStyle(fontSize: 20),
              ),
            );
          }),
        ),
      ),
    );
  }
}
