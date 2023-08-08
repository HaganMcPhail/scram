import 'dart:math';

List<String> generateRandomLetters(int count) {
  final consonants = ['B', 'C', 'D', 'F', 'G', 'H', 'J', 'K', 'L', 'M', 'N', 'P', 'Q', 'R', 'S', 'T', 'V', 'W', 'X', 'Y', 'Z'];
  final vowels = ['A', 'E', 'I', 'O', 'U'];
  final random = Random();
  int numberOfVowels = random.nextInt(3) + 4; // 4-6
  int numberOfDistinctVowels = random.nextInt(2) + 2; // 2-3
  vowels.shuffle();

  List<String> randomLetters = [];
  List<String> randomVowels = [];

  // choose 2 or 3 distinct vowels
  randomVowels.addAll(vowels.sublist(0, numberOfDistinctVowels));
  randomLetters.addAll(randomVowels);
  
  for (int i = 0; i < numberOfVowels-numberOfDistinctVowels; i++) {
    randomLetters.add(randomVowels[random.nextInt(randomVowels.length)]);
  }

  // Add consonants
  for (int i = 0; i < count-numberOfVowels; i++) {
    randomLetters.add(consonants[random.nextInt(consonants.length)]);
  }
  randomLetters.sort();
  return randomLetters;
}
