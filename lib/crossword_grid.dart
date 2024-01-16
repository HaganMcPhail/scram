import 'package:flutter/material.dart';
import 'package:scram/main.dart';
import 'package:flutter/services.dart' show rootBundle;

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

  // void _checkPuzzleSolved() async {
  //   List<String> inputWords = controllers.map((controller) => controller.text.toUpperCase()).toList();
  //   List<String> directions = ['E', 'S'];

  //   String getWord(String direction, int row, int col, int length) {
  //     String word = '';

  //     for (int i = 0; i < length; i++) {
  //       word += inputWords[row * 5 + col];

  //       switch (direction) {
  //         case 'E':
  //           col++;
  //           break;
  //         case 'S':
  //           row++;
  //           break;
  //       }

  //       // Check if we're out of bounds
  //       if (row >= 5 || col >= 5) {
  //         break;
  //       }
  //     }

  //     return word;
  //   }

  //   void checkWords() {
  //     for (int row = 0; row < 5; row++) {
  //       for (int col = 0; col < 5; col++) {
  //         for (String direction in directions) {
  //           String word = getWord(direction, row, col, 5); // Change 5 to the maximum word length you want to check
  //           if (widget.wordList.contains(word)) {
  //             print('$word is in the word list');
  //           } else {
  //             print('$word is not in the word list');
  //           }
  //         }
  //       }
  //     }
  //   }

  //   // Load the word list from the file
  //   String wordListString = await rootBundle.loadString('assets/word-list-output.txt');
  //   widget.wordList = wordListString.split('\n');

  //   // Check if any of the input words are in the word list
  //   checkWords();
  // }

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

    // Check if the puzzle is solved
    // _checkPuzzleSolved();
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
