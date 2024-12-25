import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:schedule_app/core/constants/themeOfApp/fonts.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    super.key,
    required this.width,
    required this.name,
    this.select,
  });

  final String? name;
  final bool? select;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width!.w,
      height: 48.h,
      alignment: Alignment.center,
      //  padding: EdgeInsets.all(.r),
      decoration: ShapeDecoration(
        color: select == true
            ? Theme.of(context).colorScheme.primary
            : Theme.of(context).cardColor,
        shape: RoundedRectangleBorder(
          side: BorderSide(
              width: 1, color: Theme.of(context).colorScheme.primary),
          borderRadius: BorderRadius.circular(8.r),
        ),
      ),
      child: Text(
        name!,
        style: TextStyleFonts.CTAText.apply(
          color: select == false
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).cardColor,
        ),
      ),
    );
  }
}
