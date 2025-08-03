import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_notes_app/Bloc/bloc/note_bloc.dart';

import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class AllNotes extends StatefulWidget {
  const AllNotes({super.key});

  @override
  State<AllNotes> createState() => _AllNotesState();
}

class _AllNotesState extends State<AllNotes> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NoteBloc, NoteState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Notes"),
            
          ),
          body: BlocConsumer<NoteBloc, NoteState>(

              listener: (context, state) {},
              builder: (context, state) {
                if(State is LoadedState){
                  return state.allNotes.isEmpty? const Center(child: Text("No hay datos")): MasonryGridView.builder(
                    gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2
                      ), 
                    itemCount: state.allNotes.length,
                    itemBuilder: (context, index){
                      return Column(
                        children: [
                          Text(state.allNotes[index].title)
                        ],
                      );
                    });
                }
                return Container();
              },
            ),
        );
      },
    );
  }
}
