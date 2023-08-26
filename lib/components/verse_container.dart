import 'dart:math';

import 'package:bible_app/components/verse_model.dart';
import 'package:flutter/material.dart';

class VerseContainer extends StatefulWidget {
  VerseContainer({
    super.key,
    required this.verse,
  });

  Verse verse;

  @override
  State<VerseContainer> createState() => _VerseContainerState();
}

class _VerseContainerState extends State<VerseContainer> {

  String extractWords(String sentence) {
    List<String> words = sentence.split(' ');
    int numOfWordsToModify = 1;
    int randIndexToModify = Random().nextInt(words.length);

    return words.join(' ');
  }

  showText() {
    var words = extractWords(widget.verse.text);
    return words;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
        width: double.infinity,
        height: 500,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.green,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Flexible(
                child: Text(
                  showText().toString(),
                  strutStyle: const StrutStyle(height: 4),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                '${widget.verse.bookName} ${widget.verse.chapter} : ${widget.verse.verse}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
