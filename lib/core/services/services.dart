import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:schedule_app/core/constants/keys.dart';
import 'package:schedule_app/core/firebase/signIn.dart';
import 'package:schedule_app/core/services/notificationServices.dart';
import 'package:schedule_app/data/database/configrationsDatabase.dart';
import 'package:schedule_app/firebase_options.dart';

SQLite sq = SQLite();

class SettingServices extends GetxService {
  static SettingServices instance = Get.find<SettingServices>();
  late GetStorage _box;

  Future<SettingServices> init() async {
    await LocalNotifications.init();
    //  await LocalNotifications.cancelAllChannel();
    _box = GetStorage();
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    await initializeDateFormatting('ar_SA');
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    //sq.MydeleteDatabase();
    if (read(Keys.language) == null) {
      write(Keys.language, Get.deviceLocale!.languageCode);
    }
    if (read(Keys.uid) == null) {
      signIn();
      print("SettingServices.instance.read(Keys.uid)==null");
    } else {
      print("SettingServices.instance.read(Keys.uid)!=null");
    }
    //getUid();
    return this;
  }

  T read<T>(String key) {
    return _box.read(key);
  }

  void write(String key, dynamic value) async {
    await _box.write(key, value);
  }
}
