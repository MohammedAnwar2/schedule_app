import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBarButton extends StatelessWidget {
  CustomAppBarButton({super.key, required this.icon, required this.press});
  final IconData icon;
  final void Function() press;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        height: 34.h,
        width: 38.w,
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.onBackground.withOpacity(0.3),
            borderRadius: BorderRadius.circular(4)),
        child:
            Icon(icon, size: 25, color: Theme.of(context).colorScheme.shadow),
      ),
    );
  }
}
