import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:schedule_app/core/controller/categoriesConroller.dart';
import 'package:schedule_app/ui/widgets/homePage.dart/categories.dart';

class Categories extends GetView<CategoriesCintrollerImp> {
  const Categories({
    super.key,
  });

/*
  "10": "Time Table",
  "11": "Pomodoro Technique",
  "12": "Tasks",
  "13": "Time Blocks",
  "14": "Hello",
  "15": "Have a great day",
*/
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CategoriesCintrollerImp>(
      init: CategoriesCintrollerImp(),
      builder: (c) {
        return Column(
          children: [
            Row(children: [
              GestureDetector(
                  onTap: () {
                    controller.onButtomChanged(0);
                  },
                  child: CategoryWidget(
                      width: 179, name: "10".tr, select: controller.timeTable)),
              SizedBox(width: 8.w),
              GestureDetector(
                  onTap: () {
                    controller.onButtomChanged(1);
                  },
                  child: CategoryWidget(
                      width: 171,
                      name: "11".tr,
                      select: controller.pomodoroTechnique)),
            ]),
            SizedBox(height: 8.h),
            Row(children: [
              GestureDetector(
                  onTap: () {
                    controller.onButtomChanged(2);
                  },
                  child: CategoryWidget(
                      width: 171, name: "12".tr, select: controller.tasks)),
              SizedBox(width: 8.w),
              GestureDetector(
                onTap: () {
                  controller.onButtomChanged(3);
                },
                child: CategoryWidget(
                    width: 179, name: "13".tr, select: controller.timeBlocks),
              ),
            ]),
          ],
        );
      },
    );
  }
}
