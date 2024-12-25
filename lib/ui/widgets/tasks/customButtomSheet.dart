// ignore_for_file: deprecated_member_use, prefer_const_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:schedule_app/core/constants/themeOfApp/fonts.dart';
import 'package:schedule_app/core/controller/task/taskController.dart';
import 'package:schedule_app/ui/widgets/tasks/customListTile.dart';

class CustomShowButtomSheet extends GetView<ImpTaskController> {
  const CustomShowButtomSheet({super.key});

  Future<dynamic> CustomShowModelBottomSheet(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            height: 274.h,
            width: double.infinity,
            padding: EdgeInsetsDirectional.only(
              start: 16.w,
              end: 16.w,
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onSecondaryContainer,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            ),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Center(
                child: Container(
                  margin: EdgeInsetsDirectional.only(top: 4.h),
                  height: 4.h,
                  width: 60.w,
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              Text("92".tr,
                  style: TextStyleFonts.CTAText.apply(
                    color: Theme.of(context).colorScheme.onPrimary,
                  )),
              //SizedBox(height: 8.h),
              Divider(
                color: Theme.of(context).hintColor,
                thickness: 1,
              ),
              // SizedBox(height: 15.h),

              GetBuilder<ImpTaskController>(
                init: ImpTaskController(),
                builder: (controller) {
                  return CustomListTile(
                    name: "95".tr,
                    check: controller.veryImportant,
                    resetStateFun: () {
                      controller.onButtomChange(0);
                    },
                  );
                },
              ),
              GetBuilder<ImpTaskController>(
                init: ImpTaskController(),
                builder: (controller) {
                  return CustomListTile(
                    name: "96".tr,
                    check: controller.important,
                    resetStateFun: () {
                      controller.onButtomChange(1);
                    },
                  );
                },
              ),
              GetBuilder<ImpTaskController>(
                init: ImpTaskController(),
                builder: (controller) {
                  return CustomListTile(
                    name: "97".tr,
                    check: controller.notImportant,
                    resetStateFun: () {
                      controller.onButtomChange(2);
                    },
                  );
                },
              ),
              SizedBox(
                height: 24.h,
              ),
              GestureDetector(
                onTap: () {
                  Get.back();
                  controller.changeTheClassification(
                      controller.resultOfClssificationIndex);
                },
                child: Center(
                  child: Container(
                    width: 290.w,
                    height: 48.h,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Text("Done",
                        style: TextStyleFonts.CTAText.apply(
                            color: Theme.of(context).cardColor)),
                  ),
                ),
              )
            ]),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.onButtomSheetStart(controller.selectClassification);
        CustomShowModelBottomSheet(context);
      },
      child: Container(
        padding: EdgeInsetsDirectional.only(start: 8.w, end: 16.w),
        width: double.infinity,
        height: 50.h,
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          GetBuilder<ImpTaskController>(
            init: ImpTaskController(),
            builder: (_) {
              return Text(
                "${controller.selectClassification}".tr,
                style: TextStyleFonts.BodyText.apply(
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              );
            },
          ),
          SvgPicture.asset("assets/icons/Alt Arrow Left.svg",
              color: Theme.of(context).colorScheme.shadow)
        ]),
      ),
    );
  }
}
