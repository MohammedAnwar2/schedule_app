import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schedule_app/core/services/services.dart';

class ThemeController extends GetxController {
  final _key = 'isDarkMode';
  ThemeMode get theme => _loadTheme() ? ThemeMode.dark : ThemeMode.light;
  // if (_loadTheme() == null) {
  //   return null;
  // } else if (_loadTheme() == false) {
  //   return ThemeMode.light;
  // } else {
  //   return ThemeMode.dark;
  // }
  //return _loadTheme() ? ThemeMode.dark : ThemeMode.light;
  // return _loadTheme() ? ThemeMode.dark : ThemeMode.light;

  bool _loadTheme() => SettingServices.instance.read(_key) ?? false;
  // bool _loadTheme() => SettingServices.instance.read(_key) ?? false;

  void saveTheme(bool isDarkMode) =>
      SettingServices.instance.write(_key, isDarkMode);
  void changeTheme(ThemeData theme) => Get.changeTheme(theme);
  void changeThemeMode(ThemeMode themeMode) => Get.changeThemeMode(themeMode);
}
