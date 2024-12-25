// ignore_for_file: prefer_const_constructors

import 'package:get/get.dart';
import 'package:schedule_app/routes/appRoutes.dart';
import 'package:schedule_app/ui/screens/aboutUs.dart';
import 'package:schedule_app/ui/screens/notification.dart';
import 'package:schedule_app/ui/screens/settings.dart';
import 'package:schedule_app/ui/widgets/settings/sharedFeedback/shareFeedback.dart';
import 'package:schedule_app/ui/screens/sliderMenuScreen.dart';
import 'package:schedule_app/ui/widgets/tasks/add_edit_tasks_screens/addTasks.dart';
import 'package:schedule_app/ui/widgets/tasks/add_edit_tasks_screens/editTasks.dart';
import 'package:schedule_app/ui/widgets/timeBlocks/add_edit_timeBlocks_screens/addTimeBlocks.dart';
import 'package:schedule_app/ui/widgets/timeBlocks/add_edit_timeBlocks_screens/editTimeBlocks.dart';
import 'package:schedule_app/ui/screens/homePage.dart';
import 'package:schedule_app/ui/screens/initailPage.dart';
import 'package:schedule_app/ui/screens/onboarding.dart';
import 'package:schedule_app/ui/screens/splashScreen.dart';
import 'package:schedule_app/ui/widgets/pomodoroTechnique/editPage.dart';
import 'package:schedule_app/ui/widgets/pomodoroTechnique/listOfPomodoroTechnique.dart';
import 'package:schedule_app/ui/widgets/timeTable/add_edit/addTimeTable.dart';
import 'package:schedule_app/ui/widgets/timeTable/add_edit/editTimeTable.dart';

List<GetPage<dynamic>> route = [
  GetPage(
      name: AppRoute.Onboarding,
      page: () => Onboarding(),
      transition: Transition.fade),
  GetPage(
      name: AppRoute.InitailPage,
      page: () => InitailPage(),
      transition: Transition.fade),
  GetPage(
      name: AppRoute.HomePage,
      page: () => HomePage(),
      transition: Transition.fade),
  GetPage(
      name: AppRoute.SplashScreen,
      page: () => SplashScreen(),
      transition: Transition.fade),
  GetPage(
      name: AppRoute.AddTask,
      page: () => AddTask(),
      transition: Transition.fade),
  GetPage(
      name: AppRoute.AddTimeBlocks,
      page: () => AddTimeBlocks(),
      transition: Transition.fade),
  GetPage(
      name: AppRoute.EditTimeBlocks,
      page: () => EditTimeBlocks(),
      transition: Transition.fade),
  GetPage(
      name: AppRoute.EditTask,
      page: () => EditTask(),
      transition: Transition.fade),
  GetPage(
      name: AppRoute.EditPomodoro,
      page: () => EditPomodoro(),
      transition: Transition.fade),
  GetPage(
      name: AppRoute.PomodoroTechnique,
      page: () => PomodoroTechnique(),
      transition: Transition.fade),
  GetPage(
      name: AppRoute.AddTimeTable,
      page: () => AddTimeTable(),
      transition: Transition.fade),
  GetPage(
      name: AppRoute.EditTimeTable,
      page: () => EditTimeTable(),
      transition: Transition.fade),
  GetPage(
      name: AppRoute.AbouteUs,
      page: () => AbouteUs(),
      transition: Transition.fade),
  GetPage(
      name: AppRoute.Settings,
      page: () => Settings(),
      transition: Transition.fade),
  GetPage(
      name: AppRoute.NotificationScreen,
      page: () => NotificationScreen(),
      transition: Transition.fade),
];
