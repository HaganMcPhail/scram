import 'package:flutter/material.dart';
import 'package:scram/crossword_grid.dart';
import 'package:scram/random_letters_section.dart';

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

class CrosswordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scram Crossword'),
      ),
      body: Column(
        children: [
          Flexible(
            child: CrosswordGrid(),
          ),
          SizedBox(height: 20),
          Flexible(
            child: RandomLettersSection(),
          ),
        ],
      ),
    );
  }
}


