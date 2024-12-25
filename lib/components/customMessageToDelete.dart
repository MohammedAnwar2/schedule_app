import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:schedule_app/core/constants/themeOfApp/fonts.dart';

Future<void> customShowCustomDialogToDelete({
  required BuildContext context,
  required String title,
  required String subTitle,
  required String nameButton1,
  required String nameButton2,
  required void Function()? onTapFun,
}) async {
  return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Theme.of(context).colorScheme.onSecondaryContainer,
          title: Text(
            title,
            style: TextStyleFonts.Bold18.copyWith(
                color: Theme.of(context).colorScheme.onPrimary),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  subTitle,
                  style: TextStyleFonts.Regular14.copyWith(
                      color: Theme.of(context).colorScheme.onPrimaryContainer),
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
                          color: Theme.of(context).colorScheme.primary)),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      nameButton1,
                      style: TextStyleFonts.CTAText.copyWith(
                          color: Theme.of(context).colorScheme.primary),
                    ),
                  ),
                ),
                Container(
                  height: 30.h,
                  width: 115.w,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                          color: Theme.of(context).colorScheme.primary)),
                  child: InkWell(
                    onTap: onTapFun,
                    child: Text(nameButton2,
                        style: TextStyleFonts.CTAText.copyWith(
                            color: Theme.of(context)
                                .colorScheme
                                .onSecondaryContainer)),
                  ),
                ),
              ],
            )
          ],
        );
      });
}
