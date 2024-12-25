import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:schedule_app/components/customFloatingButtom.dart';
import 'package:schedule_app/core/constants/themeOfApp/fonts.dart';
import 'package:schedule_app/core/controller/pomodoroController.dart';
import 'package:schedule_app/routes/appRoutes.dart';

class PomodoroTechnique extends StatelessWidget {
  PomodoroTechnique({super.key});

  final pomodoroController = Get.find<ImpPomodoroController>();
  final ImpPomodoroController timerController =
      Get.find<ImpPomodoroController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Obx(() => Text(
          //       timerController.isWorking.value ? 'Work Time' : 'Break Time',
          //       style: TextStyle(fontSize: 24),
          //     )),
          SizedBox(height: 20),
          Obx(() => CircularPercentIndicator(
                radius: 113.0,
                lineWidth: 15.0,
                percent: timerController.seconds.value /
                    (timerController.isWorking.value
                        ? timerController.workTime.value * 60
                        : timerController.breakTime.value * 60),
                center: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${(timerController.seconds.value ~/ 60).toString().padLeft(2, '0')}:${(timerController.seconds.value % 60).toString().padLeft(2, '0')}',
                      style: TextStyleFonts.Medium28.copyWith(
                          color: Theme.of(context).colorScheme.onPrimary),
                    ),
                    Text(
                        !timerController.isWorking.value
                            ? '111'.tr +
                                ' ${timerController.workTime.value} ' +
                                '44'.tr
                            : '112'.tr +
                                ' ${timerController.breakTime.value} ' +
                                '44'.tr,
                        style: TextStyleFonts.BodyText.copyWith(
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimaryContainer
                                .withOpacity(0.7))),
                  ],
                ),
                progressColor: Colors.blue,
              )),

          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Spacer(
                flex: 2,
              ),
              Obx(() => IconButton(
                    onPressed: timerController.startPauseTimer,
                    icon: timerController.isRunning.value
                        ? Icon(
                            Icons.pause_circle_outline,
                            color: Theme.of(context).colorScheme.shadow,
                          )
                        : Icon(
                            Icons.play_circle_fill_outlined,
                            color: Theme.of(context).colorScheme.shadow,
                          ),
                  )),
              SizedBox(width: 32.w),
              // ElevatedButton(
              //   onPressed: timerController.resetTimer,
              //   child: Text('Reset'),
              // ),
              IconButton(
                  onPressed: timerController.resetTimer,
                  icon: Icon(
                    Icons.replay,
                    color: Theme.of(context).colorScheme.shadow,
                  )),
              Spacer(
                flex: 2,
              ),
            ],
          ),
          SizedBox(height: 48.h),
          CustomFloatingButtom(
            text: "113".tr,
            is_initializPage: false,
            press: () {
              Get.toNamed(AppRoute.EditPomodoro);
            },
          )
        ],
      ),
    );
    // return ListView.builder(
    //   itemCount: 40,
    //   physics: ScrollPhysics(),
    //   itemBuilder: (BuildContext context, int index) {
    //     return Container(
    //       height: 20,
    //       // width: 30,
    //       color: Colors.green,
    //       alignment: Alignment.center,
    //       child: Text(index.toString()),
    //       margin: EdgeInsetsDirectional.only(top: 20),
    //     );
    //   },
    // );
  }
}
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
// import 'package:percent_indicator/circular_percent_indicator.dart';
// import 'package:schedule_app/core/controller/pomodoroController.dart';

// class PomodoroTechnique extends StatelessWidget {
//   PomodoroTechnique({super.key});
//   final ImpPomodoroController timerController =
//       Get.put(ImpPomodoroController());

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Obx(() => Text(
//                 timerController.isWorking.value ? 'Work Time' : 'Break Time',
//                 style: TextStyle(fontSize: 24),
//               )),
//           SizedBox(height: 20),
//           Obx(() => Stack(
//                 alignment: Alignment.center,
//                 children: [
//                   // CircularProgressIndicator(
//                   //   value: timerController.seconds.value /
//                   //       (timerController.isWorking.value
//                   //           ? timerController.workTime.value * 60
//                   //           : timerController.breakTime.value * 60),
//                   //   color: Colors.blue,
//                   //   strokeWidth: 10,
//                   // ),
//                   Container(
//                       child: CircularPercentIndicator(
//                     radius: 120.0,
//                     lineWidth: 10.0,
//                     animation: true,
//                     //   percent: percent / 100,
//                     center: Text(
//                       "df",
//                       //percent.toString() + "%",
//                       style: TextStyle(
//                           fontSize: 20.0,
//                           fontWeight: FontWeight.w600,
//                           color: Colors.black),
//                     ),
//                     //  backgroundColor: Colors.grey[300],
//                     circularStrokeCap: CircularStrokeCap.round,
//                     progressColor: Colors.redAccent,
//                   )),

//                   Text(
//                     '${(timerController.seconds.value ~/ 60).toString().padLeft(2, '0')}:${(timerController.seconds.value % 60).toString().padLeft(2, '0')}',
//                     style: TextStyle(fontSize: 20),
//                   ),
//                 ],
//               )),
//           SizedBox(height: 100),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               Obx(() => ElevatedButton(
//                     onPressed: timerController.startPauseTimer,
//                     child: Text(
//                         timerController.isRunning.value ? 'Pause' : 'Start'),
//                   )),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: timerController.resetTimer,
//                 child: Text('Reset'),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//     // return ListView.builder(
//     //   itemCount: 40,
//     //   physics: ScrollPhysics(),
//     //   itemBuilder: (BuildContext context, int index) {
//     //     return Container(
//     //       height: 20,
//     //       // width: 30,
//     //       color: Colors.green,
//     //       alignment: Alignment.center,
//     //       child: Text(index.toString()),
//     //       margin: EdgeInsetsDirectional.only(top: 20),
//     //     );
//     //   },
//     // );
//   }
// }
