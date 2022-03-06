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
  String dayWord = 'PRAIA';
  String attempt = '';
  List<Word> words = <Word>[
    Word(),
  ];

  isCorrectLetter(index) {
    return attempt[index] == dayWord[index];
  }

  isCorrectAnswer(attempt) {
    return attempt == dayWord.toUpperCase();
  }

  createAttempt(word) {
    String attempt = '';
    for (var letter in word.letters) {
      attempt += letter.value;
    }
    return attempt;
  }

  paintCorrectLetters(lastResultWord) {
    for (int i = 0; i < dayWord.length; i++) {
      if (isCorrectLetter(i)) {
        lastResultWord.letters[i].color = Colors.green;
      }
    }
    return lastResultWord;
  }

  paintExistingLetters(lastResultWord) {
    for (int i = 0; i < dayWord.length; i++) {
      for (int j = 0; j < attempt.length; j++) {
        if (dayWord[i] == attempt[j] &&
            !isCorrectLetter(j) &&
            !isCorrectLetter(i)) {
          lastResultWord.letters[j].color = Colors.yellow;
        }
      }
    }
    return lastResultWord;
  }

  updateLastWord(lastResultWord) {
    words[words.length - 1] = lastResultWord;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Titulo teste")),
      body: Container(
        child: Center(
            child: Column(
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
                  attempt = createAttempt(words.last);

                  Word lastResultWord = Word();
                  lastResultWord = paintCorrectLetters(lastResultWord);
                  lastResultWord = paintExistingLetters(lastResultWord);

                  updateLastWord(lastResultWord);

                  if (!isCorrectAnswer(attempt)) {
                    setState(() {
                      words.add(Word());
                    });
                  } else {
                    setState(() {
                      updateLastWord(lastResultWord);
                    });
                  }
                },
                child: Text("Try"))
          ],
        )),
      ),
    );
  }
}
