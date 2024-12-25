// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:schedule_app/components/customFloatingButtom.dart';
import 'package:schedule_app/core/constants/themeOfApp/colorConstants.dart';
import 'package:schedule_app/core/controller/timeBlocks/timeBlocksController.dart';
import 'package:schedule_app/core/controller/timeBlocks/timeBlocksDatabaseController.dart';
import 'package:schedule_app/data/database/configrationsDatabase.dart';
import 'package:schedule_app/data/models/timeBlocksModel.dart';
import 'package:schedule_app/routes/appRoutes.dart';
import 'package:schedule_app/ui/widgets/timeBlocks/initPage.dart';
import 'package:schedule_app/ui/widgets/timeBlocks/selectDay.dart';
import 'package:schedule_app/ui/widgets/timeBlocks/timeBlocksDesign.dart';
import 'package:schedule_app/ui/widgets/timeBlocks/timeTableNotification.dart';

class TimeBlockScreen extends StatefulWidget {
  TimeBlockScreen({super.key});

  @override
  State<TimeBlockScreen> createState() => _TimeBlockScreenState();
}

class _TimeBlockScreenState extends State<TimeBlockScreen> {
  SQLite sq = SQLite();
  final timeBlocksController = Get.find<ImpTimeBlocksController>();
  final timeBlocksDatabaseController =
      Get.find<ImpTimeBlocksDatabaseController>();

  @override
  void initState() {
    super.initState();
    timeBlocksDatabaseController.fetchTimeBlocks();
    // sq.MydeleteDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Column(
          children: [
            SelectDay(),
            timeBlocksDatabaseController.timeBlocks.length != 0
                ? Expanded(
                    child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    child: ListView.builder(
                      padding:
                          EdgeInsetsDirectional.only(bottom: 80.h, top: 15.h),
                      physics: BouncingScrollPhysics(),
                      itemCount: timeBlocksDatabaseController.timeBlocks.length,
                      itemBuilder: (BuildContext context, int index) {
                        TimeBlocks timeBlocks =
                            timeBlocksDatabaseController.timeBlocks[index];
                        notificationOfTimeBlocks(timeBlocks);
                        return GetBuilder<ImpTimeBlocksController>(
                            //
                            init: ImpTimeBlocksController(),
                            builder: (_) {
                              return timeBlocksController.day!["day"] ==
                                          timeBlocks.nameOfDay &&
                                      timeBlocksController.day!["date"] ==
                                          timeBlocks.numberOfDay
                                  ? Padding(
                                      padding: EdgeInsets.only(bottom: 2.h),
                                      child: GestureDetector(
                                        onTap: () {
                                          // timeBlocksController
                                          //     .resetAllTheValues();
                                          timeBlocksDatabaseController
                                              .fetchTimeBlocksForEdit(
                                                  nameOfCategory:
                                                      timeBlocks.category);
                                          Get.toNamed(AppRoute.EditTimeBlocks,
                                              arguments: timeBlocks);
                                        },
                                        child: CustomCardOfTimeBlocks(
                                          title: timeBlocks.title!,
                                          startTime: timeBlocks.start_time!,
                                          endTime: timeBlocks.end_time!,
                                          differenceBetweenTimes:
                                              timeBlocks.end_time!,
                                          color: colors[timeBlocks.color == 7
                                              ? 0
                                              : timeBlocks.color!],
                                        ),
                                      ),
                                    )
                                  : Container();
                            });
                      },
                    ),
                  ))
                : Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TimeBlockInitPage(),
                        Spacer(),
                        timeBlocksDatabaseController.timeBlocks.length == 0
                            ? CustomFloatingButtom(
                                text: "121".tr,
                                is_initializPage: true,
                                press: () {
                                  timeBlocksController.resetAllTheValues();
                                  Get.toNamed(AppRoute.AddTimeBlocks);
                                },
                              )
                            : Container(),
                        SizedBox(
                          height: 22.h,
                        )
                      ],
                    ),
                  )
          ],
        ));
  }
}
// // ignore_for_file: unused_local_variable

// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:schedule_app/components/customFloatingButtom.dart';
// import 'package:schedule_app/core/constants/themeOfApp/colorConstants.dart';
// import 'package:schedule_app/core/controller/timeBlocks/timeBlocksController.dart';
// import 'package:schedule_app/core/controller/timeBlocks/timeBlocksDatabaseController.dart';
// import 'package:schedule_app/data/database/configrationsDatabase.dart';
// import 'package:schedule_app/data/models/timeBlocksModel.dart';
// import 'package:schedule_app/routes/appRoutes.dart';
// import 'package:schedule_app/ui/widgets/timeBlocks/initPage.dart';
// import 'package:schedule_app/ui/widgets/timeBlocks/selectDay.dart';
// import 'package:schedule_app/ui/widgets/timeBlocks/timeBlocksDesign.dart';

// class TimeBlockScreen extends StatefulWidget {
//   TimeBlockScreen({super.key});

//   @override
//   State<TimeBlockScreen> createState() => _TimeBlockScreenState();
// }

// class _TimeBlockScreenState extends State<TimeBlockScreen> {
//   SQLite sq = SQLite();
//   final timeBlocksController = Get.find<ImpTimeBlocksController>();
//   final timeBlocksDatabaseController =
//       Get.find<ImpTimeBlocksDatabaseController>();

//   @override
//   void initState() {
//     super.initState();
//     timeBlocksDatabaseController.fetchTimeBlocks();
//     //sq.MydeleteDatabase();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         SelectDay(),
//         timeBlocksDatabaseController.timeBlocks.length != 0
//             ? Expanded(
//                 child: Obx(() {
//                   // try {
//                   return Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 8.w),
//                     child: ListView.builder(
//                       padding:
//                           EdgeInsetsDirectional.only(bottom: 80.h, top: 15.h),
//                       physics: BouncingScrollPhysics(),
//                       itemCount: timeBlocksDatabaseController.timeBlocks.length,
//                       itemBuilder: (BuildContext context, int index) {
//                         TimeBlocks timeBlocks =
//                             timeBlocksDatabaseController.timeBlocks[index];

//                         return GetBuilder<ImpTimeBlocksController>(
//                             //
//                             init: ImpTimeBlocksController(),
//                             builder: (_) {
//                               return timeBlocksController.day!["day"] ==
//                                           timeBlocks.nameOfDay &&
//                                       timeBlocksController.day!["date"] ==
//                                           timeBlocks.numberOfDay
//                                   ? Padding(
//                                       padding: EdgeInsets.only(bottom: 2.h),
//                                       child: GestureDetector(
//                                         onTap: () {
//                                           timeBlocksController
//                                               .resetAllTheValues();
//                                           timeBlocksDatabaseController
//                                               .fetchTimeBlocksForEdit(
//                                                   nameOfCategory:
//                                                       timeBlocks.category);
//                                           Get.toNamed(AppRoute.EditTimeBlocks,
//                                               arguments: timeBlocks);
//                                         },
//                                         child: CustomCardOfTimeBlocks(
//                                           title: timeBlocks.title!,
//                                           startTime: timeBlocks.start_time!,
//                                           endTime: timeBlocks.end_time!,
//                                           differenceBetweenTimes:
//                                               timeBlocks.end_time!,
//                                           color: colors[timeBlocks.color == 7
//                                               ? 0
//                                               : timeBlocks.color!],
//                                         ),
//                                       ),
//                                     )
//                                   : Container();
//                             });
//                       },
//                     ),
//                   );
//                   // } catch (e) {
//                   //   print("-----------------  error ---------------\n");
//                   //   print(e);
//                   //   return Container();
//                   // }
//                 }),
//               )
//             : Obx(() => Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     TimeBlockInitPage(),
//                     // Spacer(),
//                     timeBlocksDatabaseController.timeBlocks.length == 0
//                         ? CustomFloatingButtom(
//                             text: "Add time blocks",
//                             is_initializPage: true,
//                             press: () {
//                               Get.toNamed(AppRoute.AddTimeBlocks);
//                             },
//                           )
//                         : Container(),
//                     SizedBox(
//                       height: 22.h,
//                     )
//                   ],
//                 )),
//       ],
//     );
//   }
// }
