import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:schedule_app/components/time_functions.dart';
import 'package:schedule_app/core/constants/themeOfApp/fonts.dart';
import 'package:schedule_app/core/controller/settingsController.dart';

class TimeTableDesign extends StatelessWidget {
  TimeTableDesign(
      {super.key,
      required this.subject,
      required this.startTime,
      required this.period,
      // required this.differenceBetweenTimes,
      required this.color,
      required this.classRoomNo});

  final String classRoomNo;
  final Color color;
  //final String differenceBetweenTimes;
  final String period;

  final ImpSettingsController settingsController =
      Get.find<ImpSettingsController>();

  final String startTime;
  final String subject;

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
                    text: subject,
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
                builder: (_) {
                  return Text(
                    settingsController.switchStateOf24hr == false
                        ? DateFormat("h:mm a").format(
                            convertTimeStringToDateTime_Edhmma(
                                convertTo12HourFormat(startTime)))
                        : DateFormat("HH:mm").format(
                            convertTimeStringToDateTime_Edhmm(startTime)),

                    // startTime,
                    //  convert24To12Hour(startTime),
                    // convert24To12Hour(DateFormat('h:mm a')
                    //     .format(convertTimeStringToDateTime_HMMA(startTime))),
                    // DateFormat('h:mm a')
                    //     .format(convertTimeStringToDateTime_HMMA(startTime)),
                    style: TextStyleFonts.BodyText.apply(
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
                builder: (_) {
                  return Text(
                      settingsController.switchStateOf24hr == false
                          ? DateFormat("h:mm a").format(
                              convertTimeStringToDateTime_Edhmma(addMinutesToTime(
                                  originalTime: DateFormat('E h:mm a').format(
                                      convertTimeStringToDateTime_HMMA_forTimeTable(
                                          convertTo12HourFormat(startTime))),
                                  minutesToAdd: int.parse(period))))
                          : DateFormat("HH:mm").format(convertTimeStringToDateTime_Edhmma(addMinutesToTime(
                              originalTime: DateFormat('E h:mm a').format(
                                  convertTimeStringToDateTime_HMMA_forTimeTable(
                                      convertTo12HourFormat(startTime))),
                              minutesToAdd: int.parse(period)))),
                      style: TextStyleFonts.BodyText.apply(color: Theme.of(context).colorScheme.onPrimaryContainer));
                },
              ),
            ],
          ),
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(classRoomNo,
                // formatTime(
                //     convertTimeStringToMinutes((differenceBetweenTimes))),
                style: TextStyleFonts.BodyText.apply(
                    color: Theme.of(context).colorScheme.onPrimaryContainer)),
          ],
        ),
      ),
    );
  }
}
