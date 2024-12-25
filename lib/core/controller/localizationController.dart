// ignore_for_file: file_names, unused_local_variable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schedule_app/core/constants/keys.dart';
import 'package:schedule_app/core/controller/settingsController.dart';
import 'package:schedule_app/core/services/services.dart';

ImpSettingsController settingsController = Get.find<ImpSettingsController>();

abstract class MyLanguageController extends GetxController {
  void changeLangauge(String lang);
}

class ImpMyLanguageController extends MyLanguageController {
  Locale? local;
  // Locale local = SettingServices.instance.read(Keys.language) == null
  //     ? Get.deviceLocale!
  //     : Locale(SettingServices.instance.read(Keys.language)!);
  @override
  changeLangauge(String lang) {
    local = Locale(lang);
    print("local: $local");
    SettingServices.instance.write(Keys.language, lang);
    Get.updateLocale(local!);
  }

//Keys.language
  @override
  void onInit() {
    String? getStorage = SettingServices.instance.read(Keys.language);
    if (getStorage == "ar") {
      local = const Locale("ar");
    } else if (getStorage == "en") {
      local = const Locale("en");
    } else {
      local = Locale(Get.deviceLocale!.languageCode);
      SettingServices.instance.write(
          Keys.language,
          Get.deviceLocale!
              .languageCode); //عرفه افضل في داله الخدمات <services>
    }
    super.onInit();
  }

  // @override
  // void checkLanguage({bool? checkBoxForArabic, bool? checkBoxForEnglish}) {
  //   String deviceLangauge = Get.deviceLocale.toString();
  //   if (SettingServices.instance.read(Keys.language) == null) {
  //     if (deviceLangauge.substring(0, 2) == "ar") {
  //       SettingServices.instance.write(Keys.language, "ar");
  //       checkBoxForArabic = true;
  //       checkBoxForEnglish = false;
  //     } else {
  //       SettingServices.instance.write(Keys.language, "en");
  //       checkBoxForArabic = false;
  //       checkBoxForEnglish = true;
  //     }
  //   } else {
  //     if (SettingServices.instance.read(Keys.language) == "ar") {
  //       checkBoxForArabic = true;
  //       checkBoxForEnglish = false;
  //     } else {
  //       checkBoxForArabic = false;
  //       checkBoxForEnglish = true;
  //     }
  //   }
  // }
}
