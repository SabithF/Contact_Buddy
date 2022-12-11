import 'package:contact_app/DB/db_connec.dart';
import 'package:sqflite/sqflite.dart';

import '../models/AddUser.dart';

class Repository {
  late DbConnect _dbConnect;
  //constructor
  Repository() {
    _dbConnect = DbConnect();
  }

  // checking the availablity of the DB
  static Database? _database;
  Future<Database?> get database async {
    if (_database != null) {
      return _database;
    } else {
      _database = await _dbConnect.setDatabase();
      return _database;
    }
  }

//Insert User
  insertData(table, data) async {
    var connection = await database;
    return await connection?.insert(table, data);
  }

  //Read All Record
  readData(table) async {
    var connection = await database;
    return await connection?.query(table);
  }

  //Read a Single Record By ID
  readDataById(table, itemId) async {
    var connection = await database;
    return await connection?.query(table, where: 'id=?', whereArgs: [itemId]);
  }

  //Update User
  updateData(table, data) async {
    var connection = await database;
    return await connection
        ?.update(table, data, where: 'id=?', whereArgs: [data['id']]);
  }

  //Delete User
  deleteDataById(table, itemId) async {
    var connection = await database;
    return await connection?.rawDelete("delete from $table where id=$itemId");
  }

// ----------------------------------------------------------------------------------------------------
// New Codes
  // Future<void> inserUser(User user) async {
  //   // Get a reference to the database.
  //   final db = await database;

  //   // Insert the Dog into the correct table. You might also specify the
  //   // `conflictAlgorithm` to use in case the same dog is inserted twice.
  //   //
  //   // In this case, replace any previous data.
  //   await db.insert(
  //     'dogs',
  //     dog.toMap(),
  //     conflictAlgorithm: ConflictAlgorithm.replace,
  //   );
  // }
}
