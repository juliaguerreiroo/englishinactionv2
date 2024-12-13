import 'package:flutter/material.dart';
import 'english_essentials_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: EnglishEssentialsScreen(),
    );
  }
}
