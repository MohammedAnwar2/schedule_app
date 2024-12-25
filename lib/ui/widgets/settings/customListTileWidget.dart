import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:schedule_app/core/constants/themeOfApp/fonts.dart';

class CustomListTileWidget extends StatelessWidget {
  CustomListTileWidget({
    super.key,
    required this.press,
    required this.text,
  });
  final void Function() press;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: press,
        child: Container(
          height: 48.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
