// ignore_for_file: deprecated_member_use, prefer_const_constructors, sort_child_properties_last
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:schedule_app/core/constants/keys.dart';
import 'package:schedule_app/core/controller/categoriesConroller.dart';
import 'package:schedule_app/core/controller/settingsController.dart';
import 'package:schedule_app/core/controller/sliderMenuController.dart';
import 'package:schedule_app/core/controller/timeTable/timeTableController.dart';
import 'package:schedule_app/core/services/services.dart';
import 'package:schedule_app/ui/screens/sliderMenuScreen.dart';
import 'package:schedule_app/ui/widgets/homePage.dart/customAppBarCategories.dart';
import 'package:schedule_app/ui/widgets/homePage.dart/translationPagesAndButtons.dart';
import 'package:schedule_app/ui/widgets/pomodoroTechnique/listOfPomodoroTechnique.dart';
import 'package:schedule_app/ui/widgets/tasks/ListOfTasks.dart';
import 'package:schedule_app/ui/widgets/timeBlocks/listOfTimeBlocks.dart';
import 'package:schedule_app/ui/widgets/timeTable/listOfTimeTable.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final categoryController = Get.find<CategoriesCintrollerImp>();

  final settingsController = Get.find<ImpSettingsController>();
  @override
  void initState() {
    super.initState();
    // print("language = > ${settingsController.lang}");
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: GetBuilder<CategoriesCintrollerImp>(
            init: CategoriesCintrollerImp(),
            builder: (_) {
              return Scaffold(
                  extendBodyBehindAppBar: true,
                  floatingActionButton: GetBuilder<ImpSliderMenuController>(
                      init: ImpSliderMenuController(),
                      builder: (animationController) {
                        return Transform.translate(
                            offset: Offset(
                                0,
                                SettingServices.instance.read(Keys.language) ==
                                        "en"
                                    ? 100 * animationController.animation.value
                                    : -100 *
                                        animationController.animation.value),
                            child: GetBuilder<ImpTimeTableController>(
                              init: ImpTimeTableController(),
                              builder: (controller) {
                                return Obx(() => translationPages(
                                    categoryController.result));
                              },
                            ));
                      }),
                  floatingActionButtonLocation:
                      SettingServices.instance.read(Keys.language) == "ar"
                          ? FloatingActionButtonLocation.startFloat
                          : FloatingActionButtonLocation.endFloat,
                  body: GetBuilder<ImpSliderMenuController>(
                    init: ImpSliderMenuController(),
                    builder: (SliderMenuController) {
                      return Stack(
                        children: [
                          AnimatedPositioned(
                            duration: Duration(milliseconds: 500),
                            curve: Curves.fastOutSlowIn,
                            width: Get.width,
                            height: Get.height,
                            left:
                                SettingServices.instance.read(Keys.language) ==
                                        'en'
                                    ? SliderMenuController.isSlideMenuClosed!
                                        ? -200.w
                                        : 0
                                    : null,
                            right:
                                SettingServices.instance.read(Keys.language) ==
                                        'ar'
                                    ? SliderMenuController.isSlideMenuClosed!
                                        ? -200.w
                                        : 0
                                    : null,
                            child: SliderMenu(
                              press: () {
                                SliderMenuController.animationController
                                    .reverse();
                                SliderMenuController.sliderMenu(true);
                              },
                            ),
                          ), //ImpSettingsController

                          Transform.translate(
                            offset: Offset(
                                SliderMenuController.animation.value * 200,
                                // settingsController.lang == 'ar'
                                //     ? SliderMenuController
                                //             .animation.value *
                                //         200
                                // : SliderMenuController
                                //         .animation.value *
                                //         -200,
                                // SettingServices.instance.read(Keys.language) == "ar"
                                //     ? SliderMenuController.animation.value *
                                //         200.w
                                //     : SliderMenuController.animation.value *
                                //         -200.w,
                                0),
                            child: Transform.scale(
                              scale: SliderMenuController.sacleAnimation.value,
                              child: ClipRRect(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        SliderMenuController
                                                    .isSlideMenuClosed ==
                                                true
                                            ? 0
                                            : 24),
                                    border: Border.all(
                                        color: Theme.of(context).cardColor,
                                        width: SliderMenuController
                                                    .isSlideMenuClosed ==
                                                true
                                            ? 1
                                            : 3),
                                  ),
                                  child: SizedBox(
                                    width: double.infinity,
                                    child: Column(
                                      children: [
                                        CustomAppBar(),
                                        Expanded(
                                          child: IndexedStack(
                                            index: categoryController.result,
                                            children: [
                                              TimeTableScreen(),
                                              PomodoroTechnique(),
                                              TaskScreen(),
                                              TimeBlockScreen(),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ));
            }));
  }
}
