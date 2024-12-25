// // ignore_for_file: prefer_if_null_operators, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:schedule_app/core/constants/themeOfApp/theme.dart';
import 'package:schedule_app/core/binding/AppBinding.dart';
import 'package:schedule_app/core/controller/ThemeController.dart';
import 'package:schedule_app/core/controller/localizationController.dart';
import 'package:schedule_app/data/models/localizationFile.dart';
import 'package:schedule_app/core/services/services.dart';
import 'package:schedule_app/routes/appRoutes.dart';
import 'package:schedule_app/routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Get.putAsync(() async => SettingServices().init());
  AppBinding().dependencies();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(ScheduleApp());
}

// ignore: must_be_immutable
class ScheduleApp extends StatelessWidget {
  ScheduleApp({Key? key}) : super(key: key);
  final themeController = Get.find<ThemeController>();
  ImpMyLanguageController localController = Get.find();
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(398, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: Themes.lightTheme, //-------------> this on
          darkTheme: Themes.darkTheme, //-------------> this one
          themeMode: themeController.theme,
          //-------------> this one,
          //themeMode: ThemeMode.system, //-------------> this one,
          locale: localController.local,
          translations: LocalizationModel(),
          initialBinding: AppBinding(),
          getPages: route,
          initialRoute: AppRoute.SplashScreen,
          home: child,
        );
      },
      // child: DarkLightMode(),
      // child: const SplashScreen(),
      //child: HomePage(),
      //child: CustomSlider(),
      //child: Onboarding(),
      // child: EditTask(),
      //child: Test(),
      // child: InitailPage(),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:wiredash/wiredash.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Feedback Form'),
//         ),
//         body: MyApp1(),
//       ),
//     );
//   }
// }

// class MyApp1 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Wiredash(
//       projectId: 'first-project-i87ge9p',
//       secret: 'w9L2jvSYL6_a3frtOeERFr-ijNwSrmvu',
//       child: MaterialApp(
//           // Your Flutter app is basically Wiredash's direct child.
//           // This can be a MaterialApp, WidgetsApp or whatever widget you like.
//           ),
//     );
//   }
// }






// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:get/get.dart';
// import 'package:workmanager/workmanager.dart';

// void callbackDispatcher() {
//   Workmanager().executeTask((task, inputData) {
//     // Handle background task here
//     return Future.value(true);
//   });
// }

// void main() {
//   WidgetsFlutterBinding.ensureInitialized();
//   Workmanager().initialize(callbackDispatcher);
//   runApp(MyApp());
// }

// class PomodoroController extends GetxController {
//   RxInt remainingTime = 1.obs; // Initial time in minutes
//   RxBool isPaused = false.obs;
//   RxString notificationTime = ''.obs;
//   Timer? countdownTimer;
// }

// class MyApp extends StatelessWidget {
//   final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//       FlutterLocalNotificationsPlugin();
//   final PomodoroController controller = PomodoroController();

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Pomodoro Timer',
//       home: PomodoroScreen(),
//     );
//   }
// }

// class PomodoroScreen extends StatelessWidget {
//   final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//       FlutterLocalNotificationsPlugin();
//   final PomodoroController controller = PomodoroController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Pomodoro Timer'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Obx(() => Text(
//                   '${controller.remainingTime.value} minutes',
//                   style: TextStyle(fontSize: 24),
//                 )),
//             SizedBox(height: 20),
//             Obx(() => Text(
//                   'Notification Time: ${controller.notificationTime.value}',
//                   style: TextStyle(fontSize: 16),
//                 )),
//             SizedBox(height: 20),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 ElevatedButton(
//                   onPressed: startPomodoro,
//                   child: Text('Start'),
//                 ),
//                 SizedBox(width: 10),
//                 ElevatedButton(
//                   onPressed: () => pauseOrResumePomodoro(),
//                   child: Text(controller.isPaused.value ? 'Resume' : 'Pause'),
//                 ),
//                 SizedBox(width: 10),
//                 ElevatedButton(
//                   onPressed: resetPomodoro,
//                   child: Text('Reset'),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Future<void> initializeNotifications() async {
//     const AndroidInitializationSettings initializationSettingsAndroid =
//         AndroidInitializationSettings('app_icon');

