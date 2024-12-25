// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:schedule_app/core/controller/task/taskDatabaseController.dart';

class CustomSilder extends StatelessWidget {
  CustomSilder({super.key});
  final controller = Get.find<TaskDatabaseController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 8.h,
      margin: EdgeInsetsDirectional.only(bottom: 5.h),
      padding: EdgeInsetsDirectional.symmetric(horizontal: 5.w),
      child: Obx(() => SliderTheme(
            child: Slider(
              value: controller.completedTasks.value.toDouble(),
              max: controller.continueTasks.length.toDouble(),
              min: 0,
              activeColor: Theme.of(context).colorScheme.secondary,
              inactiveColor: Theme.of(context).colorScheme.onSecondaryContainer,
              onChanged: (double value) {},
            ),
            data: SliderTheme.of(context).copyWith(
              trackShape: CustomTrackShape(),
              trackHeight: 8.h,
              thumbColor: Colors.transparent,
              thumbShape: RoundSliderThumbShape(
                  enabledThumbRadius:
                      controller.completedTasks.value.toDouble() != 0.0
                          ? 5.0.r
                          : 0.0),
            ),
          )),
    );
  }
}

class CustomTrackShape extends RoundedRectSliderTrackShape {
  @override
  Rect getPreferredRect({
    required RenderBox parentBox,
    Offset offset = Offset.zero,
    required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final trackHeight = sliderTheme.trackHeight;
    final trackLeft = offset.dx;
    final trackTop = offset.dy + (parentBox.size.height - trackHeight!) / 2;
    final trackWidth = parentBox.size.width / 1.01;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }
}

/*class DesignOfTask extends StatelessWidget {
  const DesignOfTask({super.key, this.taskName});
  final taskName;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(seconds: 1),
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 12.h),
      decoration: ShapeDecoration(
        color: const Color(0x9934B8DC),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 100,
            child: Text(
              taskName,
              style: TextStyle(
                color: const Color(0xFF373636),
                fontSize: 14.sp,
                fontFamily: 'Tajawal',
                fontWeight: FontWeight.w400,
                height: 0.11,
                letterSpacing: -0.14,
              ),
              overflow: TextOverflow.clip,
              maxLines: 3,
            ),
          ),
          Container(
            width: 24.w,
            height: 24.w,
            decoration: const ShapeDecoration(
              color: Color(0xFFFAFAFA),
              shape: OvalBorder(),
            ),
          ),
        ],
      ),
    );
  }
}
 */