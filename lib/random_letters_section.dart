import 'package:flutter/material.dart';
import 'package:scram/main.dart';

class RandomLettersSection extends StatelessWidget {
  final List<String> randomLetters;
  final List<String> usedLetters;
  final List<String> allowedLetters;

  const RandomLettersSection({super.key, required this.randomLetters, required this.allowedLetters, required this.usedLetters, required CrosswordScreenState crosswordScreenState});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    double containerHeight = screenHeight * 10 / 100;
    double containerWidth = screenWidth * 4 / 100;

    Map<String, int> randomLettersCount = {};
    for (var letter in randomLetters) {
      if (!randomLettersCount.containsKey(letter)) {
        randomLettersCount[letter] = 1;
      } else {
        randomLettersCount[letter] = (randomLettersCount[letter] ?? 0) + 1;
      }
    }

    Map<String, int> usedLettersCount = {};
    for (var letter in usedLetters) {
      if (!usedLettersCount.containsKey(letter)) {
        usedLettersCount[letter] = 1;
      } else {
        usedLettersCount[letter] = (usedLettersCount[letter] ?? 0) + 1;
      }
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          for (final letter in randomLetters)
            Container(
              width: containerWidth,
              height: containerHeight,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                color: (usedLettersCount[letter] ?? 0) >= (randomLettersCount[letter] ?? 0) ? Colors.grey : Colors.white,
              ),
              child: Center(
                child: Text(
                  letter,
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
        ],
      ),
    );
  }
}