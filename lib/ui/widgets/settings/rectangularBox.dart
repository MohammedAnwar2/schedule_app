import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:schedule_app/core/constants/themeOfApp/fonts.dart';

class RectangularBox extends StatelessWidget {
  RectangularBox({super.key, required this.text, required this.press});
  final String text;
  final void Function() press;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(top: 24.h),
      child: InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: press,
        child: Container(
          width: Get.width,
          height: 48.h,
          padding: EdgeInsetsDirectional.symmetric(horizontal: 8.w),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Theme.of(context).cardColor),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(text,
                  style: TextStyleFonts.BodyText.copyWith(
                      color: Theme.of(context).colorScheme.onPrimary)),
              Icon(
                Icons.arrow_forward_ios,
                size: 20,
                color: Theme.of(context).colorScheme.shadow,
              )
            ],
          ),
        ),
      ),
    );
  }
}
