import 'dart:convert';
import 'package:flutter/material.dart';

class Note {
  Note({
    String? title,
    String? description,
  })  : _title = title,
        _description = description;

  String? _title;
  String? _description;

  factory Note.fromLocalStorage(String data) {
    final Map localStorage = json.decode(data);

    return Note(
      title: localStorage['title'],
      description: localStorage['description'],
    );
  }

  Map<String, String> toJson() {
    final Map<String, String> doc = {};

    doc[UniqueKey().toString()] =
        '''{"title": "$title", "description": "$description"}''';

    return doc;
  }

  String get title => _title ?? '';
  String get description => _description ?? '';
}
