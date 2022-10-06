import 'package:flutter/material.dart';
import 'package:notes_app/injector.dart';
import 'package:notes_app/model/note.dart';
import 'package:notes_app/view/component/notes_text_field.dart';

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
        body: body(context),
      );

  appBar() => AppBar();

  body(BuildContext context) => Center(
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
                onPressed: () {
                  final controller = Injector.of(context).controllerNotes;
                  controller.newNote(
                    _fieldTitle.controller.text,
                    _fieldDescription.controller.text,
                  );
                  Navigator.of(context).pop<List<Note>>(controller.listNotes());
                },
                child: const Text("Save"),
              ),
            ),
          ],
        ),
      );
}
