import 'package:flutter/material.dart';

class DifficultyItem extends StatefulWidget {
  DifficultyItem({
    super.key,
    required this.difficultyLevel,
    required this.isSelected,
  });

  String difficultyLevel;
  bool isSelected = false;

  @override
  State<DifficultyItem> createState() => _DifficultyItemState();
}

class _DifficultyItemState extends State<DifficultyItem> {
  
  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 1.5,
      child: ElevatedButton(
        onPressed: () => setState(() => widget.isSelected = !widget.isSelected),
        style: ElevatedButton.styleFrom(
          backgroundColor: widget.isSelected == true ? Colors.green : Colors.blue,
          elevation: 10,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ),
        child: Text(widget.difficultyLevel),
      ),
    );
  }
}
