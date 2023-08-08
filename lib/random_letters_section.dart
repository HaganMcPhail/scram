import 'package:flutter/material.dart';

class RandomLettersSection extends StatelessWidget {
  final List<String> randomLetters;

  RandomLettersSection({required this.randomLetters});

  @override
  Widget build(BuildContext context) {
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
