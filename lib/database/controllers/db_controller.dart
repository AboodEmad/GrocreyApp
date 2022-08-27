import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class DbController {
  DbController._();

  late Database _database;
  static DbController? _instance;

  factory DbController() {
    return _instance ??= DbController._();
  }

  Database get database => _database;

  Future<void> initDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, 'app_db.sql');
    _database = await openDatabase(
      path,
      version: 1,
      onOpen: (Database database) {},
      onCreate: (Database database, int version) async {
        await database.execute('CREATE TABLE cart ('
            'id INTEGER PRIMARY KEY AUTOINCREMENT,'
            'product_id TEXT,'
            'info TEXT,'
            'name TEXT,'
            'img TEXT,'
            'quantity INTEGER,'
            'price REAL'
            ')');
      },
      onUpgrade: (Database database, int oldVersion, int newVersion) {},
      onDowngrade: (Database database, int oldVersion, int newVersion) {},
    );
  }
}
