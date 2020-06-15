import 'package:flutter/material.dart';
import 'package:netflixcopyapp/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final ThemeData myTheme = ThemeData(
    primaryColor: Color(0xFFFFFFFF),
    scaffoldBackgroundColor: Colors.black,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: myTheme,
      home: HomeScreen(),
    );
  }
}
