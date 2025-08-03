import 'package:flutter/material.dart';
import 'package:flutter_notes_app1/Constant/routes.dart';
import 'package:flutter_notes_app1/home/add_note.dart';
import 'package:flutter_notes_app1/home/edit_note.dart';
import 'package:flutter_notes_app1/home/note_list.dart';
import 'package:flutter_notes_app1/sqlite/sqlite_helper.dart';
import 'package:flutter_notes_app1/sqlite/sqlite_query.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SqliteQuery()),
      ],
      child:  MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: Routes.home,
      routes: {
        Routes.home : (context) => NoteList(),
        Routes.addNote : (context) => AddNote(),
        Routes.editNote : (context) => EditNote(),
      },
      
    ),
    );
  }
}



