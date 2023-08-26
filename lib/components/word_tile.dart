import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.blue,
      ),
      child: Text(
        widget.content,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
