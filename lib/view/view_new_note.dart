import 'package:flutter/material.dart';
import 'package:notes_app/model/note.dart';
import 'package:notes_app/view/component/notes_text_field.dart';
import 'package:universal_html/html.dart';

class ViewNewNote extends StatelessWidget {
  ViewNewNote({super.key});

  final NotesTextField _fieldTitle = NotesTextField(
    hintText: "Title",
  );
  final NotesTextField _fieldDescription = NotesTextField(
    hintText: "Description",
    minLines: 10,
    maxLines: 15,
  );

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(),
        body: body(),
      );

  appBar() => AppBar();

  body() => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _fieldTitle,
            const SizedBox(
              height: 15,
            ),
            _fieldDescription,
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              width: 250,
              child: ElevatedButton(
                onPressed: createNewNote,
                child: const Text("Save"),
              ),
            ),
            SizedBox(
              width: 250,
              child: ElevatedButton(
                onPressed: listNotes,
                child: const Text("List"),
              ),
            ),
          ],
        ),
      );

  listNotes() =>
      window.localStorage.entries.map((e) => Note.fromLocalStorage(e.value));

  createNewNote() => window.localStorage.addAll(
        {
          '${UniqueKey()}': Note(
                  title: _fieldTitle.controller.text,
                  description: _fieldDescription.controller.text)
              .toJson()
        },
      );
}
