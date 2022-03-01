import 'package:flutter/material.dart';

import 'letter.dart';

class Word extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Letter(),
        Letter(),
        Letter(),
        Letter(),
        Letter()
      ],
    );
  }
}