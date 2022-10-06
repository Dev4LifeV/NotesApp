import 'dart:async';

import 'package:flutter/material.dart';
import 'package:notes_app/controller/controller_notes.dart';
import 'package:notes_app/injector.dart';
import 'package:notes_app/model/note.dart';
import 'package:notes_app/view/view_new_note.dart';

class ViewHome extends StatefulWidget {
  const ViewHome({super.key});

  @override
  State<ViewHome> createState() => _ViewHomeState();
}

class _ViewHomeState extends State<ViewHome> {
  @override
  void didChangeDependencies() {
    items = getNotes();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: appBar(),
        body: checkBody(),
        floatingActionButton: fab(context),
      );

  appBar() => AppBar();

  checkBody() => getNotes().isNotEmpty ? body() : emptyBody();

  late List<Note> items;

  body() {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) => ListTile(
              title: Text(items[index].title),
            ),
          ),
        )
      ],
    );
  }

  emptyBody() => const Center(
        child: Text(
          "You do not have notes yet. Press the + button to create a new note",
          textAlign: TextAlign.center,
        ),
      );

  fab(BuildContext context) => FloatingActionButton(
        tooltip: "New note",
        onPressed: () => Navigator.of(context)
            .push<List<Note>>(
              MaterialPageRoute(
                builder: (context) => ViewNewNote(),
              ),
            )
            .then<List<Note>>(_onNoteSaved),
        child: const Icon(Icons.add),
      );

  List<Note> getNotes() => Injector.of(context).controllerNotes.listNotes();

  FutureOr<List<Note>> _onNoteSaved(List<Note>? value) {
    items.clear();
    setState(() => items = getNotes());
    return items;
  }
}
