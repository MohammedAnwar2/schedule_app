// ignore: camel_case_types
// ignore_for_file: camel_case_types, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:schedule_app/components/customIconAppBarButton.dart';
import 'package:schedule_app/core/constants/themeOfApp/fonts.dart';

class customCloseConfirmAppBar extends StatelessWidget {
  const customCloseConfirmAppBar({
    super.key,
    required this.text,
    required this.firstIcon,
    required this.secondIcon,
    required this.press_1,
    required this.press_2,
  });

  final IconData firstIcon;
  final void Function() press_1;
  final void Function() press_2;
  final IconData secondIcon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 114.h,
      decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: const BorderRadiusDirectional.only(
              bottomStart: Radius.circular(16),
              bottomEnd: Radius.circular(16))),
      child: Padding(
        padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 25.w),
        child: Row(children: [
          CustomAppBarButton(icon: firstIcon, press: press_1),
          const Spacer(),
          Text(
            text.tr,
            style: TextStyleFonts.HeadingText.copyWith(
                color: Theme.of(context).colorScheme.onPrimary),
          ),
          const Spacer(),
          CustomAppBarButton(icon: secondIcon, press: press_2),
        ]),
      ),
    );
  }
}
