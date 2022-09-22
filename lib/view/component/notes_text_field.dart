import 'package:flutter/material.dart';

class NotesTextField extends StatelessWidget {
  NotesTextField({
    String hintText = '',
    double width = 250,
    int? minLines,
    int? maxLines,
    super.key,
  })  : _hintText = hintText,
        _width = width,
        _minLines = minLines,
        _maxLines = maxLines;

  final TextEditingController controller = TextEditingController();

  final String _hintText;
  final double _width;
  final int? _minLines;
  final int? _maxLines;

  @override
  Widget build(BuildContext context) {
    final InputBorder outlineBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(
        color: Theme.of(context).primaryColor,
        width: 1.5,
      ),
    );

    return SizedBox(
      width: _width,
      child: TextField(
        keyboardType: TextInputType.multiline,
        minLines: _minLines,
        maxLines: _maxLines,
        controller: controller,
        decoration: InputDecoration(
          hintText: _hintText,
          border: outlineBorder,
          focusedBorder: outlineBorder,
          enabledBorder: outlineBorder,
        ),
      ),
    );
  }
}
