import 'package:bible_app/verse/verse_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VerseWidget extends StatelessWidget {
  const VerseWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final verseProvider = Provider.of<VerseProvider>(context);

    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 40),
      child: Container(
        constraints: BoxConstraints(
          // limita maxima de expandare este de 80% din ecran
          maxHeight: MediaQuery.of(context).size.height * 0.75, 
        ),
        padding: const EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 10),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.transparent.withOpacity(0.2),
        ),
        child: ListView(
          shrinkWrap: true,
          children: [
            // versetul
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 5,
              runSpacing: 15,
              children: verseProvider.currentVerse.wordTileList,
            ),
            const SizedBox(height: 10),
            // referinta
            Center(
              child: Text(
                '${verseProvider.currentVerse.bookName} ${verseProvider.currentVerse.chapter} : ${verseProvider.currentVerse.verse}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
