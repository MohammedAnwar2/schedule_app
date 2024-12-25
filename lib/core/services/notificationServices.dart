// ignore_for_file: avoid_print, unused_element
import 'dart:async';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:rxdart/rxdart.dart';
import 'package:schedule_app/data/models/taskModel.dart';
import 'package:schedule_app/data/models/timeBlocksModel.dart';
import 'package:schedule_app/data/models/timeTableModel.dart';
import 'package:schedule_app/routes/appRoutes.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:flutter_timezone/flutter_timezone.dart';

// Future<String> _downloadAndSaveFile(String url, String fileName) async {
//   final Directory directory = await getApplicationDocumentsDirectory();
//   final String filePath = '${directory.path}/$fileName';
//   final http.Response response = await http.get(Uri.parse(url));
//   final File file = File(filePath);
//   await file.writeAsBytes(response.bodyBytes);
//   return filePath;
// }
class LocalNotifications {
  static final onClickNotification = BehaviorSubject<String>();

  static final FlutterLocalNotificationsPlugin
      _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  // on tap on any notification
  static void onNotificationTap(NotificationResponse notificationResponse) {
    onClickNotification.add(notificationResponse.payload!);
  }

  // initialize the local notifications
  static Future init() async {
    //tz.initializeTimeZones();
    _configureLocalTimezone();
    listenToNotifications();
    const AndroidInitializationSettings initializationSettingsAndroid =
        //   AndroidInitializationSettings('@mipmap/ic_launcher');
        AndroidInitializationSettings('@drawable/icon2');

    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
    );
    _flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse: onNotificationTap,
        onDidReceiveBackgroundNotificationResponse: onNotificationTap);
  }

  //show simple notifications
  static Future showSimpleNotification({
    required String title,
    required String body,
    required String payload,
    required int id,
  }) async {
    //String bigPicturePath = await _downloadAndSaveFile('https://dummyimage.com/600x200', 'bigPicture.jpg');
    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
      'channel 4',
      "Pomodoro Technique",
      channelDescription: 'your channel description',
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'ticker',
      fullScreenIntent: true,
      sound: RawResourceAndroidNotificationSound('simple_notification_sound'),
      playSound: true,
      enableVibration: true,
      enableLights: true,
      autoCancel: true,

/*            styleInformation: BigPictureStyleInformation(
              FilePathAndroidBitmap(), // Replace 'your_big_picture_image' with the actual image resource name
            contentTitle: 'Big Picture Notification Title',
            summaryText: 'Summary text for the big picture notification',
          ),*/
    );
    NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);
    await _flutterLocalNotificationsPlugin
        .show(id, title, body, notificationDetails, payload: payload);
  }

  //
  //show Periodic notifications at regular interval
  static Future showPeriodicNotification({
    required String title,
    required String body,
    required String payload,
  }) async {
    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails('17', '123',
            channelDescription: 'your channedsdl description',
            importance: Importance.max,
            priority: Priority.high,
            ticker: 'ticker',
            fullScreenIntent: true,
            sound: RawResourceAndroidNotificationSound(
                'simple_notification_sound'),
            playSound: true,
            enableVibration: true,
            enableLights: true,
            autoCancel: true);
    const NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);
    await _flutterLocalNotificationsPlugin.periodicallyShow(
        1, title, body, RepeatInterval.weekly, notificationDetails,
        payload: payload);
  }

//to schedule a local notifications
  static Future showScheduleNotificationForTimeBlocks(
      {required TimeBlocks timeBlock,
      required int month,
      required int day,
      required int hour,
      required int minutes}) async {
    // print("successfully \n\n\n123");
    await _flutterLocalNotificationsPlugin.zonedSchedule(
        timeBlock.id!.toInt() + 111111, //id+111111
        "TimeBlocks",
        timeBlock.title,
        _convertTime(hour: hour, minutes: minutes, day: day, month: month),
        //tz.TZDateTime.now(tz.local).add(const Duration(seconds: 5)),
        const NotificationDetails(
            android: AndroidNotificationDetails('channel 1', 'TimeBlocks',
                channelDescription: 'your channel description',
                importance: Importance.max,
                priority: Priority.high,
                ticker: 'ticker',
                fullScreenIntent: true,
                sound: RawResourceAndroidNotificationSound('channel_1'),
                playSound: true,
                enableVibration: true,
                enableLights: true,
                autoCancel: true)),
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
        matchDateTimeComponents: DateTimeComponents.dateAndTime,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        payload: "TimeBlocks");
  }

//to schedule a local notifications
  static Future showScheduleNotificationForTask({
    required Task task,
    required int minutes,
    required int hour,
  }) async {
    await _flutterLocalNotificationsPlugin.zonedSchedule(
        task.id!.toInt() + 444444, //id+444444
        "مهمه",
        task.title,
        _convertTime(hour: hour, minutes: minutes),

        //tz.TZDateTime.now(tz.local).add(const Duration(seconds: 5)),
        const NotificationDetails(
            android: AndroidNotificationDetails('channel 2', 'Tasks',
                channelDescription: 'your channel description',
                importance: Importance.max,
                priority: Priority.high,
                ticker: 'ticker',
                fullScreenIntent: true,
                sound: RawResourceAndroidNotificationSound('channel_2'),
                playSound: true,
                enableVibration: true,
                enableLights: true,
                autoCancel: true)),
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
        matchDateTimeComponents: DateTimeComponents.dateAndTime,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        payload: "Tasks");
  }

