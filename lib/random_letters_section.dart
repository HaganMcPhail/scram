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
                color: usedLetters.contains(letter) ? Colors.grey : Colors.white,
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
