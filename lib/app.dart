import 'package:flutter/material.dart';

import 'home.dart';

class app extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      theme: ThemeData.light(),
    );
  }
}