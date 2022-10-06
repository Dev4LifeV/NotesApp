import 'package:flutter/material.dart';
import 'package:notes_app/controller/controller_notes.dart';
import 'package:notes_app/repository/repository_notes.dart';

class Injector extends InheritedWidget {
  Injector init() {
    _repositoryNotes = RepositoryNotes();
    _controllerNotes = ControllerNotes(_repositoryNotes);
    return this;
  }

  late final ControllerNotes _controllerNotes;
  late final RepositoryNotes _repositoryNotes;

  Injector({
    required Widget child,
    Key? key,
  }) : super(
          key: key,
          child: child,
        );

  static Injector of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<Injector>() as Injector;

  @override
  bool updateShouldNotify(Injector old) => false;

  ControllerNotes get controllerNotes => _controllerNotes;
  RepositoryNotes get repositoryNotes => _repositoryNotes;
}
