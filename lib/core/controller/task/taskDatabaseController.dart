// ignore_for_file: avoid_print

import 'package:get/get.dart';
import 'package:schedule_app/components/time_functions.dart';
import 'package:schedule_app/data/models/taskModel.dart';
import 'package:schedule_app/data/database/configrationsDatabase.dart';
import 'package:schedule_app/data/database/tables/taskTables.dart';

class TaskDatabaseController extends GetxController {
  final RxList<Task> tasks = <Task>[].obs;
  final RxList<Task> missingTasks = <Task>[].obs;
  final RxList<Task> continueTasks = <Task>[].obs;
  SQLite sq = SQLite();
  RxInt completedTasks = 0.obs;

  Future<void> fetchTasks() async {
    final List<Map<String, dynamic>> taskMaps = await sq.readData(
        table: TaskTable.taskTableName,
        orderedBy: TaskTable.col_classification);
    // print("TASK");
    // print(taskMaps);
    // print("TASK");
    tasks.value = taskMaps.map((data) => Task.fromMap(data)).toList();

    missingTasks.value = tasks
        .where((note) =>
            checkMissingTime(dt_ForTask: note.time!) == false &&
            note.isCompleted == 0 &&
            differenceTimeForMissingTask(taskDate: note.time!, id: note.id!) ==
                false)
        .toList();

    continueTasks.value = tasks
        .where((note) =>
            checkMissingTime(dt_ForTask: note.time!) == true &&
            differenceTimeForContinueTask(taskDate: note.time!, task: note) ==
                false)
        .toList();

    completedTasks.value =
        continueTasks.where((note) => note.isCompleted == 1).toList().length;
    // print("---------------fetchTasks-------------");
  }

  Future<void> addTask({required Task task}) async {
    var response = await sq.insertData(
        table: TaskTable.taskTableName,
        values: task.toMap(),
        inserQuery: "INSERT INTO ${TaskTable.taskTableName} ("
            "`${TaskTable.col_title}`,"
            "`${TaskTable.col_time}`,"
            "`${TaskTable.col_notification}`,"
            "`${TaskTable.col_classification}`,"
            "`${TaskTable.col_color}`,"
            "`${TaskTable.col_isCompleted}`"
            ")VALUES ("
            "'${task.title}',"
            "'${task.time}',"
            "${task.notification},"
            "${task.classification},"
            "${task.color},"
            "${task.isCompleted})"); //add data to database
    print("addTask done------------->$response");
    fetchTasks(); //reset the tasks
  }

  Future<void> updateTask({required Task task}) async {
    int response = await sq.updateData(
        table: TaskTable.taskTableName,
        values: task.toMap(),
        my_where: "`${TaskTable.col_id}`=${task.id} ",
        updateQuery: '''UPDATE ${TaskTable.taskTableName} 
                        SET ${TaskTable.col_title} = '${task.title}',
                            ${TaskTable.col_time} = '${task.time}',
                            ${TaskTable.col_notification} = ${task.notification},
                            ${TaskTable.col_classification} = ${task.classification},
                            ${TaskTable.col_color} = ${task.color},
                            ${TaskTable.col_isCompleted} = ${task.isCompleted}
                        WHERE ${TaskTable.col_id} = ${task.id}'''); //update data to database
    print("updateTask done------------->$response");
    fetchTasks(); //reset the tasks
  }

  Future<void> deleteTask({required int id}) async {
    int response = await sq.deleteData(
        table: TaskTable.taskTableName,
        my_where: "`${TaskTable.col_id}`=$id"); //delete data to database
    print("deleteTask done------------->$response");
    fetchTasks(); //reset the tasks
  }

  Future<void> deleteMissingTask({required int id}) async {
    int response = await sq.deleteData(
        table: TaskTable.taskTableName,
        my_where: "`${TaskTable.col_id}`=$id"); //delete data to database
    print("deleteMissingTask done------------->$response");
  }
}

/*
  Future<void> addTask({required Task task}) async {
    var response = await sq.insertData(
        table: TaskTable.taskTableName,
        values: task.toMap()); //add data to database
    print("addTask done------------->$response");
    fetchTasks(); //reset the tasks
  }

  Future<void> updateTask({required Task task}) async {
    int response = await sq.updateData(
        table: TaskTable.taskTableName,
        values: task.toMap(),
        my_where:
            "`${TaskTable.col_id}`=${task.id} "); //update data to database
    print("updateTask done------------->$response");
    fetchTasks(); //reset the tasks
  }

 */