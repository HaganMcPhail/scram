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
    double containerHeight = screenHeight * 7 / 100;
    double containerWidth = screenWidth * 4 / 100;

    return Wrap(
      children: randomLetters.asMap().entries.map((entry) {
        int idx = entry.key;
        String letter = entry.value;
        int letterCountInRandom = randomLetters.sublist(0, idx + 1).where((l) => l == letter).length;
        int letterCountInUsed = usedLetters.where((l) => l == letter).length;
        return Container(
          width: containerWidth * 2,
          height: containerHeight,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            color: letterCountInUsed >= letterCountInRandom ? Colors.grey : Colors.white,
          ),
          child: Center(
            child: Text(
              letter,
              style: TextStyle(fontSize: 20),
            ),
          ),
        );
      }).toList(),
    );
  }
}