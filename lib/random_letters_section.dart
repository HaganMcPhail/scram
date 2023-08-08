import 'package:flutter/material.dart';

class RandomLettersSection extends StatelessWidget {
  final List<String> randomLetters;

  const RandomLettersSection({super.key, required this.randomLetters});

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
