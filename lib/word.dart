import 'package:flutter/material.dart';

import 'letter.dart';

class Word extends StatefulWidget {
  List <Letter> letters = <Letter>[
    Letter(),
    Letter(),
    Letter(),
    Letter(),
    Letter()
  ];

  @override
  State<StatefulWidget> createState() {
    return WordState();
  }
}

class WordState extends State<Word> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: widget.letters.map((letter) => letter).toList(),
        ),
      ],
    );
  }
}