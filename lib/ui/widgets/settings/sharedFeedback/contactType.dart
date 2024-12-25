import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:schedule_app/core/constants/themeOfApp/fonts.dart';

class CuntactType extends StatelessWidget {
  CuntactType(
      {super.key, required this.path, required this.text, required this.press});

  final String path;
  final void Function() press;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        children: [
          SvgPicture.asset(
            path,
            width: 24.w,
            height: 24.h,
            colorFilter: ColorFilter.mode(
              Theme.of(context).colorScheme.onPrimary,
              BlendMode.srcIn,
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
          Text(
            text,
            style: TextStyleFonts.Regular14.copyWith(
                color: Theme.of(context).colorScheme.onPrimary),
          )
        ],
      ),
    );
  }
}
