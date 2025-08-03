import 'package:flutter_notes_app/DataBaseHelper/tables.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DataBaseHelper{
  final databasename = "note.db";

  Future<Database> initDatabase()async{
    final databasePath = await getApplicationDocumentsDirectory();
    final path = join(databasePath.path, databasename);
    return openDatabase(path, version: 1, onCreate: (db, version)async{
      //tables
      await db.execute(Tables.noteTable);
    });

    }
  }
