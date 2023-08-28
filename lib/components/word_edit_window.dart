import 'package:flutter/material.dart';

class WordEditingWindow extends StatelessWidget {

  WordEditingWindow({
    super.key,
    required this.wordController,
    required this.onCheck,
  });

  TextEditingController wordController;
  VoidCallback onCheck;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.green,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: wordController,
            maxLines: null,
            decoration: const InputDecoration(
              hintText: 'Scrie...',
              hintStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 15),
          ElevatedButton(
            onPressed: onCheck,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green.shade700,
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: const Text(
              'Check',
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
