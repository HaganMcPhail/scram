import 'package:flutter/material.dart';

class CrosswordGrid extends StatefulWidget {
  final List<String> randomLetters;

  CrosswordGrid({required this.randomLetters});

  @override
  _CrosswordGridState createState() => _CrosswordGridState();
}

class _CrosswordGridState extends State<CrosswordGrid> {
  List<TextEditingController> controllers = List.generate(25, (_) => TextEditingController());

  @override
  void dispose() {
    for (final controller in controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _onTextChanged(int index, String newText) {
    final allowedLetters = widget.randomLetters.toSet();
    if (!allowedLetters.contains(newText.toUpperCase())) {
      newText = ''; // Clear the text if not allowed
    }
    controllers[index].value = TextEditingValue(
      text: newText,
      selection: TextSelection.fromPosition(
        TextPosition(offset: newText.length),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5, // 5 columns
      ),
      itemCount: 25, // 5x5 grid
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
          ),
          child: Center(
            child: TextField(
              controller: controllers[index],
              maxLength: 1, // Allow only one character input
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),
              decoration: InputDecoration(
                border: InputBorder.none,
              ),
              onChanged: (newText) => _onTextChanged(index, newText),
            ),
          ),
        );
      },
    );
  }
}
