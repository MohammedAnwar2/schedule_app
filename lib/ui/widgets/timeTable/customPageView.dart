// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schedule_app/core/controller/timeTable/timeTableController.dart';
import 'package:schedule_app/ui/widgets/timeTable/listView.dart';

class CustomPageView extends StatelessWidget {
  CustomPageView({super.key});

  //final Widget customWidget;
  final ImpTimeTableController timeTableController =
      Get.find<ImpTimeTableController>();

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      onPageChanged: (int nextPage) {
        timeTableController.onPageChanged(nextPage);
        // print(
        //     "قبل الضغط ${timeTableController.workDays[timeTableController.activePage!]}");
      },
      scrollBehavior: ScrollBehavior(),
      // itemCount: workFays.length, //number of workdays
      itemCount: timeTableController.workDays.length, //number of workdays
      controller: timeTableController.pageController,
      physics: ScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return ListVeiwData(
          index: index,
        );
      },
    );
  }
}
