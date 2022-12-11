import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import '../models/AddUser.dart';

// creating class to connect to the DB
class DbConnect {
//   void DbConnect2() async {
//     WidgetsFlutterBinding.ensureInitialized();
//     final database = openDatabase(
//       join(await getDatabasesPath(), 'contact_db'),
//       onCreate: (db, version) {
//         // Run the CREATE TABLE statement on the database.
//         return db.execute(
//           'CREATE TABLE users(id INTEGER PRIMARY KEY, fname TEXT, lname TEXT, contact TEXT)',
//         );
//       },
//       // Set the version. This executes the onCreate function and provides a
//       // path to perform database upgrades and downgrades.
//       version: 1,
//     );

  Future<Database> setDatabase() async {
    // getting saved folder dirtectory
    var directory = await getApplicationDocumentsDirectory();
    // creating contact_db in the directory which the db is saved
    var path = join(directory.path, 'contact_db');
    // creating instance
    var database = await openDatabase(path, version: 1, onCreate: _CreateNewDb);
    return database;
  }

// creating the DB
// 'database' db name
  Future<void> _CreateNewDb(Database database, int version) async {
    String sql =
        "CREATE TABLE users (id INTEGER PRIMARY KEY, fname TEXT, lname TEXT, contact TEXT);";
    await database.execute(sql);
  }
// // new codes
//     Future<void> insertUser(User user) async {
//       // Get a reference to the database.
//       final db = await database;

//       // Insert the Dog into the correct table. You might also specify the
//       // `conflictAlgorithm` to use in case the same dog is inserted twice.
//       //
//       // In this case, replace any previous data.
//       await db.insert(
//         'users',
//         user.toMap(),
//         conflictAlgorithm: ConflictAlgorithm.replace,
//       );
//     }

//     // A method that retrieves all the dogs from the dogs table.
//     Future<List<User>> users() async {
//       // Get a reference to the database.
//       final db = await database;

//       // Query the table for all The Dogs.
//       final List<Map<String, dynamic>> maps = await db.query('users');

//       // Convert the List<Map<String, dynamic> into a List<Dog>.
//       return List.generate(maps.length, (i) {
//         return User(
//           id: maps[i]['id'],
//           fname: maps[i]['fname'],
//           age: maps[i]['age'],
//         );
//       });
//     }
//   }
}
