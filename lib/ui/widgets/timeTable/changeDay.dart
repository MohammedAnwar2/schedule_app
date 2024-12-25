import 'package:flutter/material.dart';
import 'package:schedule_app/core/constants/keys.dart';
import 'package:schedule_app/core/services/services.dart';

class ChangeDay extends StatelessWidget {
  const ChangeDay(
      {super.key, this.leftButton, this.rightButton, required this.day});

  final void Function()? leftButton;
  final void Function()? rightButton;
  final String day;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
            onPressed: leftButton,
            icon: Icon(
              SettingServices.instance.read(Keys.language) != "ar"
                  ? Icons.keyboard_arrow_left_sharp
                  : Icons.keyboard_arrow_right_sharp,
              color: Theme.of(context).colorScheme.shadow,
            )),
        Text(day),
        IconButton(
            onPressed: rightButton,
            icon: Icon(
              SettingServices.instance.read(Keys.language) != "ar"
                  ? Icons.keyboard_arrow_right_sharp
                  : Icons.keyboard_arrow_left_sharp,
              color: Theme.of(context).colorScheme.shadow,
            )),
      ],
    );
  }
}
