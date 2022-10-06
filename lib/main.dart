import 'package:flutter/material.dart';
import 'package:notes_app/app.dart';
import 'package:notes_app/injector.dart';

void main() => runApp(Injector(child: const App()).init());
