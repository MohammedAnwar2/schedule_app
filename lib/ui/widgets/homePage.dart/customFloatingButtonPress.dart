// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:schedule_app/ui/widgets/homePage.dart/custmizeAddIcon.dart';

class CustomButtomPress extends StatelessWidget {
  const CustomButtomPress({
    super.key,
    required this.press,
  });

  final void Function() press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: press,
        child: Container(
          child: CustomizeAddIcons(),
        ));
  }
}
          // Get.toNamed(AppRoute.AddTask);
