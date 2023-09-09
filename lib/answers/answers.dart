import 'package:bible_app/answers/answer_tile.dart';
import 'package:flutter/cupertino.dart';

class Answers extends StatefulWidget {
  Answers({
    super.key,
    required this.answers,
  });

  List<AnswerTile> answers;

  @override
  State<Answers> createState() => _AnswersState();
}

class _AnswersState extends State<Answers> {

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: widget.answers,
    );
  }
}
