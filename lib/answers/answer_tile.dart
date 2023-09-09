import 'package:bible_app/answers/answer_manager.dart';
import 'package:bible_app/components/word_tile.dart';
import 'package:diacritic/diacritic.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AnswerTile extends StatefulWidget {
  AnswerTile({
    super.key,
    required this.bTileSelected,
    required this.answerOption,
  });

  bool bTileSelected;
  String answerOption;

  @override
  State<AnswerTile> createState() => _AnswerTileState();
}

class _AnswerTileState extends State<AnswerTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: widget.bTileSelected == true ? Colors.green : Colors.blue,
      ),
      child: TextButton(
        onPressed: () {
          // if (AnswerManager().checkAnswer(widget.answerOption) == true) {
            
          //   Fluttertoast.showToast(
          //     msg: "Corect!",
          //     toastLength: Toast.LENGTH_SHORT,
          //     gravity: ToastGravity.CENTER,
          //     backgroundColor: Colors.blue,
          //     textColor: Colors.white,
          //     fontSize: 18,
          //   );
          // } 
          // else {
          //   Fluttertoast.showToast(
          //     msg: "Raspuns gresit",
          //     toastLength: Toast.LENGTH_SHORT,
          //     gravity: ToastGravity.CENTER,
          //     backgroundColor: Colors.blue,
          //     textColor: Colors.white,
          //     fontSize: 18,
          //   );
          // }
        },
        child: Text(
          widget.answerOption,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
