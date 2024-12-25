import 'package:flutter/material.dart';

Theme customSwitch(BuildContext context,
    {required bool check, required void Function(bool)? change}) {
  return Theme(
    data: ThemeData(
      useMaterial3: true,
    ).copyWith(
      colorScheme: Theme.of(context).colorScheme.copyWith(
            outline: check == true
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.shadow,
          ),
    ),
    child: Switch(
      value: check,
      activeTrackColor: Theme.of(context).cardColor,
      inactiveTrackColor: Theme.of(context).colorScheme.background,
      activeColor: Theme.of(context).colorScheme.primary,
      onChanged: change,
    ),
  );
}
