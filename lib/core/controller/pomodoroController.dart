import 'dart:async';

import 'package:get/get.dart';
import 'package:schedule_app/core/services/notificationServices.dart';

abstract class PomodoroController extends GetxController {
  startPauseTimer();
  startTimer();
  pauseTimer();
  resetTimer();
  onSelectedFocusItemChanged({required int index});
  onSelectedBreakItemChanged({required int index});
  changeStateOfAlarmSwitch(bool state);
  // resetValues();
}

class ImpPomodoroController extends PomodoroController {
  RxInt workTime = 25.obs;
  RxInt breakTime = 5.obs;
  RxBool isWorking = true.obs;
  RxBool isRunning = false.obs;
  RxInt seconds = 0.obs;
  RxInt secondsForBreak = 0.obs;

  int? selectFocusPeriod;
  int? selectBreakPeriod;
  bool? alarmSwitchState;

  Timer? timer;

  void startPauseTimer() {
    if (isRunning.value) {
      pauseTimer();
    } else {
      startTimer();
    }
  }

  void startTimer() {
    isRunning.value = true;
    timer = Timer.periodic(Duration(seconds: 1), (Timer t) {
      if (seconds.value > 0) {
        seconds.value--;
      } else {
        if (isWorking.value) {
          isWorking.value = false;
          seconds.value = breakTime.value * 60;
          // Get.snackbar("work time done", "isWorking.value = false");

          alarmSwitchState == true
              ? LocalNotifications.showSimpleNotification(
                  id: 0,
                  title: "Foucs time done",
                  body: "this is the time for taking break ",
                  payload: "1",
                )
              : null;

          // LocalNotifications.startPomodoro(
          //     id: 0,
          //     title: "Foucs time done",
          //     body: "this is the time for taking break ",
          //     payload: "sdfsdfsdf",
          //     channelName: "pomodoro Technique");

          //notification for ending of work time
        } else {
          // Get.snackbar("Break time done", "isBreak.value = false");

          alarmSwitchState == true
              ? LocalNotifications.showSimpleNotification(
                  id: 0,
                  title: "Break time done",
                  body:
                      "this is the time to comeback to compleate your today's tasks",
                  payload: "2")
              : null;

          // LocalNotifications.startPomodoro(
          //     id: 0,
          //     title: "Break time done",
          //     body:
          //         "this is the time to comeback to compleate your today's tasks",
          //     payload: "sdfsdfsdf",
          //     channelName: "pomodoro Technique");

          //notification for ending of break time
          resetTimer();
        }
      }
    });
  }

  void pauseTimer() {
    isRunning.value = false;
    timer?.cancel();
  }

  void resetTimer() {
    isRunning.value = false;
    isWorking.value = true;
    seconds.value = workTime.value * 60;
    timer?.cancel();
  }

  @override
  onSelectedFocusItemChanged({required int index}) {
    selectFocusPeriod = index;
    update();
  }

  @override
  onSelectedBreakItemChanged({required int index}) {
    selectBreakPeriod = index;
    update();
  }

  @override
  void onInit() {
    resetTimer(); //احذر منها
    selectFocusPeriod = 25;
    selectBreakPeriod = 5;
    alarmSwitchState = true;
    super.onInit();
  }

  @override
  changeStateOfAlarmSwitch(bool state) {
    alarmSwitchState = state;
    update();
  }

  // @override
  // resetValues() {
  //   selectFocusPeriod = workTime.value;
  //   selectBreakPeriod = breakTime.value;
  //   //alarmSwitchState = alarmSwitchState;
  //   update();
  // }
}
