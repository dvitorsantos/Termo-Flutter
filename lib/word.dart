import 'package:flutter/material.dart';

import 'letter.dart';

class Word extends StatelessWidget {

  String value = '';

  List <Letter> letters = <Letter>[
    Letter(),
    Letter(),
    Letter(),
    Letter(),
    Letter()
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: letters.map((letter) => letter).toList(),
        ),
      ],
    );
  }
}