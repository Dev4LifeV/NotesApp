import 'package:notes_app/model/note.dart';
import 'package:universal_html/html.dart';

class RepositoryNotes {
  List<Note> listNotes() => window.localStorage.entries
      .map<Note>((e) => Note.fromLocalStorage(e.value))
      .toList();

  void newNote(String title, String desc) => window.localStorage
      .addAll(Note(title: title, description: desc).toJson());
}