//     final InitializationSettings initializationSettings =
//         InitializationSettings(
//       android: initializationSettingsAndroid,
//     );

//     await flutterLocalNotificationsPlugin.initialize(initializationSettings);
//   }

//   Future<void> scheduleNotification(String title, String body) async {
//     const AndroidNotificationDetails androidPlatformChannelSpecifics =
//         AndroidNotificationDetails(
//       'your_channel_id',
//       'your_channel_name',
//       importance: Importance.max,
//       priority: Priority.high,
//       showWhen: false,
//       onlyAlertOnce: true,
//       ongoing: true,
//     );

//     const NotificationDetails platformChannelSpecifics = NotificationDetails(
//       android: androidPlatformChannelSpecifics,
//     );

//     await flutterLocalNotificationsPlugin.show(
//       0, // Notification ID
//       title,
//       body,
//       platformChannelSpecifics,
//       payload: 'notification_payload',
//     );
//   }

//   void startPomodoro() {
//     if (controller.remainingTime.value > 0 &&
//         (controller.countdownTimer == null ||
//             !controller.countdownTimer!.isActive)) {
//       controller.countdownTimer = Timer.periodic(Duration(minutes: 1), (timer) {
//         if (!controller.isPaused.value) {
//           controller.remainingTime.value -= 1;
//           controller.notificationTime.value =
//               '${controller.remainingTime.value} minutes';

//           if (controller.remainingTime.value <= 0) {
//             // Pomodoro completed, show notification
//             scheduleNotification(
//                 'Pomodoro Complete', 'Take rest for 5 minutes');
//             timer.cancel();
//           }
//         }
//       });
//     }

//     // Schedule the background task for periodic notifications
//     Workmanager().registerOneOffTask(
//       '1', // Task ID
//       'pomodoroTask',
//       inputData: {'remainingTime': '${controller.remainingTime.value}'},
//       initialDelay: Duration(minutes: 1), // Start the task after 1 minute
//     );
//   }

//   void pauseOrResumePomodoro() {
//     if (controller.countdownTimer != null &&
//         controller.countdownTimer!.isActive) {
//       controller.countdownTimer!.cancel();
//       controller.isPaused.toggle();
//     } else {
//       controller.countdownTimer = Timer.periodic(Duration(minutes: 1), (timer) {
//         if (!controller.isPaused.value) {
//           controller.remainingTime.value -= 1;
//           controller.notificationTime.value =
//               '${controller.remainingTime.value} minutes';

//           if (controller.remainingTime.value <= 0) {
//             // Pomodoro completed, show notification
//             scheduleNotification(
//                 'Pomodoro Complete', 'Take rest for 5 minutes');
//             timer.cancel();
//           }
//         }
//       });

//       controller.isPaused.toggle();
//     }
//   }

//   void resetPomodoro() {
//     if (controller.countdownTimer != null) {
//       controller.countdownTimer!.cancel();
//     }

//     // Cancel the background task
//     Workmanager().cancelByTag('pomodoroTask');

//     controller.remainingTime.value = 1; // Reset to initial time
//     controller.isPaused.value = false;
//     controller.notificationTime.value = '';
//   }
// }









// import 'dart:async';
// import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();

//   await AndroidAlarmManager.initialize();

//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Pomodoro Timer',
//       home: PomodoroScreen(),
//     );
//   }
// }

// class PomodoroController extends GetxController {
//   RxInt remainingTime = 1.obs; // Initial time in minutes
//   RxBool isPaused = false.obs;
//   Timer? countdownTimer;
// }

