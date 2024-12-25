import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: 2,
      color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.2),
    );
  }
}
