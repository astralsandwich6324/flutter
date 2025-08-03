part of 'note_bloc.dart';

sealed class NoteState extends Equatable {
  const NoteState();
  
  @override
  List<Object?> get props => [];

  get allNotes => null;
}

final class NoteInitial extends NoteState {}

//loading state
final class LoadingState extends NoteState{
   @override
  List<Object> get props => [];
}

//todas las notas
final class LoadedState extends NoteState{
  final List<Notes> allNotes;
  const LoadedState (this.allNotes);

   @override
  List<Object> get props => [allNotes];
}

//en caso de errr
final class FailureState extends NoteState{
  final String errorMessage;
  const FailureState (this.errorMessage);

   @override
  List<Object> get props => [errorMessage];
}



//obtener nota por id
final class GetNoteByIdState extends NoteState{
  final Notes notes;
  const GetNoteByIdState(this.notes);
  @override
  List<Object?> get props => [];
}

final class SuccessNoteInsertion extends NoteState{

   @override
  List<Object?> get props => [];
} 

final class SuccessNoteUpdate extends NoteState{
  
   @override
  List<Object?> get props => [];
} 

final class SuccessNoteDelete extends NoteState{
  
   @override
  List<Object?> get props => [];
} 