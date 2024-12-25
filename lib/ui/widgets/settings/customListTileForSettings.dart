import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:schedule_app/core/constants/themeOfApp/fonts.dart';

class customListTileForSettings extends StatelessWidget {
  const customListTileForSettings({
    super.key,
    required this.press,
    required this.text,
    required this.cotrollerVlaue,
  });

  final void Function(bool) press;
  final String text;
  final bool cotrollerVlaue;

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
