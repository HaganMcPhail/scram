import 'package:flutter/material.dart';
import 'package:scram/main.dart';

class CrosswordGrid extends StatefulWidget {
  final List<String> randomLetters;
  final List<String> usedLetters;
  final List<String> allowedLetters;
  final void Function(String, String) onLetterUsed;
  final CrosswordScreenState crosswordScreenState;

  const CrosswordGrid({
    super.key,
    required this.randomLetters,
    required this.allowedLetters,
    required this.usedLetters,
    required this.onLetterUsed,
    required this.crosswordScreenState
  });

  @override
  _CrosswordGridState createState() => _CrosswordGridState();
}

class _CrosswordGridState extends State<CrosswordGrid> {
  List<TextEditingController> controllers = List.generate(25, (_) => TextEditingController());
  List<String> previousTexts = List.generate(25, (_) => "");

  @override
  void dispose() {
    for (final controller in controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _onTextChanged(int index, String newText) {
    String oldText = previousTexts[index];

    if (newText.isEmpty && oldText.isNotEmpty) {
      // Backspace was pressed
      String lastLetter = oldText.toUpperCase();

      // Remove the last letter from usedLetters
      widget.onLetterUsed(lastLetter, "remove");
    } else if (!widget.allowedLetters.contains(newText.toUpperCase())) {
      if (newText.toUpperCase() != oldText.toUpperCase()) {
        newText = ''; // Clear the text if not allowed
      }
    } else if (newText.toUpperCase() != oldText.toUpperCase()) {
      widget.onLetterUsed(newText.toUpperCase(), "add");
    }

    controllers[index].value = TextEditingValue(
      text: newText.toUpperCase(),
      selection: TextSelection.fromPosition(
        TextPosition(offset: newText.length),
      ),
    );

    // Update the previous text
    previousTexts[index] = newText;

    setState(() {});
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
                counterText: '',
              ),
              onChanged: (newText) => _onTextChanged(index, newText),
            ),
          ),
        );
      },
    );
  }
}
