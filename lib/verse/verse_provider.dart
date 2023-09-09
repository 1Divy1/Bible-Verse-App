import 'package:bible_app/server/server_side.dart';
import 'package:flutter/material.dart';
import '../answers/answer_tile.dart';
import 'verse_model.dart';

class VerseProvider with ChangeNotifier {
  VerseProvider() {
    currentVerse = Verse(
      bookName: '',
      chapter: 0,
      verse: 0,
      wordTileList: [],
    );
  }

  final ServerSide _serverApi = ServerSide();
  late Verse currentVerse;
  List<AnswerTile> answers = [];

  List<String> possibleAnswers = [
    'ca',
    'sa',
    'Petru',
    'Pavel',
    'Isus',
    'pentru',
    'oare',
    'datorita',
    'Iuda',
    'vanzare',
    'deoarece',
    'cereti',
    'pus',
  ];

  updateMissingWord() {
    currentVerse.wordTileList[currentVerse.tileIndexToModify!].content = currentVerse.removedWord!;
    notifyListeners();
  }

  fetchRandomVerse() async {
    try {
      currentVerse = await _serverApi.getRandomVerse();

      for (var word in currentVerse.wordTileList) {
        print(word.content);
      }

      // TODO: gaseste o metoda mai buna de a adauga raspunsurile
      // answers.clear();
      // answers.add(
      //   AnswerTile(
      //     bTileSelected: false,
      //     answerOption: currentVerse.removedWord!,
      //   ),
      // );
      // answers.add(
      //   AnswerTile(
      //     bTileSelected: false,
      //     answerOption:
      //         possibleAnswers[Random().nextInt(possibleAnswers.length)],
      //   ),
      // );
      // answers.add(
      //   AnswerTile(
      //     bTileSelected: false,
      //     answerOption:
      //         possibleAnswers[Random().nextInt(possibleAnswers.length,)],
      //   ),
      // );
      // answers.shuffle();

      notifyListeners();
    } 
    catch (e) {
      print('Error fetching random verse: $e');
    }
  }
}
