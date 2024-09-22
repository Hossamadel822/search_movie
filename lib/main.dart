import 'package:flutter/material.dart';
import 'package:new_search/search_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark,
        // Dark theme like the image
      ),
      home: MovieSearchScreen(),
    );
  }
}
