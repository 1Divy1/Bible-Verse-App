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
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.transparent.withOpacity(0.2),
        ),
        child: Column(
          children: [
            // versetul
            SingleChildScrollView(
              child: Wrap(
                alignment: WrapAlignment.center,
                spacing: 5,
                runSpacing: 15,
                children: widget.verse.wordTileList,
              ),
            ),
            const SizedBox(height: 10),
            // referinta
            Text(
              '${widget.verse.bookName} ${widget.verse.chapter} : ${widget.verse.verse}',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
