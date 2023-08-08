import 'dart:math';

List<String> generateRandomLetters(int count) {
  final alphabet = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'];
  final random = Random();
  List<String> randomLetters = [];
  for (int i = 0; i < count; i++) {
    randomLetters.add(alphabet[random.nextInt(alphabet.length)]);
  }
  randomLetters.sort();
  return randomLetters;
}
