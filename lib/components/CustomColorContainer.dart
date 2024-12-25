import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomColorContainer extends StatelessWidget {
  const CustomColorContainer(
      {super.key, required this.select, required this.color});
  final bool select;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42.h,
      width: 42.h,
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(Radius.circular(16)),
          border: select == true
              ? Border.all(color: Theme.of(context).hintColor, width: 3.5)
              : null),
      child: select == true
          ? Icon(Icons.check, color: Theme.of(context).hintColor)
          : Container(),
    );
  }
}
