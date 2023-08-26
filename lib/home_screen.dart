import 'package:bible_app/components/difficulty_item.dart';
import 'package:bible_app/components/verse_container.dart';
import 'package:bible_app/server_side.dart';
import 'package:flutter/material.dart';

import 'components/verse_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Verse verse = Verse(bookName: '', chapter: 0, verse: 0, text: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              DifficultyItem(difficultyLevel: 'Usor', isSelected: true),
              DifficultyItem(difficultyLevel: 'Mediu', isSelected: false),
              DifficultyItem(difficultyLevel: 'Greu', isSelected: false),
            ],
          ),
          VerseContainer(verse: verse),
          Transform.scale(
            scale: 1.75,
            child: ElevatedButton(
              // TODO: alege automat cartea, capitolul, si versetul in functie de dificultate
              onPressed: () async {
                try {
                  var tempValue = await ServerSide().getRandomVerse(0);
                  Verse tempVerse = tempValue;

                  setState(() => verse = tempVerse);
                } 
                catch (e) {
                  print('exception $e');
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text('Refresh'),
            ),
          ),
        ],
      ),
    );
  }
}
