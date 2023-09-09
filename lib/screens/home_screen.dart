import 'package:bible_app/components/difficulty_item.dart';
import 'package:bible_app/verse/verse_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../verse/verse_provider.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // TODO: de implementat
          // alege dificultatea (i.e. cate cuvinte sa lipseasca din verset)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              DifficultyItem(difficultyLevel: 'Usor', isSelected: true),
              DifficultyItem(difficultyLevel: 'Mediu', isSelected: false),
              DifficultyItem(difficultyLevel: 'Greu', isSelected: false),
            ],
          ),

          // aici se afiseaza textul versetului
          const VerseWidget(),

          // variantele de raspunsuri
          // TODO: Answers(answers: answers),

          Transform.scale(
            // butonul care aduce un verset nou din baza de date (refresh)
            scale: 1.75,
            child: ElevatedButton(
              // TODO: alege automat cartea, capitolul, si versetul in functie de dificultate
              onPressed: () => context.read<VerseProvider>().fetchRandomVerse(),
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
