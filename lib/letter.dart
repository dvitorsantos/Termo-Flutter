import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Letter extends StatefulWidget {
  String value = "";
  Color color = Color.fromRGBO(111, 92, 98, 1);

  @override
  State<StatefulWidget> createState() {
    return LetterState();
  }
}

class LetterState extends State<Letter> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: TextField(
          maxLength: 1,
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp('[a-zA-Z]')),
            UpperCaseTextFormatter(),
          ],
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Color.fromRGBO(76, 66, 70, 1), width: 4.0),
            ),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Color.fromRGBO(76, 66, 70, 1), width: 4.0)),
            fillColor: widget.color,
            filled: true,
          ),
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontFamily: 'FredokaOne'
            ),
          textAlign: TextAlign.center,
          onChanged: (text) {
            widget.value = text;
          }),
    ));
  }
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}
