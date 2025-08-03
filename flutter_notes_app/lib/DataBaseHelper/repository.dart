import 'package:flutter/material.dart';
import 'package:flutter_notes_app/DataBaseHelper/connection.dart';
import 'package:flutter_notes_app/DataBaseHelper/tables.dart';
import 'package:flutter_notes_app/Models/notes.dart';

class Repository {

  final DataBaseHelper databaseHelper = DataBaseHelper();

  //get notes

  Future<List<Notes>> getNotes()async{
    final db = await databaseHelper.initDatabase();

    final List<Map<String, Object?>> notes = await  db.query(Tables.noteTableName);
    return notes.map((e) => Notes.fromMap(e)).toList();
  }

  //add notes

  Future<int> addNotes(Notes notes)async{
    final db = await databaseHelper.initDatabase();
    return db.insert(Tables.noteTableName, notes.toMap());
  }

  //update note

  Future<int> updateNote(Notes notes)async{
    final db = await databaseHelper.initDatabase();
    return db.update(Tables.noteTableName, notes.toMap(), where: "noteId = ?", whereArgs: [notes.noteId]);
  }

  //delete note
  Future<int> deleteNote(int id)async{
    final db = await databaseHelper.initDatabase();
    return db.delete(Tables.noteTableName, where: "noteId = ?", whereArgs: [id]);
  }

  //Get notes by id
  Future<Notes> getNoteById(int id)async{
    final db = await databaseHelper.initDatabase();
    final note = await db.query(Tables.noteTableName, where: "noteId = ?", whereArgs: [id]);

    if(note.isNotEmpty){
      return Notes.fromMap(note.first);
    }else{
      throw Exception("note $id not found");
    }
  }

}