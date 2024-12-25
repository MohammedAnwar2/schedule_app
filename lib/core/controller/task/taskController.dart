// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schedule_app/core/constants/keys.dart';
import 'package:schedule_app/core/services/services.dart';

abstract class TaskControllers extends GetxController {
  selectTime(DateTime time);
  changeStateOfAlarmSwitch(bool state);
  selectColor(int indexOfCurrentColor);
  onButtomChange(int index);
  onButtomSheetStart(String index);
  changeTheClassification(int index);
  resetAllTheValues();
}

class ImpTaskController extends TaskControllers {
  List<String> classificationList = ['95'.tr, '96'.tr, '97'.tr];

  FloatingActionButtonLocation? floatingActionButtonLocation;
  int? idexColor;
  late bool important;
  late bool notImportant;
  late int resultOfClssificationIndex;
  late String selectClassification;
  bool? taskSwitchStateValue;
  DateTime? time;
  late bool veryImportant;

  @override
  changeTheClassification(int index) {
    selectClassification = classificationList[index];
    update();
  }

  @override
  onButtomChange(int index) {
    switch (index) {
      case 0:
        veryImportant = true;
        important = false;
        notImportant = false;
        resultOfClssificationIndex = 0;
        break;
      case 1:
        veryImportant = false;
        important = true;
        notImportant = false;
        resultOfClssificationIndex = 1;
        break;
      case 2:
        veryImportant = false;
        important = false;
        notImportant = true;
        resultOfClssificationIndex = 2;
        break;
      default:
        break;
    }
    update();
  }

  @override
  onButtomSheetStart(String index) {
    switch (index) {
      case "Very Important":
        veryImportant = true;
        important = false;
        notImportant = false;
        resultOfClssificationIndex = 0;
        break;
      case "Important":
        veryImportant = false;
        important = true;
        notImportant = false;
        resultOfClssificationIndex = 1;
        break;
      case "Not Important":
        veryImportant = false;
        important = false;
        notImportant = true;
        resultOfClssificationIndex = 2;
        break;
      default:
        break;
    }
    update();
  }

  @override
  void onInit() {
    time = DateTime.now();
    taskSwitchStateValue =
        SettingServices.instance.read(Keys.tasksAlarms) ?? true;

    ///
    idexColor = 7;
    veryImportant = true;
    important = false;
    notImportant = false;
    resultOfClssificationIndex = 0;
    selectClassification = "95".tr;
    super.onInit();
  }

  @override
  resetAllTheValues() {
    time = DateTime.now();
    taskSwitchStateValue =
        SettingServices.instance.read(Keys.tasksAlarms) ?? true;

    ///
    idexColor = 7;
    veryImportant = true;
    important = false;
    notImportant = false;
    resultOfClssificationIndex = 0;
    selectClassification = "95".tr;
    update();
  }

  @override
  selectColor(int indexOfCurrentColor) {
    idexColor = indexOfCurrentColor;
    update();
    //throw UnimplementedError();
  }

  @override
  selectTime(DateTime time) {
    this.time = time;
    update();
    //throw UnimplementedError();
  }

  @override
  changeStateOfAlarmSwitch(bool state) {
    taskSwitchStateValue = state;
    update();
    //  throw UnimplementedError();
  }
}
