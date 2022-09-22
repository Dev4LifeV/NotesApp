import 'package:flutter/material.dart';
import 'package:notes_app/view/view_new_note.dart';

class ViewHome extends StatelessWidget {
  const ViewHome({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: appBar(),
        body: emptyBody(),
        floatingActionButton: fab(context),
      );

  appBar() => AppBar();

  body() => Column(
        children: [ListView()],
      );

  emptyBody() => const Center(
        child: Text(
          "You do not have notes yet. Press the + button to create a new note",
          textAlign: TextAlign.center,
        ),
      );

  fab(BuildContext context) => FloatingActionButton(
        tooltip: "New note",
        onPressed: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => ViewNewNote())),
        child: const Icon(Icons.add),
      );
}
