// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: file_names

import 'package:schedule_app/data/database/tables/taskTables.dart';

class Task {
  int? id;
  String? title;
  String? time;
  int? notification;
  int? classification;
  int? color;
  int? isCompleted;

  Task({
    this.id,
    this.title,
    this.time,
    this.notification,
    this.classification,
    this.color,
    this.isCompleted,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      TaskTable.col_id: id,
      TaskTable.col_title: title,
      TaskTable.col_time: time,
      TaskTable.col_notification: notification,
      TaskTable.col_classification: classification,
      TaskTable.col_color: color,
      TaskTable.col_isCompleted: isCompleted,
    };
  }

  Task.fromMap(Map<String, dynamic> task) {
    id = task[TaskTable.col_id];
    title = task[TaskTable.col_title];
    time = task[TaskTable.col_time];
    notification = task[TaskTable.col_notification];
    classification = task[TaskTable.col_classification];
    color = task[TaskTable.col_color];
    isCompleted = task[TaskTable.col_isCompleted];
  }
}
