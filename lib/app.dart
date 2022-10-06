import 'package:flutter/material.dart';
import 'package:notes_app/view/view_home.dart';

class App extends MaterialApp {
  const App({Key? key}) : super(key: key);

  @override
  Widget get home => ViewHome();
}
