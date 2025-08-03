import 'package:flutter/material.dart';
import 'package:flutter_notes_app1/sqlite/model/note.dart';
import 'package:flutter_notes_app1/sqlite/sqlite_helper.dart';
import 'package:sqflite/sqflite.dart';

class SqliteInsert {
  Future<void> note(Note note) async{
    final Database db = await SqliteHelper.getDB();
    await db.insert(
      "note",
       note.toMap());
  }
}