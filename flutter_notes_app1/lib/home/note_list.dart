import 'package:flutter/material.dart';
import 'package:flutter_notes_app1/Constant/routes.dart';
import 'package:flutter_notes_app1/sqlite/model/note.dart';
import 'package:flutter_notes_app1/sqlite/sqlite.delete.dart';
import 'package:flutter_notes_app1/sqlite/sqlite_helper.dart';
import 'package:flutter_notes_app1/sqlite/sqlite_query.dart';
import 'package:provider/provider.dart';

class NoteList extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return Scaffold(
    appBar: AppBar(
      title: Center(
        child: Text("Notes"),
      ),
    ) ,
    body: FutureBuilder(
      future: SqliteHelper.getDB(),
      builder: (context, snapshot){
        if(snapshot.connectionState == ConnectionState.done){
          return _showList(context);
        }else{
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    ),
    floatingActionButton: FloatingActionButton(
      onPressed: ()=> _openAddNote(context),
      child: Icon(Icons.add),
    ),
   );
  }

  void _openAddNote (BuildContext context){
    Navigator.pushNamed(context, Routes.addNote).then((value){
      Provider.of<SqliteQuery>(context, listen: false).updateNotes();
    });
  }
  
  _showList(BuildContext context){
    final SqliteQuery sqliteQuery = Provider.of<SqliteQuery>(context);
    return ListView.builder(
      itemCount: sqliteQuery.notes.length,
      itemBuilder: (context, index){
        return Dismissible(
          key: Key(sqliteQuery.notes[index].id.toString()),
          direction: DismissDirection.startToEnd,
          background: Container(
            color: Colors.red,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Icon(Icons.delete, color: Colors.white,),
            ),
          ),
          onDismissed: (direction){
            SqliteDelete().note(sqliteQuery.notes[index]);
            sqliteQuery.updateNotes();
          },
          child: ListTile(
          title: Text(sqliteQuery.notes[index].name!),
          subtitle: Text(sqliteQuery.notes[index].description!),
          trailing: ElevatedButton.icon(
            icon: Icon(Icons.edit),
            label: Text("Edit"),
            onPressed: ()=> _openEditNote(context, sqliteQuery.notes[index]),
          ),
        ),
        );
      }
    );
  }

  void _openEditNote(BuildContext context, Note note){
    Navigator.pushNamed(context, Routes.editNote, arguments: note ).then((value){
      Provider.of<SqliteQuery>(context, listen: false).updateNotes();
    });
  }


}