import 'package:flutter/material.dart';
import 'package:flutter_notes_app1/sqlite/model/note.dart';
import 'package:flutter_notes_app1/sqlite/sqlite_helper.dart';
import 'package:sqflite/sqflite.dart';

class SqliteQuery with ChangeNotifier {
  List<Note> _notes = []; 

  List<Note> get notes => [..._notes]; 

  Future<void> updateNotes() async {
    final Database db = await SqliteHelper.getDB();

    
    final List<Map<String, dynamic>> maps = await db.query("note");

    
    _notes = List.generate(maps.length, (i) {
      return Note(
        id: maps[i]['id'],
        name: maps[i]['name'],
        description: maps[i]['description'],
      );
    });

    notifyListeners(); 
  }
}
