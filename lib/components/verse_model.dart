class Verse {
  late String bookName;
  late int chapter;
  late int verse;
  late String text;

  Verse({
    required this.bookName,
    required this.chapter,
    required this.verse,
    required this.text,
  });

  factory Verse.fromJson(Map<String, dynamic> json) {
    return Verse(
      bookName: json['book_name'],
      chapter: json['chapter'],
      verse: json['verse'],
      text: json['text'],
    );
  }
}
