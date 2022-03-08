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
        lastResultWord.letters[i].color = Color.fromRGBO(55, 164, 151, 1);
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
          lastResultWord.letters[j].color = Color.fromRGBO(212, 173, 107, 1);
        }
      }
    }
    return lastResultWord;
  }

  paintNotExistingLetters(lastResultWord) {
    for (int i = 0; i < attempt.length; i++) {
      bool letterExists = false;
      for (int j = 0; j < dayWord.length; j++) {
        if (attempt[i] == dayWord[j]) {
          letterExists = true;
        }
      }
      if (!letterExists) {
        lastResultWord.letters[i].color = Color.fromARGB(46, 44, 45, 1);
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
      body: Container(
        decoration: new BoxDecoration(
          color: Color.fromRGBO(111, 92, 98, 1),
        ),
        child: Center(
            child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text(
                "TERMO",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'FredokaOne'
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
                  lastResultWord = paintNotExistingLetters(lastResultWord);

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
