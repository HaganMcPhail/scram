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
  _CrosswordScreenState createState() => _CrosswordScreenState();
}

class _CrosswordScreenState extends State<CrosswordScreen> {
  late final List<String> randomLetters = generateRandomLetters(25);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scram Crossword'),
      ),
      body: Column(
        children: [
          Flexible(
            child: CrosswordGrid(randomLetters: randomLetters),
          ),
          SizedBox(height: 20),
          Flexible(
            child: RandomLettersSection(randomLetters: randomLetters),
          ),
        ],
      ),
    );
  }
}
