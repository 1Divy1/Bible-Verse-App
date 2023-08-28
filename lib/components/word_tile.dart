import 'package:bible_app/components/word_edit_window.dart';
import 'package:diacritic/diacritic.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../shared.dart';

class WordTile extends StatefulWidget {
  WordTile({
    super.key,
    required this.content,
  });

  String content;

  @override
  State<WordTile> createState() => _WordTileState();
}

class _WordTileState extends State<WordTile> {
  TextEditingController wordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.blue,
      ),
      child: TextButton(
        onPressed: () {
          // TODO: gaseste o alta metoda de a verifica daca asta e tile-ul de modificat
          if (widget.content == '______') {
            showDialog(
              context: context,
              builder: (context) => WordEditingWindow(
                wordController: wordController,
                onCheck: () {
                  // verificam daca input-ul nu e gol
                  if (wordController.text.isNotEmpty) {
                    print('cuvantul lipsa ${globalVerse.removedWord}');

                    // aducem cuvintele la aceeasi forma (i.e. scapam de diacritice)
                    String normalizedUserInput = removeDiacritics(wordController.text);
                    String normalizedRemovedWord = removeDiacritics(globalVerse.removedWord!);

                    // verificam daca cuvantul din input e corect
                    if (normalizedUserInput == normalizedRemovedWord) {
                      Fluttertoast.showToast(
                        msg: "Corect!",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        backgroundColor: Colors.blue,
                        textColor: Colors.white,
                        fontSize: 18,
                      );

                      setState(() {
                        widget.content = wordController.text;
                        wordController.clear();
                      });

                      Navigator.pop(context);
                    }
                    else {
                      Fluttertoast.showToast(
                        msg: "Raspuns gresit",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        backgroundColor: Colors.blue,
                        textColor: Colors.white,
                        fontSize: 18,
                      );
                    }
                  } 
                  else if (wordController.text.isEmpty) {
                    Fluttertoast.showToast(
                      msg: "Nu ati scris nimic",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      backgroundColor: Colors.blue,
                      textColor: Colors.white,
                      fontSize: 18,
                    );
                  }
                },
              ),
            );
          }
        },
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            widget.content,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
            ),
          ),
        ),
      ),
    );
  }
}
