import 'package:bible_app/components/word_tile.dart';

class Verse {
  late String bookName;
  late int chapter;
  late int verse;
  List<WordTile> wordTileList;

  Verse({
    required this.bookName,
    required this.chapter,
    required this.verse,
    required this.wordTileList,
  });

  factory Verse.fromJson(Map<String, dynamic> json) {
    String text = json['text'];
    List<String> tempList = text.split(' ');
    List<WordTile> tempWordTileList = List<WordTile>.from(tempList);

    return Verse(
      bookName: json['book_name'],
      chapter: json['chapter'],
      verse: json['verse'],
      wordTileList: tempWordTileList,
    );
  }
}
