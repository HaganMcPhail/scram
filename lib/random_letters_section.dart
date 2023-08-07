import 'dart:math';

import 'package:flutter/material.dart';

class RandomLettersSection extends StatelessWidget {
  final List<String> alphabet = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'];

  List<String> generateRandomLetters(int count) {
    final random = Random();
    List<String> randomLetters = [];
    for (int i = 0; i < count; i++) {
      randomLetters.add(alphabet[random.nextInt(alphabet.length)]);
    }
    randomLetters.sort();
    return randomLetters;
  }

  @override
  Widget build(BuildContext context) {
    final randomLetters = generateRandomLetters(25);

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          for (final letter in randomLetters)
            Container(
              width: 40,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
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

