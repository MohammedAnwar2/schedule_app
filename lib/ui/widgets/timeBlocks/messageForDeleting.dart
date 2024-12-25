import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:schedule_app/core/constants/themeOfApp/fonts.dart';
import 'package:schedule_app/core/controller/timeBlocks/timeBlocksController.dart';

Future<void> customShowCustomDialogToDeleteEvent({
  required BuildContext context,
  required String title,
  required void Function()? onTapFunDelete,
  required void Function()? onTapFunCancel,
}) async {
  return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return GetBuilder<ImpTimeBlocksController>(
            init: ImpTimeBlocksController(),
            builder: (timeBlockscontroller) {
              return AlertDialog(
                backgroundColor:
                    Theme.of(context).colorScheme.onSecondaryContainer,
                title: Text(
                  title,
                  style: TextStyleFonts.Bold18.copyWith(
                      color: Theme.of(context).colorScheme.onPrimary),
                ),
                content: SingleChildScrollView(
                  child: ListBody(
                    children: <Widget>[
                      Text(
                        timeBlockscontroller.changeDeletingMessage[0].tr,
                        style: TextStyleFonts.Regular14.copyWith(
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimaryContainer),
                      ),
                    ],
                  ),
                ),
                actions: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 30.h,
                        width: 115.w,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                                color: timeBlockscontroller
                                    .changeColorDeletingMessage[0])),
                        //color: Theme.of(context).colorScheme.error)),
                        child: InkWell(
                          onTap: onTapFunCancel,
                          child: Text(
                            timeBlockscontroller.changeDeletingMessage[1].tr,
                            style: TextStyleFonts.CTAText.copyWith(
                                color: timeBlockscontroller
                                    .changeColorDeletingMessage[0]),
                            //color: Theme.of(context).colorScheme.error),
                          ),
                        ),
                      ),
                      Container(
                        height: 30.h,
                        width: 115.w,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: timeBlockscontroller
                                .changeColorDeletingMessage[1],
                            //color: Theme.of(context).colorScheme.error,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                                color: timeBlockscontroller
                                    .changeColorDeletingMessage[1])),
                        //color: Theme.of(context).colorScheme.error)),
                        child: InkWell(
                          onTap: onTapFunDelete,
                          child: Text(
                              timeBlockscontroller.changeDeletingMessage[2].tr,
                              style: TextStyleFonts.CTAText.copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSecondaryContainer)),
                        ),
                      ), //Today
                    ],
                  )
                ],
              );
            });
      });
}
