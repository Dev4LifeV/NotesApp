import 'package:flutter/material.dart';

class Injector extends InheritedWidget {
  const Injector({required Widget child, Key? key})
      : super(key: key, child: child);

  static Injector of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<Injector>() as Injector;

  @override
  bool updateShouldNotify(Injector old) => false;
}
