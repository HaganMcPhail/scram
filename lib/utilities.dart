import 'dart:math';

List<String> generateRandomLetters(int count) {
  final consonants = ['B', 'C', 'D', 'F', 'G', 'H', 'J', 'K', 'L', 'M', 'N', 'P', 'Q', 'R', 'S', 'T', 'V', 'W', 'X', 'Y', 'Z'];
  final vowels = ['A', 'E', 'I', 'O', 'U'];
  final random = Random();
  int numberOfVowels = random.nextInt(3) + 4; // 6-7
  int numberOfDistinctVowels = random.nextInt(2) + 2; // 2-4
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
  Map<String, int> consonantCount = {};
  for (int i = 0; i < count-numberOfVowels; i++) {
    String consonant;
    do {
      consonant = consonants[random.nextInt(consonants.length)];
    } while (consonantCount.containsKey(consonant) && consonantCount[consonant]! >= 2);
    
    randomLetters.add(consonant);
    if (consonantCount.containsKey(consonant)) {
      consonantCount[consonant] = consonantCount[consonant]! + 1;
    } else {
      consonantCount[consonant] = 1;
    }
  }
  randomLetters.sort();
  return randomLetters;
}
