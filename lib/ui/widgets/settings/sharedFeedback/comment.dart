import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Comment extends StatelessWidget {
  const Comment({Key? key, required this.controller, required this.focusNode})
      : super(key: key);
  final TextEditingController controller;
  final FocusNode focusNode;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.symmetric(horizontal: 16.w),
      margin: EdgeInsetsDirectional.symmetric(horizontal: 16.w),
      width: Get.width,
      height: 208.h,
      decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).cardColor),
          borderRadius: BorderRadius.circular(8)),
      child: TextFormField(
        validator: (value) {
          if (value!.length == 0) {
            return "86".tr;
          } else {
            return null;
          }
        },
        textInputAction: TextInputAction.done,
        controller: controller,
        focusNode: focusNode,
        decoration:
            InputDecoration(hintText: "131".tr, border: InputBorder.none),
        maxLines: 10,
      ),
    );
  }
}
