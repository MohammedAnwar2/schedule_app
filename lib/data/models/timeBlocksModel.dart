// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:schedule_app/data/database/tables/timeBlocksTables.dart';

class TimeBlocks {
  int? id;
  String? title;
  String? start_time;
  String? end_time;
  int? notification;
  List<String>? repeatDays;
  int? color;
  int? day;
  String? nameOfDay;
  int? numberOfDay;
  String? category;

  TimeBlocks(
      {this.id,
      this.title,
      this.start_time,
      this.end_time,
      this.notification,
      this.repeatDays,
      this.color,
      this.day,
      this.nameOfDay,
      this.numberOfDay,
      this.category});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      TimeBlocksTable.col_id: id,
      TimeBlocksTable.col_title: title,
      TimeBlocksTable.col_startTime: start_time,
      TimeBlocksTable.col_endTime: end_time,
      TimeBlocksTable.col_notification: notification,
      TimeBlocksTable.col_repeatDays: repeatDays!.join(','),
      TimeBlocksTable.col_color: color,
      TimeBlocksTable.col_day: day,
      TimeBlocksTable.col_nameOfDay: nameOfDay,
      TimeBlocksTable.col_numberOfDay: numberOfDay,
      TimeBlocksTable.col_category: category,
    };
  }

  TimeBlocks.fromMap(Map<String, dynamic> timeBlocks) {
    id = timeBlocks[TimeBlocksTable.col_id];
    title = timeBlocks[TimeBlocksTable.col_title];
    start_time = timeBlocks[TimeBlocksTable.col_startTime];
    end_time = timeBlocks[TimeBlocksTable.col_endTime];
    notification = timeBlocks[TimeBlocksTable.col_notification];
    repeatDays = timeBlocks[TimeBlocksTable.col_repeatDays].split(',');
    color = timeBlocks[TimeBlocksTable.col_color];
    day = timeBlocks[TimeBlocksTable.col_day];
    nameOfDay = timeBlocks[TimeBlocksTable.col_nameOfDay];
    numberOfDay = timeBlocks[TimeBlocksTable.col_numberOfDay];
    category = timeBlocks[TimeBlocksTable.col_category];
  }
}

// DateFormat('MMM d, h:mm a').format(convertTimeStringToDateTime(timeBlocks[TimeBlocksTable.col_endTime]))