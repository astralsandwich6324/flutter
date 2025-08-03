part of 'note_bloc.dart';

sealed class NoteEvent extends Equatable {
  const NoteEvent();

  
}

//get event
class GetAllNoteEvent extends NoteEvent{
  @override
  List<Object> get props => [];
}
