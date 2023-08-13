import 'package:flutter/material.dart';
import 'crossword_grid.dart';
import 'random_letters_section.dart';
import 'utilities.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Scram Crossword',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CrosswordScreen(),
    );
  }
}

class CrosswordScreen extends StatefulWidget {
  @override
  CrosswordScreenState createState() => CrosswordScreenState();
}

class CrosswordScreenState extends State<CrosswordScreen> {
  List<String> randomLetters = generateRandomLetters(25);
  List<String> allowedLetters = [];
  List<String> usedLetters = [];

  void _onLetterUsed(String letter) {
    setState(() {
      allowedLetters.remove(letter);
      usedLetters.add(letter);
    });
  }

  @override
  Widget build(BuildContext context) {
    allowedLetters.addAll(randomLetters);

    return Scaffold(
      appBar: AppBar(
        title: const Text("SCRAM"),
      ),
      body: Column(
        children: [
          Expanded(
            child: CrosswordGrid(
              randomLetters: randomLetters,
              allowedLetters: allowedLetters,
              usedLetters: usedLetters,
              onLetterUsed: _onLetterUsed,
              crosswordScreenState: this,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: RandomLettersSection(randomLetters: randomLetters, allowedLetters: allowedLetters, usedLetters: usedLetters, crosswordScreenState: this),
          ),
        ],
      ),
    );
  }
}