//to schedule a local notifications
  static Future showScheduleNotificationForTimeTable(
      {required TimeTable timeTable,
      required int minutes,
      required int hour,
      required List<int> days}) async {
    // print("حان موعد حصه --------------------------------");
    await _flutterLocalNotificationsPlugin.zonedSchedule(
        timeTable.id!.toInt() + 888888, //id+888888
        "حان موعد حصه ",
        timeTable.subject,
        _convertTimeOfTimeTable(hour: hour, minutes: minutes, days: days),
        //tz.TZDateTime.now(tz.local).add(const Duration(seconds: 5)),
        const NotificationDetails(
            android: AndroidNotificationDetails('channel 3', 'TimeTable',
                channelDescription: 'your channel description',
                importance: Importance.max,
                priority: Priority.high,
                ticker: 'ticker',
                fullScreenIntent: true,
                sound: RawResourceAndroidNotificationSound('channel_3'),
                playSound: true,
                enableVibration: true,
                enableLights: true,
                autoCancel: true)),
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
        matchDateTimeComponents: DateTimeComponents.dayOfWeekAndTime,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        payload: "TimeTable");
  }

  //close a specific notifications
  static Future cancelSpecific(int id) async {
    print(
        "cancelling channel notifications\n\n\n\n\n\n\n\n\ncancelling channel notifications");
    await _flutterLocalNotificationsPlugin.cancel(id);
  }

  //close all periodic channels notifications
  static Future cancelAllChannel() async {
    print(
        "cancelling all channel notifications\n\n\n\n\n\n\n\n\ncancelling all channel notifications");
    await _flutterLocalNotificationsPlugin.cancelAll();
  }

  //to listen to any notification clicked or not
  //call it in services class
  static listenToNotifications() {
    print("Listening to notifications");
    LocalNotifications.onClickNotification.stream.listen((event) {
      // if (event == "1") {
      //   Get.toNamed(AppRoute.Settings, arguments: event);
      // }
      // if (event == "2") {
      //   Get.toNamed(AppRoute.InitailPage, arguments: event);
      // }
    });
  }

  // static void startPomodoro({
  //   required String title,
  //   required String body,
  //   required String payload,
  //   required int id,
  // }) {
  //   // Schedule the background task to notify even if the app is closed
  //   AndroidAlarmManager.oneShot(
  //     Duration(seconds: 5), // Set the interval for your Pomodoro timer
  //     0, // ID for the background task
  //     () {
  //       // Pomodoro completed, show notification
  //       showSimpleNotification(
  //           title: title, body: body, payload: payload, id: id);
  //     },
  //   );
  // }

  static tz.TZDateTime _convertTime(
      {required int hour, required int minutes, int? month, int? day}) {
    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
    tz.TZDateTime scheduleDate = tz.TZDateTime(
        tz.local, now.year, month ?? now.month, day ?? now.day, hour, minutes);
    // if (scheduleDate.isBefore(now)) {
    //   //لو الوقت قد عبر , تبغى الامر بعد كم يتحقق
    //   scheduleDate = scheduleDate.add(const Duration(days: 7));
    // }
    return scheduleDate;
  }

  static tz.TZDateTime _convertTimeOfTimeTable(
      {required int hour, required int minutes, required List<int> days}) {
    // final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
    // tz.TZDateTime scheduleDate =
    //     tz.TZDateTime(tz.local, now.year, now.month, now.day, hour, minutes);
    // // if (scheduleDate.isBefore(now)) {
    // //   //لو الوقت قد عبر , تبغى الامر بعد كم يتحقق
    // //   scheduleDate = scheduleDate.add(const Duration(days: 7));
    // // }
    // return scheduleDate;
    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
    tz.TZDateTime scheduleDate =
        tz.TZDateTime(tz.local, now.year, now.month, now.day, hour, minutes);
    while (!days.contains(scheduleDate.weekday)) {
      // العثور على اليوم التالي من الأيام المحددة
      scheduleDate = scheduleDate.add(Duration(days: 1));
    }
    if (scheduleDate.isBefore(now)) {
      //لو الوقت قد عبر , تبغى الامر بعد كم يتحقق
      scheduleDate = scheduleDate.add(const Duration(days: 7));
    }
    return scheduleDate;
  }

  //================================================================
  // static tz.TZDateTime _convertTime(int hour, int minutes) {
  //   final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
  //   tz.TZDateTime scheduleDate =
  //       tz.TZDateTime(tz.local, now.year, now.month, now.day, hour, minutes);
  //   if (scheduleDate.isBefore(now)) {
  //     //لو الوقت قد عبر , تبغى الامر بعد كم يتحقق
  //     //  scheduleDate = scheduleDate.add(const Duration(days: 1));
  //   }
  //   return scheduleDate;
  // }
  //==================================================================

  // static tz.TZDateTime _nextInstanceOfTenAM() {
  //   final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
  //   tz.TZDateTime scheduledDate =
  //       tz.TZDateTime(tz.local, now.year, now.month, now.day, now.hour);
  //   if (scheduledDate.isBefore(now)) {
  //     scheduledDate = scheduledDate.add(const Duration(days: 1));
  //   }
  //   return scheduledDate;
  // }

  static Future<void> _configureLocalTimezone() async {
    tz.initializeTimeZones();
    //final String? timeZoneName = await FlutterNativeTimezone.getLocalTimezone()
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    // print(
    //     "|||||||||||||||||||||  $currentTimeZone    |||||||||||||||||||||||||");
    tz.setLocalLocation(tz.getLocation(currentTimeZone));
  }
}
