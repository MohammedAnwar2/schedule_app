import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    this.firstWidget,
    this.space,
    this.secondWidget,
    this.press,
  });

  final Widget? firstWidget;
  final Widget? secondWidget;
  final double? space;
  final void Function()? press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Row(
        children: [firstWidget!, SizedBox(width: space!.w), secondWidget!],
      ),
    );
  }
}
