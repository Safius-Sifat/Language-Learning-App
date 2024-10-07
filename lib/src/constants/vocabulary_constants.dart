class Vocabulary {
  final String word;
  final String meaning;
  final String description;

  const Vocabulary(
      {required this.word, required this.meaning, required this.description});
}

const vocabularyConstants = [
  // the word should be german, the meanign should be in english, and give a long desciption of that word
  Vocabulary(word: 'Haus', meaning: 'House', description: 'A place to live'),
  Vocabulary(word: 'Hund', meaning: 'Dog', description: 'A pet animal'),
  Vocabulary(word: 'Katze', meaning: 'Cat', description: 'A pet animal'),
  Vocabulary(word: 'Auto', meaning: 'Car', description: 'A vehicle'),
  Vocabulary(word: 'Wasser', meaning: 'Water', description: 'A liquid'),
  Vocabulary(word: 'Buch', meaning: 'Book', description: 'A reading material'),
  Vocabulary(word: 'Stuhl', meaning: 'Chair', description: 'A furniture'),
  Vocabulary(word: 'Tisch', meaning: 'Table', description: 'A furniture'),
  Vocabulary(
      word: 'Fenster', meaning: 'Window', description: 'A part of a house'),
  Vocabulary(word: 'Tür', meaning: 'Door', description: 'A part of a house'),
  Vocabulary(word: 'Himmel', meaning: 'Sky', description: 'Above us'),
  Vocabulary(word: 'Sonne', meaning: 'Sun', description: 'A star'),
  Vocabulary(word: 'Mond', meaning: 'Moon', description: 'A satellite'),
  Vocabulary(word: 'Stern', meaning: 'Star', description: 'A celestial body'),
  Vocabulary(
      word: 'Wolke',
      meaning: 'Cloud',
      description: 'A collection of water droplets'),
  Vocabulary(
      word: 'Regen', meaning: 'Rain', description: 'Water droplets from sky'),
  Vocabulary(word: 'Schnee', meaning: 'Snow', description: 'Frozen water'),
  Vocabulary(word: 'Wind', meaning: 'Wind', description: 'Moving air'),
  Vocabulary(word: 'Blume', meaning: 'Flower', description: 'A plant'),
  Vocabulary(word: 'Baum', meaning: 'Tree', description: 'A plant'),
  Vocabulary(word: 'Gras', meaning: 'Grass', description: 'A plant'),
];
