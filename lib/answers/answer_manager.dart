import 'package:bible_app/answers/answer_tile.dart';
import 'package:bible_app/verse/verse_model.dart';
import 'package:diacritic/diacritic.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../components/word_tile.dart';

class AnswerManager {
  // checkAnswer(String answerOption) {
  //   // TESTING...
  //   print('cuvantul lipsa ${globalVerse.removedWord}');

  //   // aducem cuvintele la aceeasi forma (i.e. scapam de diacritice)
  //   String normalizedUserAnswer = removeDiacritics(answerOption);
  //   String normalizedRemovedWord = removeDiacritics(globalVerse.removedWord!);

  //   // verificam daca cuvantul ales de user e corect

  //   if (normalizedUserAnswer == normalizedRemovedWord) {
  //     globalVerse.updateMissingWord(); // actualizam cuvantul lipsa
  //     WordTileState().updateUI();

  //     return true;
  //   } 
  //   else {
  //     return false;
  //   }
  // }
}
