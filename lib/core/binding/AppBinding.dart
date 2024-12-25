import 'package:get/get.dart';
import 'package:schedule_app/core/controller/ThemeController.dart';
import 'package:schedule_app/core/controller/categoriesConroller.dart';
import 'package:schedule_app/core/controller/connectionController.dart';
import 'package:schedule_app/core/controller/localizationController.dart';
import 'package:schedule_app/core/controller/onBoardingController.dart';
import 'package:schedule_app/core/controller/pomodoroController.dart';
import 'package:schedule_app/core/controller/settingsController.dart';
import 'package:schedule_app/core/controller/sliderMenuController.dart';
import 'package:schedule_app/core/controller/task/taskDatabaseController.dart';
import 'package:schedule_app/core/controller/task/taskController.dart';
import 'package:schedule_app/core/controller/timeBlocks/timeBlocksController.dart';
import 'package:schedule_app/core/controller/timeBlocks/timeBlocksDatabaseController.dart';
import 'package:schedule_app/core/controller/timeTable/timeTableController.dart';
import 'package:schedule_app/core/controller/timeTable/timeTableDatabaseController.dart';
import 'package:schedule_app/core/services/services.dart';

// Get.put(ThemeController(), permanent: true);
class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SettingServices(), fenix: true);
    Get.lazyPut(() => ImpMyLanguageController(), fenix: true);
    Get.lazyPut(() => ThemeController(), fenix: true);
    Get.lazyPut(() => OnBoardingCintrollerImp(), fenix: true);
    // Get.lazyPut(() => ImpNetworkController(), fenix: true);
    Get.put(CategoriesCintrollerImp(), permanent: true);
    Get.put(TaskDatabaseController());
    Get.put(ImpTimeBlocksDatabaseController(), permanent: true);
    Get.put(ImpTimeBlocksController());
    Get.put(ImpTaskController(), permanent: true);
    Get.lazyPut(() => ImpPomodoroController(), fenix: true);
    Get.put(ImpTimeTableController());
    Get.put(ImpTimeTableDatabaseController());
    Get.put(ImpSliderMenuController(), permanent: true);
    Get.put(ImpSettingsController());
  }
}
