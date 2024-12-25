import 'package:get/get.dart';
import 'package:schedule_app/data/database/configrationsDatabase.dart';
import 'package:schedule_app/data/database/tables/timeTable.dart';
import 'package:schedule_app/data/models/timeTableModel.dart';

abstract class TimeTableDatabaseController extends GetxController {
  fetchTimeTable();

  addTimeTable({required TimeTable timeTable});

  updateTimeTable({required TimeTable timeTable});

  deleteTimeTable({required int id});
}

//TimeTable_table
//TimeTable
class ImpTimeTableDatabaseController extends TimeTableDatabaseController {
  SQLite sq = SQLite();
  final RxList<TimeTable> timeTable = <TimeTable>[].obs;
  List<Map<String, dynamic>>? timeTableMapsResult;
  Future<void> fetchTimeTable() async {
    final List<Map<String, dynamic>> timeTableMaps = await sq.readData(
        table: TimeTable_table.timeTable_tableName,
        orderedBy: TimeTable_table.col_start_time);
    timeTableMapsResult = timeTableMaps;
    timeTable.value =
        timeTableMaps.map((data) => TimeTable.fromMap(data)).toList();
    // print("---------------fetchTimeTable-------------\n\n");
    // print(timeTableMaps);
  }

  Future<void> addTimeTable({required TimeTable timeTable}) async {
    var response = await sq.insertData(
        table: TimeTable_table.timeTable_tableName,
        values: timeTable.toMap(),
        inserQuery: '''INSERT INTO ${TimeTable_table.timeTable_tableName}(
                      ${TimeTable_table.col_subject}, 
                      ${TimeTable_table.col_roomNo}, 
                      ${TimeTable_table.col_start_time}, 
                      ${TimeTable_table.col_period}, 
                      ${TimeTable_table.col_notification}, 
                      ${TimeTable_table.col_repeatDays}, 
                      ${TimeTable_table.col_color}
                      )VALUES (
                      '${timeTable.subject}', 
                      '${timeTable.roomNo}', 
                      '${timeTable.start_time}', 
                      '${timeTable.period}', 
                       ${timeTable.notification}, 
                      '${timeTable.repeatDays}', 
                       ${timeTable.color})'''); //add data to database
    print("addTimeTables done------------->$response");
    fetchTimeTable(); //reset the tasks
  }

  Future<void> updateTimeTable({required TimeTable timeTable, int? id}) async {
    id != null ? timeTable.id = id : timeTable.id!;
    int response = await sq.updateData(
        table: TimeTable_table.timeTable_tableName,
        values: timeTable.toMap(),
        my_where: "`${TimeTable_table.col_id}`=${timeTable.id} ",
        updateQuery: '''UPDATE ${TimeTable_table.timeTable_tableName} 
                        SET ${TimeTable_table.col_subject} = '${timeTable.subject}',
                            ${TimeTable_table.col_roomNo} = '${timeTable.roomNo}',
                            ${TimeTable_table.col_start_time} = '${timeTable.start_time}',
                            ${TimeTable_table.col_period} = '${timeTable.period}',
                            ${TimeTable_table.col_notification} = ${timeTable.notification},
                            ${TimeTable_table.col_repeatDays} = '${timeTable.repeatDays}',
                            ${TimeTable_table.col_color} = ${timeTable.color}
                        WHERE ${TimeTable_table.col_id} = ${timeTable.id}'''); //update data to database
    print("updateTimeTable done------------->$response");
    fetchTimeTable(); //reset the tasks
  }

  Future<void> deleteTimeTable({required int id}) async {
    int response = await sq.deleteData(
        table: TimeTable_table.timeTable_tableName,
        my_where: "`${TimeTable_table.col_id}`=$id"); //delete data to database
    print("deleteTimeTable done------------->$response");
    fetchTimeTable(); //reset the tasks
  }
}


    // var response = await sq.insertData(
    //     table: TimeTable_table.timeTable_tableName,
    //     values: timeTable.toMap(),); //add data to database

    // int response = await sq.updateData(
    //     table: TimeTable_table.timeTable_tableName,
    //     values: timeTable.toMap(),
    //     my_where: "`${TimeTable_table.col_id}`=${timeTable.id} ",);