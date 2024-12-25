// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:schedule_app/data/database/tables/timeTable.dart';

class TimeTable {
  int? id;
  String? subject;
  String? roomNo;
  String? start_time;
  String? period;
  int? notification;
  String? repeatDays;
  // List<String>? repeatDays;
  int? color;

  TimeTable({
    this.id,
    this.subject,
    this.roomNo,
    this.start_time,
    this.period,
    this.notification,
    this.repeatDays,
    this.color,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      TimeTable_table.col_id: id,
      TimeTable_table.col_subject: subject,
      TimeTable_table.col_roomNo: roomNo,
      TimeTable_table.col_start_time: start_time,
      TimeTable_table.col_period: period,
      TimeTable_table.col_notification: notification,
      TimeTable_table.col_repeatDays: repeatDays,
      // TimeTable_table.col_repeatDays: repeatDays!.join(','),
      TimeTable_table.col_color: color,
    };
  }

  TimeTable.fromMap(Map<String, dynamic> timeTable) {
    id = timeTable[TimeTable_table.col_id];
    subject = timeTable[TimeTable_table.col_subject];
    roomNo = timeTable[TimeTable_table.col_roomNo];
    start_time = timeTable[TimeTable_table.col_start_time];
    period = timeTable[TimeTable_table.col_period];
    notification = timeTable[TimeTable_table.col_notification];
    repeatDays = timeTable[TimeTable_table.col_repeatDays];
    // repeatDays = timeTable[TimeTable_table.col_repeatDays].split(',');
    color = timeTable[TimeTable_table.col_color];
  }
}
