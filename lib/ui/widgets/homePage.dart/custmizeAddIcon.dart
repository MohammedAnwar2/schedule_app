import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:schedule_app/core/controller/categoriesConroller.dart';
import 'package:schedule_app/ui/widgets/homePage.dart/switchAddIcon.dart';

class CustomizeAddIcons extends StatelessWidget {
  CustomizeAddIcons({super.key});

  final categoryController = Get.find<CategoriesCintrollerImp>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        currentAddButton(categoryController.result);
      },
      child: Container(
        height: 48.w,
        width: 48.w,
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.background,
            borderRadius: BorderRadius.all(Radius.circular(100.w)),
            border: Border.all(
                color: Theme.of(context).colorScheme.primary, width: 3.5)),
        child: Icon(
          Icons.add,
          color: Theme.of(context).colorScheme.primary,
          size: 25,
        ),
      ),
    );
  }
}
