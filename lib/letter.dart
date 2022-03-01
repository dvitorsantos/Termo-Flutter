import 'package:flutter/material.dart';

class Letter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: const TextField(
          maxLength: 1,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
          ),
          textAlign: TextAlign.center,
        ),
      )
    );
  }
}