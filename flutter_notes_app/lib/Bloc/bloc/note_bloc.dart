import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_notes_app/DataBaseHelper/repository.dart';
import 'package:flutter_notes_app/Models/notes.dart';

part 'note_event.dart';
part 'note_state.dart';

class NoteBloc extends Bloc<NoteEvent, NoteState> {
 final Repository repository;
  NoteBloc(this.repository) : super(NoteInitial()) {
    //event controller
    on<GetAllNoteEvent>((event, emit) async {
      emit(LoadingState());
      try{
        final notes = await repository.getNotes();
        emit(LoadedState(notes));
      }catch(e){
        emit(FailureState(e.toString()));
      }
    });
  }
}