// class PomodoroScreen extends StatelessWidget {
//   final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//       FlutterLocalNotificationsPlugin();
//   final PomodoroController controller = PomodoroController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Pomodoro Timer'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Obx(() => Text(
//                   '${controller.remainingTime.value} minutes',
//                   style: TextStyle(fontSize: 24),
//                 )),
//             SizedBox(height: 20),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 ElevatedButton(
//                   onPressed: startPomodoro,
//                   child: Text('Start'),
//                 ),
//                 SizedBox(width: 10),
//                 ElevatedButton(
//                   onPressed: () => pauseOrResumePomodoro(),
//                   child: Text(controller.isPaused.value ? 'Resume' : 'Pause'),
//                 ),
//                 SizedBox(width: 10),
//                 ElevatedButton(
//                   onPressed: resetPomodoro,
//                   child: Text('Reset'),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Future<void> initializeNotifications() async {
//     const AndroidInitializationSettings initializationSettingsAndroid =
//         AndroidInitializationSettings('app_icon');
//     final InitializationSettings initializationSettings =
//         InitializationSettings(android: initializationSettingsAndroid);

//     await flutterLocalNotificationsPlugin.initialize(initializationSettings);
//   }

//   Future<void> scheduleNotification() async {
//     const AndroidNotificationDetails androidPlatformChannelSpecifics =
//         AndroidNotificationDetails(
//       'your_channel_id',
//       'your_channel_name',
//       importance: Importance.max,
//       priority: Priority.high,
//     );

//     const NotificationDetails platformChannelSpecifics =
//         NotificationDetails(android: androidPlatformChannelSpecifics);

//     await flutterLocalNotificationsPlugin.show(
//       0, // Notification ID
//       'Pomodoro Complete',
//       'Task completed! Take a break.',
//       platformChannelSpecifics,
//       payload: 'notification_payload',
//     );
//   }

//   void startPomodoro() {
//     if (controller.countdownTimer == null ||
//         controller.countdownTimer!.isActive) {
//       // If timer is not running or paused, start a new timer
//       controller.countdownTimer = Timer.periodic(Duration(minutes: 1), (timer) {
//         if (!controller.isPaused.value) {
//           controller.remainingTime.value -= 1;

//           if (controller.remainingTime.value <= 0) {
//             // Pomodoro completed, show notification
//             scheduleNotification();
//             timer.cancel();
//           }
//         }
//       });
//     }

//     // Schedule the background task for periodic notifications
//     AndroidAlarmManager.periodic(
//       Duration(minutes: 1), // Interval for periodic task
//       0, // ID for the periodic task
//       () async {
//         scheduleNotification();
//       },
//       startAt: DateTime.now(), // Start the task immediately
//       exact: true, // Ensure the exact interval
//       wakeup: true, // Enable the device to wake up for the task
//     );
//   }

//   void pauseOrResumePomodoro() {
//     if (controller.countdownTimer != null &&
//         controller.countdownTimer!.isActive) {
//       controller.countdownTimer!.cancel();
//       controller.isPaused.toggle();
//     } else {
//       controller.countdownTimer = Timer.periodic(Duration(minutes: 1), (timer) {
//         if (!controller.isPaused.value) {
//           controller.remainingTime.value -= 1;

//           if (controller.remainingTime.value <= 0) {
//             // Pomodoro completed, show notification
//             scheduleNotification();
//             timer.cancel();
//           }
//         }
//       });

//       controller.isPaused.toggle();
//     }
//   }

//   void resetPomodoro() {
//     if (controller.countdownTimer != null) {
//       controller.countdownTimer!.cancel();
//     }

//     // Cancel the periodic background task
//     AndroidAlarmManager.cancel(0);

//     controller.remainingTime.value = 5; // Reset to initial time
//     controller.isPaused.value = false;
//   }
// }















// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:percent_indicator/circular_percent_indicator.dart';

// void main() {
//   runApp(MyApp());
// }

// class TimerController extends GetxController {
//   RxInt breakTime = 1.obs;
//   RxBool isRunning = false.obs;
//   RxBool isWorking = true.obs;
//   RxDouble percent = 1.0.obs;
//   Timer? timer;
//   RxInt workTime = 1.obs;

//   void startPauseTimer() {
//     if (isRunning.value) {
//       pauseTimer();
//     } else {
//       startTimer();
//     }
//   }

