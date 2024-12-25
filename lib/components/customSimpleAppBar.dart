import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:schedule_app/components/customIconAppBarButton.dart';
import 'package:schedule_app/core/constants/themeOfApp/fonts.dart';

class SimplAppBar extends StatelessWidget {
  const SimplAppBar({super.key, this.text, this.press});
  final String? text;
  final void Function()? press;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 115.h,
      decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: const BorderRadiusDirectional.only(
              bottomStart: Radius.circular(16),
              bottomEnd: Radius.circular(16))),
      child: Padding(
        padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 35.w),
        child: Row(children: [
          Text(
            text!.tr,
            style: TextStyleFonts.HeadingText.copyWith(
                color: Theme.of(context).colorScheme.onPrimary),
          ),
          const Spacer(),
          CustomAppBarButton(icon: Icons.arrow_forward, press: press!),
        ]),
      ),
    );
  }
}
