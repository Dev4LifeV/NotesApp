import 'package:notes_app/model/note.dart';
import 'package:notes_app/repository/repository_notes.dart';

class ControllerNotes {
  ControllerNotes(this._repo);

  final RepositoryNotes _repo;

  List<Note> listNotes() => _repo.listNotes();

  void newNote(String title, String desc) => _repo.newNote(title, desc);
}
