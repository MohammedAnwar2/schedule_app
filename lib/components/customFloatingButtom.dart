// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:schedule_app/core/constants/themeOfApp/fonts.dart';

class CustomFloatingButtom extends StatelessWidget {
  const CustomFloatingButtom({
    super.key,
    required this.text,
    required this.press,
    required this.is_initializPage,
  });
  final String text;
  final bool is_initializPage;
  final void Function() press;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        width: is_initializPage == false ? 200.w : 294.w,
        height: 48.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          text,
          style: TextStyleFonts.CTAText.apply(
              color: Theme.of(context).colorScheme.background),
        ),
      ),
    );
  }
}
