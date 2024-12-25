// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:schedule_app/core/constants/themeOfApp/fonts.dart';

class CustomTitleText extends StatelessWidget {
  const CustomTitleText({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(title,
        style: TextStyleFonts.BodyText.apply(
            color: Theme.of(context).colorScheme.onPrimaryContainer));
  }
}
