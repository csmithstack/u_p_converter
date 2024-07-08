import 'package:flutter/material.dart';

class TitleWidget extends StatefulWidget {
  const TitleWidget({super.key});

  @override
  _TitleWidgetState createState() => _TitleWidgetState();
}

class _TitleWidgetState extends State<TitleWidget> {
  final TextEditingController _titleController =
      TextEditingController(text: 'Item');

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _titleController,
      textAlign: TextAlign.center,
      textAlignVertical: TextAlignVertical.top,
      cursorHeight: 20,
      maxLines: 1,
      maxLength: 20,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      decoration: const InputDecoration(
        counterText: '', // Hides the character count
        border: InputBorder.none,
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        contentPadding: EdgeInsets.symmetric(vertical: 0.0),
      ),
      keyboardType: TextInputType.text,
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }
}
