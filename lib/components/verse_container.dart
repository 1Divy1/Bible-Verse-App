import 'dart:math';

import 'package:bible_app/components/verse_model.dart';
import 'package:bible_app/components/word_tile.dart';
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
        child: ListView.builder(
          itemCount: widget.verse.wordTileList.length,
          itemBuilder: (BuildContext context, int index) {
            return widget.verse.wordTileList[index];
          },
        ),
      ),
    );
  }
}
