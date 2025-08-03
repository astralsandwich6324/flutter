import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_notes_app/Bloc/bloc/note_bloc.dart';
import 'package:flutter_notes_app/DataBaseHelper/repository.dart';
import 'package:flutter_notes_app/Views/notes.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NoteBloc(Repository()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "flutter_notes_app",
        home: const AllNotes(),
      ),
    );
  }
}
