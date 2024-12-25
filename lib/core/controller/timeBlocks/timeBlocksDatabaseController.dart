// change everything

// ignore_for_file: invalid_use_of_protected_member

import 'package:get/get.dart';
import 'package:schedule_app/data/database/tables/timeBlocksTables.dart';
import 'package:schedule_app/data/database/configrationsDatabase.dart';
import 'package:schedule_app/data/models/timeBlocksModel.dart';

abstract class TimeBlocksDatabaseController extends GetxController {
  fetchTimeBlocks();

  fetchTimeBlocksForEdit({required String? nameOfCategory});

  addTimeBlocks({required TimeBlocks timeBlocks});

  updateTimeBlocks({required TimeBlocks timeBlocks});

  deleteTimeBlocks({required int id});
}

class ImpTimeBlocksDatabaseController extends TimeBlocksDatabaseController {
  SQLite sq = SQLite();
  final RxList<TimeBlocks> timeBlocks = <TimeBlocks>[].obs;
  final RxList<TimeBlocks> timeBlocksForEdit = <TimeBlocks>[].obs;

  Future<void> fetchTimeBlocks() async {
    final List<Map<String, dynamic>> timeBlocksMaps = await sq.readData(
      table: TimeBlocksTable.timeBlocksTableName,
    );
    timeBlocks.value =
        timeBlocksMaps.map((data) => TimeBlocks.fromMap(data)).toList();
    // print("---------------fetchTimeBlocks-------------\n\n");
    // // getColumnNames();
    // print(timeBlocksMaps);
  }

  Future<void> fetchTimeBlocksForEdit({required String? nameOfCategory}) async {
    print(nameOfCategory);
    final List<Map<String, dynamic>> timeBlocksMaps = await sq.readData(
      table: TimeBlocksTable.timeBlocksTableName,
    );
    timeBlocksForEdit.value =
        timeBlocksMaps.map((data) => TimeBlocks.fromMap(data)).toList();
    timeBlocksForEdit.value = timeBlocksForEdit.value
        .where((data) => data.category == nameOfCategory)
        .toList();
  }

  Future<void> addTimeBlocks({required TimeBlocks timeBlocks}) async {
    var response = await sq.insertData(
        table: TimeBlocksTable.timeBlocksTableName,
        values: timeBlocks.toMap(),
        inserQuery: "INSERT INTO ${TimeBlocksTable.timeBlocksTableName} ("
            "`${TimeBlocksTable.col_title}`,"
            "`${TimeBlocksTable.col_startTime}`,"
            "`${TimeBlocksTable.col_endTime}`,"
            "`${TimeBlocksTable.col_notification}`,"
            "`${TimeBlocksTable.col_repeatDays}`,"
            "`${TimeBlocksTable.col_color}`,"
            "`${TimeBlocksTable.col_day}`,"
            "`${TimeBlocksTable.col_nameOfDay}`,"
            "`${TimeBlocksTable.col_numberOfDay}`,"
            "`${TimeBlocksTable.col_category}`"
            ") VALUES("
            "'${timeBlocks.title}',"
            "'${timeBlocks.start_time}',"
            "'${timeBlocks.end_time}',"
            "'${timeBlocks.notification}',"
            "'${timeBlocks.repeatDays!.join(',')}',"
            "'${timeBlocks.color}',"
            "'${timeBlocks.day}',"
            "'${timeBlocks.nameOfDay}',"
            "'${timeBlocks.numberOfDay}',"
            "'${timeBlocks.category}'"
            ")"); //add data to database
    print("addTimeBlocks done------------->$response");
    fetchTimeBlocks(); //reset the tasks
  }

  Future<void> updateTimeBlocks({required TimeBlocks timeBlocks}) async {
    int response = await sq.updateData(
        table: TimeBlocksTable.timeBlocksTableName,
        values: timeBlocks.toMap(),
        my_where: "`${TimeBlocksTable.col_id}`=${timeBlocks.id} ",
        updateQuery: '''UPDATE ${TimeBlocksTable.timeBlocksTableName} SET
        `${TimeBlocksTable.col_title}` = '${timeBlocks.title}',
        `${TimeBlocksTable.col_startTime}` = '${timeBlocks.start_time}',
        `${TimeBlocksTable.col_endTime}` = '${timeBlocks.end_time}',
        `${TimeBlocksTable.col_notification}` = '${timeBlocks.notification}',
        `${TimeBlocksTable.col_repeatDays}` = '${timeBlocks.repeatDays!.join(',')}',
        `${TimeBlocksTable.col_color}` = '${timeBlocks.color}',
        `${TimeBlocksTable.col_day}` = '${timeBlocks.day}',
        `${TimeBlocksTable.col_nameOfDay}` = '${timeBlocks.nameOfDay}',
        `${TimeBlocksTable.col_numberOfDay}` = '${timeBlocks.numberOfDay}',
        `${TimeBlocksTable.col_category}` = '${timeBlocks.category}'
        WHERE `${TimeBlocksTable.col_id}` = ${timeBlocks.id}'''); //update data to database
    print("updateTimeBlocks done------------->$response");
    fetchTimeBlocks(); //reset the tasks
  }

  Future<void> deleteTimeBlocks({required int id}) async {
    int response = await sq.deleteData(
        table: TimeBlocksTable.timeBlocksTableName,
        my_where: "`${TimeBlocksTable.col_id}`=$id"); //delete data to database
    print("deleteTimeBlocks done------------->$response");
    fetchTimeBlocks(); //reset the tasks
  }

  getColumnNames() async {
    // Execute the PRAGMA statement to get column information
    List<Map<String, dynamic>> columns = await sq.displayNameOfColumns(
        tableName: TimeBlocksTable.timeBlocksTableName);

    // Extract column names from the result
    List<String> columnNames =
        columns.map((column) => column['name'] as String).toList();
    print("columnNames \n\n");
    print(columnNames);
  }
}



  // Future<void> addTimeBlocks({required TimeBlocks timeBlocks}) async {
  //   var response = await sq.insertData(
  //       table: TimeBlocksTable.timeBlocksTableName,
  //       values: timeBlocks.toMap()); //add data to database
  //   print("addTimeBlocks done------------->$response");
  //   fetchTimeBlocks(); //reset the tasks
  // }

  // Future<void> updateTimeBlocks({required TimeBlocks timeBlocks}) async {
  //   int response = await sq.updateData(
  //       table: TimeBlocksTable.timeBlocksTableName,
  //       values: timeBlocks.toMap(),
  //       my_where:
  //           "`${TimeBlocksTable.col_id}`=${timeBlocks.id} "); //update data to database
  //   print("updateTimeBlocks done------------->$response");
  //   fetchTimeBlocks(); //reset the tasks
  // }