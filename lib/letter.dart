import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Letter extends StatelessWidget {

  String value = "";
  
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
            border: OutlineInputBorder(),
          ),
          textAlign: TextAlign.center,
          onChanged: (text) {
            value = text;
          }
        ),
      )
    );
  }
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}