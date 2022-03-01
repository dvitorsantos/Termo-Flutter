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
  int counter = 0;

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
                Word(),
                Word(),
                Word(),
                Word()
              ],
            )
        ),
      ),
    );
  }
}