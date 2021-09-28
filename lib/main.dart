import 'package:flutter/material.dart';
import 'package:sports_db/views/home/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sports DB',
      home: Home(),
    );
  }
}
