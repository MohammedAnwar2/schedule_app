// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DesignOfTask extends StatelessWidget {
  const DesignOfTask({
    super.key,
    required this.taskName,
    required this.color,
    required this.check,
    required this.onTapFun,
    required this.ckeckbox,
    // required this.time
  });

  final bool check;
  final void Function() ckeckbox;
  final Color color;
  // final String time;
  final void Function() onTapFun;

  final String taskName;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      child: ListTile(
        onTap: onTapFun,
        contentPadding:
            EdgeInsets.only(left: 8.0, right: 8.0, bottom: 0, top: 0),
        title: RichText(
          text: TextSpan(
            children: <TextSpan>[
              TextSpan(
                text: taskName.toString(),
                style: TextStyle(
                  //fontFamily: "Tajawal-Regular",
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  decoration: check == true
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                ).copyWith(color: Theme.of(context).colorScheme.onPrimary),
              ),
            ],
          ),
        ),
        trailing: TextButton(
          onPressed: ckeckbox,
          style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
              minimumSize: const Size(25, 50),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              alignment: Alignment.centerLeft),
          child: Container(
            width: 24.w,
            height: 24.w,
            decoration: ShapeDecoration(
              color: check == false
                  ? Theme.of(context).colorScheme.background
                  : Theme.of(context).colorScheme.secondary,
              shape: const OvalBorder(),
            ),
            child: check == true
                ? Icon(Icons.check, color: Theme.of(context).cardColor)
                : Container(),
          ),
        ),
      ),
    );
  }
}
