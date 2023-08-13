import 'dart:ffi';

import 'package:flutter/material.dart';
import 'crossword_grid.dart';
import 'random_letters_section.dart';
import 'utilities.dart';

void main() {
  FlutterError.onError = (FlutterErrorDetails details) {
    if (details.exceptionAsString().contains('KeyUpEvent is dispatched, but the state shows that the physical key is not pressed')) {
      return;
    }
    FlutterError.dumpErrorToConsole(details);
  };
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

  void initState() {
    super.initState();
    allowedLetters.addAll(randomLetters);
  }

  void _onLetterUsed(String letter, String action) {
    if (action == "add") {
      setState(() {
        allowedLetters.remove(letter);
        usedLetters.add(letter);
      });
    } else if (action == "remove") {
      setState(() {
        allowedLetters.add(letter);
        usedLetters.remove(letter);
      });
    }
    
  }

  @override
  Widget build(BuildContext context) {
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
