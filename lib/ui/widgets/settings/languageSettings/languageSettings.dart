import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schedule_app/ui/widgets/settings/languageSettings/selectLanguage.dart';
import 'package:schedule_app/ui/widgets/settings/rectangularBox.dart';

class LanguageSettings extends StatelessWidget {
  const LanguageSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return RectangularBox(
      text: "64".tr,
      press: () {
        SelectLanguage(context: context);
      },
    );
  }
}
