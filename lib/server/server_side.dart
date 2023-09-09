import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import '../verse/verse_model.dart';

class ServerSide {
  List<String> OldTestamentBooks = [
    'Geneza',
    'Exodul',
    'Leviticul',
    'Numeri',
    'Deuteronomul',
    'Iosua',
    'Judecatorii',
    'Rut',
    '1 Samuel',
    '2 Samuel',
    '1 Imparati',
    '2 Imparati',
    '1 Cronici',
    '2 Cronici',
    'Ezra',
    'Neemia',
    'Estera',
    'Iov',
    'Psalmii',
    'Proverbe',
    'Eclesiastul',
    'Cântarea cântărilor',
    'Isaia',
    'Ieremia',
    'Plângerile lui Ieremia',
    'Ezechiel',
    'Daniel',
    'Osea',
    'Ioel',
    'Amos',
    'Obadia',
    'Iona',
    'Mica',
    'Naum',
    'Habacuc',
    'Ţefania',
    'Hagai',
    'Zaharia',
    'Maleahi',
  ];

  Map<String, List<int>> NewTestamentBooks = {
    'Matei': [
      25,
      23,
      17,
      25,
      48,
      34,
      29,
      34,
      38,
      42,
      30,
      50,
      58,
      36,
      39,
      28,
      27,
      35,
      30,
      34,
      46,
      46,
      39,
      51,
      46,
      75,
      66,
      20,
    ],
    'Marcu': [
      45,
      28,
      35,
      41,
      43,
      56,
      37,
      38,
      50,
      52,
      33,
      44,
      37,
      72,
      47,
      20,
    ],
    'Luca': [
      80,
      2,
      8,
      4,
      9,
      9,
      0,
      6,
      2,
      42,
      54,
      59,
      35,
      35,
      32,
      31,
      37,
      43,
      48,
      47,
      38,
      71,
      56,
      53,
    ],
    'Ioan': [
      51,
      25,
      36,
      54,
      47,
      71,
      53,
      59,
      41,
      42,
      57,
      50,
      38,
      31,
      27,
      33,
      26,
      40,
      42,
      31,
      25,
    ],
    'Faptele apostolilor': [
      26,
      47,
      26,
      37,
      42,
      15,
      60,
      40,
      43,
      48,
      30,
      25,
      52,
      28,
      41,
      40,
      34,
      28,
      41,
      38,
      40,
      30,
      35,
      27,
      27,
      32,
      44,
      31,
    ],
    'Romani': [
      32,
      29,
      31,
      25,
      21,
      23,
      25,
      39,
      33,
      21,
      36,
      21,
      14,
      23,
      33,
      27,
    ],
    '1 Corinteni': [
      31,
      16,
      23,
      21,
      13,
      20,
      40,
      13,
      27,
      33,
      34,
      31,
      13,
      40,
      58,
      24,
    ],
    '2 Corinteni': [
      24,
      17,
      18,
      18,
      21,
      18,
      16,
      24,
      15,
      18,
      33,
      21,
      14,
    ],
    'Galateni': [
      24,
      21,
      29,
      31,
      26,
      18,
    ],
    'Efeseni': [
      23,
      22,
      21,
      32,
      33,
      24,
    ],
    'Filipeni': [
      30,
      30,
      21,
      23,
    ],
    'Coloseni': [
      29,
      23,
      25,
      18,
    ],
    '1 Tesaloniceni': [
      10,
      20,
      13,
      18,
      28,
    ],
    '2 Tesaloniceni': [
      12,
      17,
      18,
    ],
    '1 Timotei': [
      20,
      15,
      16,
      16,
      25,
      21,
    ],
    '2 Timotei': [
      18,
      26,
      17,
      22,
    ],
    'Tit': [
      16,
      15,
      15,
    ],
    'Filimon': [
      25,
    ],
    'Evrei': [
      14,
      18,
      19,
      16,
      14,
      20,
      28,
      13,
      28,
      39,
      40,
      29,
      25,
    ],
    'Iacov': [
      27,
      26,
      18,
      17,
      20,
    ],
    '1 Petru': [
      25,
      25,
      22,
      19,
      14,
    ],
    '2 Petru': [
      21,
      22,
      18,
    ],
    '1 Ioan': [
      10,
      29,
      24,
      21,
      21,
    ],
    '2 Ioan': [13],
    '3 Ioan': [15],
    'Iuda': [25],
    'Apocalipsa': [
      20,
      29,
      22,
      11,
      14,
      17,
      17,
      13,
      21,
      11,
      19,
      17,
      18,
      20,
      8,
      21,
      18,
      24,
      21,
      15,
      27,
      21,
    ],
  };

  Random random = Random();
  String baseUrl = 'https://bible-api.com';
  String bookName = '';
  int chapter = 0;
  int verse = 0;

  Future<Verse> getRandomVerse(/*int difficulty to be implemented*/) async {

    /* -- Alege o carte random din Noul Testament --
      creaza un index random de la 0 la lungimea listei NewTestamentBooks
      alege elementul care se afla la acel index 
    */
    bookName = NewTestamentBooks.keys.elementAt(random.nextInt(NewTestamentBooks.length));

    // alege un capitol random din cartea respectiva (de la 1 la cate capitole sunt in carte)
    chapter = random.nextInt(NewTestamentBooks[bookName]!.length) + 1;

    // alege un verset random din capitolul respectiv
    verse = random.nextInt(NewTestamentBooks[bookName]!.elementAt(chapter - 1 < 0 ? 0 : chapter - 1)) +1;

    // apelam server-ul
    var verseText = await http.get(Uri.parse('$baseUrl/$bookName $chapter:$verse?translation=rccv'));

    // decodam response-ul...
    const utf8decoder = Utf8Decoder();
    String responseBody = utf8decoder.convert(verseText.bodyBytes);
    var jsonResponse = json.decode(responseBody);

    List<dynamic> verseData = jsonResponse['verses'];

    Verse returnedVerse = Verse(
      bookName: '',
      chapter: 0,
      verse: 0,
      removedWord: '',
      tileIndexToModify: 0,
      wordTileList: [],
    );

    //Verse globalVerse = Verse.fromJson(verseData[0]);
    returnedVerse = Verse.fromJson(verseData[0]);

    // alegem un index random din wordTileList
    int randTileIndexToRemove = Random().nextInt(returnedVerse.wordTileList.length);
    returnedVerse.tileIndexToModify = randTileIndexToRemove;

    // stocam cuvantul pe care-l ascundem
    returnedVerse.removedWord = returnedVerse.wordTileList[randTileIndexToRemove].content;
    print('removed word ${returnedVerse.removedWord}');

    // si stergem textul din acel WordTile
    returnedVerse.wordTileList[randTileIndexToRemove].content = '______';

    // scoate ultimul cuvant
    returnedVerse.wordTileList.removeLast(); 

    return returnedVerse;
  }
}