//   void startTimer() {
//     isRunning.value = true;
//     int totalTime = (isWorking.value ? workTime.value : breakTime.value) * 60;
//     int totalTimeForBreak = breakTime.value * 60;

//     timer = Timer.periodic(Duration(seconds: 1), (timer) {
//       totalTime--;

//       if (totalTime <= 0) {
//         if (totalTimeForBreak <= 0) {
//           isWorking.value = !isWorking.value;
//           timer.cancel();
//           isRunning.value = false;
//           percent.value = 1.0;
//         } else {
//           totalTimeForBreak--;
//           percent.value = totalTimeForBreak / ((breakTime.value) * 60);
//         }
//       } else {
//         percent.value = totalTime /
//             ((isWorking.value ? workTime.value : breakTime.value) * 60);
//       }
//     });
//   }

//   void pauseTimer() {
//     isRunning.value = false;
//     timer?.cancel();
//   }

//   void resetTimer() {
//     isRunning.value = false;
//     percent.value = 1.0;
//     timer?.cancel();
//   }
// }

// class MyApp extends StatelessWidget {
//   final TimerController timerController = Get.put(TimerController());

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Pomodoro Timer'),
//         ),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Obx(() => Text(
//                     timerController.isWorking.value
//                         ? 'Work Time'
//                         : 'Break Time',
//                     style: TextStyle(fontSize: 24),
//                   )),
//               SizedBox(height: 20),
//               Obx(() => CircularPercentIndicator(
//                     radius: 200,
//                     lineWidth: 15,
//                     percent: timerController.percent.value,
//                     center: Text(
//                       '${(timerController.isWorking.value ? timerController.workTime.value : timerController.breakTime.value).toString().padLeft(2, '0')}:00',
//                       style: TextStyle(fontSize: 20),
//                     ),
//                     progressColor: Colors.blue,
//                   )),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: timerController.startPauseTimer,
//                 child:
//                     Text(timerController.isRunning.value ? 'Pause' : 'Start'),
//               ),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: timerController.resetTimer,
//                 child: Text('Reset'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }












// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Custom Minutes Picker'),
//         ),
//         body: Center(
//           child: MinutesPicker(),
//         ),
//       ),
//     );
//   }
// }

// class MinutesPicker extends StatefulWidget {
//   @override
//   _MinutesPickerState createState() => _MinutesPickerState();
// }

// class _MinutesPickerState extends State<MinutesPicker> {
//   int selectedMinutes = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         // Text(
//         //   '$selectedMinutes min',
//         //   style: TextStyle(fontSize: 24),
//         // ),
//         // SizedBox(height: 20),
//         Container(
//           height: 150,
//           child: CupertinoPicker(
//             itemExtent: 40,
//             onSelectedItemChanged: (index) {
//               setState(() {
//                 selectedMinutes = index;
//               });
//             },
//             children: List.generate(121, (index) {
//               return Center(
//                 child: Text(
//                   '$index  ${index == selectedMinutes ? 'min' : ""}',
//                   style: TextStyle(fontSize: 20),
//                 ),
//               );
//             }),
//           ),
//         ),
//       ],
//     );
//   }
// }



// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Custom Minutes Picker'),
//         ),
//         body: Center(
//           child: MinutesPicker(),
//         ),
//       ),
//     );
//   }
// }

// class MinutesPicker extends StatefulWidget {
//   @override
//   _MinutesPickerState createState() => _MinutesPickerState();
// }

// class _MinutesPickerState extends State<MinutesPicker> {
//   int selectedMinutes = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         SizedBox(height: 20),
//         Container(
//           height: 150,
//           child: CupertinoPicker(
//             itemExtent: 40,
//             onSelectedItemChanged: (index) {
//               setState(() {
//                 selectedMinutes = index;
//               });
//             },
//             children: List.generate(121, (index) {
//               return Center(
//                 child: Text(
//                   '$index ${index == selectedMinutes ? 'min' : ""}',
//                   style: TextStyle(fontSize: 20),
//                 ),
//               );
//             }),
//           ),
//         ),
//       ],
//     );
//   }
// }
