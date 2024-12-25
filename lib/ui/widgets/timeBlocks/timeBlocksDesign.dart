import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:schedule_app/components/time_functions.dart';
import 'package:schedule_app/core/constants/themeOfApp/fonts.dart';
import 'package:schedule_app/core/controller/settingsController.dart';

class CustomCardOfTimeBlocks extends StatelessWidget {
  CustomCardOfTimeBlocks(
      {super.key,
      required this.title,
      required this.startTime,
      required this.endTime,
      required this.differenceBetweenTimes,
      required this.color});

  final Color color;
  final String differenceBetweenTimes;
  final String endTime;
  final String startTime;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      child: ListTile(
        contentPadding:
            EdgeInsets.only(left: 10.0, right: 10.0, bottom: 0, top: 0),
        title: Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                    text: title,
                    style: TextStyleFonts.BodyText.apply(
                        color: Theme.of(context).colorScheme.onPrimary)),
              ],
            ),
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 8),
          child: Row(
            children: [
              GetBuilder<ImpSettingsController>(
                init: ImpSettingsController(),
                builder: (controller) {
                  return Text(
                    controller.switchStateOf24hr == true
                        ? convertTo24HourFormat_forTimeBlocks(
                            DateFormat('h:mm a').format(
                                convertTimeStringToDateTime_MMMD(startTime)))
                        : DateFormat('h:mm a').format(
                            convertTimeStringToDateTime_MMMD(startTime)),
                    style: TextStyleFonts.BodyText.copyWith(
                        color:
                            Theme.of(context).colorScheme.onPrimaryContainer),
                  );
                },
              ),
              Text(" - ",
                  style: TextStyleFonts.BodyText.apply(
                      color: Theme.of(context).colorScheme.onPrimaryContainer)),
              GetBuilder<ImpSettingsController>(
                init: ImpSettingsController(),
                builder: (controller) {
                  return Text(
                      controller.switchStateOf24hr == true
                          ? convertTo24HourFormat_forTimeBlocks(addTimes(
                              convertTimeStringToDateTime_MMMD(startTime),
                              convertTimeStringToDateTime_MMMD(endTime)))
                          : addTimes(
                              convertTimeStringToDateTime_MMMD(startTime),
                              convertTimeStringToDateTime_MMMD(endTime)),
                      style: TextStyleFonts.BodyText.apply(
                          color: Theme.of(context)
                              .colorScheme
                              .onPrimaryContainer));
                },
              ),
            ],
          ),
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
                formatTime(
                    convertTimeStringToMinutes((differenceBetweenTimes))),
                style: TextStyleFonts.BodyText.apply(
                    color: Theme.of(context).colorScheme.onPrimaryContainer)),
          ],
        ),
      ),
    );
  }
}
/*
Container(
      width: double.infinity,
      height: 61.h,
      padding: EdgeInsetsDirectional.all(16.r),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(Radius.circular(8.r)),
      ),
      child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text.rich(
                    TextSpan(
                        text: title,
                        style: TextStyleFonts.BodyText.apply(
                            color: Theme.of(context).colorScheme.onPrimary)),
                  ),
                  // Text(
                  // title,
                  //     style: TextStyleFonts.BodyText.apply(
                  //         color: Theme.of(context).colorScheme.onPrimary)),

                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        startTime,
                        style: TextStyleFonts.BodyText.apply(
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimaryContainer),
                      ),
                      Text(" - ",
                          style: TextStyleFonts.BodyText.apply(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onPrimaryContainer)),
                      Text(endTime,
                          style: TextStyleFonts.BodyText.apply(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onPrimaryContainer)),
                    ],
                  )
                ],
              ),
            ),
            Flexible(
              child: Text(differenceBetweenTimes,
                  style: TextStyleFonts.BodyText.apply(
                      color: Theme.of(context).colorScheme.onPrimaryContainer)),
            )
          ]),
    )
*/