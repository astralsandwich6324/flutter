import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SqliteHelper {
    static Future<Database>? _db;

    static Future<Database> getDB(){
      _db ??= _initDB();
      return _db!;
    }

    static Future<Database> _initDB() async{
      final db = await openDatabase(
        join(await getDatabasesPath(), "notes_db.db"),
        version: 1,
        onCreate: _onCreate,

      );
      return db;
    }

    static _onCreate(Database db, int version) async{
      await db.execute("CREATE TABLE note(id INTEGER PRIMARY KEY, name TEXT NOT NULL, description TEXT)");
    }
}