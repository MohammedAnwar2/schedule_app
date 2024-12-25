// ignore_for_file: depend_on_referenced_packages, avoid_print, non_constant_identifier_names

import 'package:path/path.dart';
import 'package:schedule_app/data/database/tables/taskTables.dart';
import 'package:schedule_app/data/database/tables/timeBlocksTables.dart';
import 'package:schedule_app/data/database/tables/timeTable.dart';
import 'package:sqflite/sqflite.dart';

class SQLite {
  static Database? _db;

  Future<Database?> get db async {
    if (_db == null) {
      _db = await initSQLite();
      return _db;
    } else {
      return _db;
    }
  }

  initSQLite() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'LearnSQLite.db');
    Database database = await openDatabase(path,
        onCreate: _oncreate, version: 9, onUpgrade: _onUpgrade);
    return database;
  }

  readData({String? table, String? orderedBy}) async {
    Database? database = await db;
    List<Map> response = await database!.rawQuery(
        'SELECT*FROM $table  ORDER BY $orderedBy ASC'); //,orderBy: "`id` DESC" // orderBy: "`id` ASC " TaskTable.col_classification
    return response;
  }

  insertData(
      {String? table, Map<String, Object?>? values, String? inserQuery}) async {
    Database? database = await db;
    int response = await database!.rawInsert(inserQuery!);
    return response;
  }

  deleteData({String? table, String? my_where}) async {
    Database? database = await db;
    int response =
        await database!.rawDelete("DELETE FROM $table WHERE $my_where");
    return response;
  }

  updateData(
      {String? table,
      Map<String, Object?>? values,
      String? my_where,
      String? updateQuery}) async {
    Database? database = await db;
    int response = await database!.rawUpdate(updateQuery!);
    return response;
  }

  MydeleteDatabase() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'LearnSQLite.db');
    await deleteDatabase(path);
    print("delete database ----------------------");
  }

  Future<List<Map<String, dynamic>>> displayNameOfColumns(
      {required String tableName}) async {
    Database? database = await db;
    List<Map<String, dynamic>> columns =
        await database!.rawQuery('PRAGMA table_info($tableName)');
    return columns;
  }

  _onUpgrade(Database db, int oldVersion, int newVersion) async {
    print("_onUpgrade ==============================");
  }

  _oncreate(Database db, int version) async {
    //  Batch batch = Batch();
    await db.execute('''
      CREATE TABLE `${TaskTable.taskTableName}` (
        "${TaskTable.col_id}" INTEGER PRIMARY KEY AUTOINCREMENT,
        "${TaskTable.col_title}" TEXT ,
        "${TaskTable.col_time}" TEXT ,
        "${TaskTable.col_notification}" INTEGER ,
        "${TaskTable.col_classification}" INTEGER ,
        "${TaskTable.col_color}" INTEGER ,
        "${TaskTable.col_isCompleted}" INTEGER )
     ''');
    await db.execute('''
      CREATE TABLE `${TimeBlocksTable.timeBlocksTableName}` (
        "${TimeBlocksTable.col_id}" INTEGER PRIMARY KEY AUTOINCREMENT, 
        "${TimeBlocksTable.col_title}" TEXT ,
        "${TimeBlocksTable.col_startTime}" TEXT ,
        "${TimeBlocksTable.col_endTime}" TEXT ,
        "${TimeBlocksTable.col_notification}" INTEGER ,
        "${TimeBlocksTable.col_repeatDays}" TEXT ,
        "${TimeBlocksTable.col_color}" INTEGER ,
        "${TimeBlocksTable.col_day}" INTEGER ,
        "${TimeBlocksTable.col_nameOfDay}" TEXT ,
        "${TimeBlocksTable.col_numberOfDay}" INTEGER,
        "${TimeBlocksTable.col_category}" TEXT )
     ''');
    await db.execute('''
      CREATE TABLE `${TimeTable_table.timeTable_tableName}` (
        "${TimeTable_table.col_id}" INTEGER  PRIMARY KEY AUTOINCREMENT,
        "${TimeTable_table.col_subject}" TEXT ,
        "${TimeTable_table.col_roomNo}" TEXT ,
        "${TimeTable_table.col_start_time}" TEXT ,
        "${TimeTable_table.col_period}" TEXT ,
        "${TimeTable_table.col_notification}" INTEGER ,
        "${TimeTable_table.col_repeatDays}" TEXT ,
        "${TimeTable_table.col_color}" INTEGER  )
     ''');
    print("_oncreate ==============================");
  }
}
























  // updateData(
  //     {String? table, Map<String, Object?>? values, String? my_where}) async {
  //   Database? database = await db;
  //   int response = await database!.update(table!, values!, where: my_where);
  //   return response;
  // }

  // readData({String? table, String? orderedBy}) async {
  //   Database? database = await db;
  //   List<Map> response = await database!.query(table!,
  //       orderBy:
  //           "$orderedBy ASC"); //,orderBy: "`id` DESC" // orderBy: "`id` ASC " TaskTable.col_classification
  //   return response;
  // }

  // insertData({String? table, Map<String, Object?>? values}) async {
  //   Database? database = await db;
  //   int response = await database!.insert(table!, values!);
  //   return response;
  // }

  // deleteData({String? table, String? my_where}) async {
  //   Database? database = await db;
  //   int response = await database!.delete(table!, where: my_where!);
  //   return response;
  // }

  // updateData(
  //     {String? table, Map<String, Object?>? values, String? my_where}) async {
  //   Database? database = await db;
  //   int response = await database!.update(table!, values!, where: my_where);
  //   return response;
  // }

      // await db.execute('''
    //   CREATE TABLE `${TimeTable_table.timeTable_tableName}` (
    //     "${TimeTable_table.col_id}" INTEGER PRIMARY KEY AUTOINCREMENT,
    //     "${TimeTable_table.col_subject}" TEXT ,
    //     "${TimeTable_table.col_roomNo}" TEXT ,
    //     "${TimeTable_table.col_start_time}" TEXT ,
    //     "${TimeTable_table.col_period}" TEXT ,
    //     "${TimeTable_table.col_notification}" INTEGER ,
    //     "${TimeTable_table.col_repeatDays}" TEXT ,
    //     "${TimeTable_table.col_color}" INTEGER  )
    //  ''');
    // await db.execute("ALTER TABLE notes ADD COLUMN BABY Text ");
    //await db.execute("ALTER TABLE notes DROP COLUMN BABY");