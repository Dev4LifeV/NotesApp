import 'dart:convert';

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

  toJson() => json.encode(Note(title: _title, description: _description));

  String get title => _title ?? '';
  String get description => _description ?? '';
}
