import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'word.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {

  String word = '';
  String attempt = '';
  List <Word> words = <Word>[
    Word(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Titulo teste")),
      body: Container(
        child: Center(
          child: 
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    "Guess the day word!",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),      
                ),
                Column(
                  children: words.map((letter) => letter).toList(),
                ),
                ElevatedButton(
                  onPressed: () {
                    attempt = '';
                    for (var letter in words.last.letters) {
                      attempt += letter.value;
                    }
                }, child: Text("Try"))
              ],
            )
        ),
      ),
    );
  }
}