import 'package:offiql/Models/local_user.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../Utils/debug_purpose.dart';

String userTable = "userTable";

class DbHelper {
  static final DbHelper _instance = DbHelper._internal();

  DbHelper._internal();

  factory DbHelper() {
    return _instance;
  }

  static Database? _database; //instance create

  Future<Database> get dataBase async {
    if (_database != null) return _database!;
    _database = await _initDataBase();

    return _database!;
  }

  Future<Database> _initDataBase() async {
    String dbPath = await getDatabasesPath(); //get the path to store
    String filePath = join(dbPath, "users.db");

    return await openDatabase(filePath,
        version: 1, onCreate: _onCreate, onConfigure: _onConfigure);
  }

  Future<void> _onCreate(Database db, int version) async {
    //to execute query
    await db.execute('''
    CREATE TABLE $userTable(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT NOT NULL,
      email TEXT NOT NULL,
      phone TEXT NOT NULL
      
    )
    ''');
  }

  Future<void> _onConfigure(Database db) async {
    await db.execute('PRAGMA foreign_keys = ON');
  }

  Future<int> insertUser(LocalUserModel model) async {
    final db = await dataBase;
    try {
      return await db.insert(userTable, model.toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace);
    } catch (e) {
      printRed("Error: $e");
      rethrow;
    }
  }

  Future<List<LocalUserModel>> getUsers() async {
    final db = await dataBase;

    try {
      final List<Map<String, dynamic>> maps = await db.query(userTable);

      return maps.map((user) => LocalUserModel.fromMap(user)).toList();
    } catch (e) {
      printRed("Error while getting the user: $e");
      rethrow;
    }
  }
}
