import 'package:animal_biography/screens/home_page.dart';
import 'package:animal_biography/screens/secondpage.dart';
import 'package:animal_biography/screens/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      routes: {
        '/': (context) => const splash_screen(),
        'home_page' : (context) => home_page(),
        'secondpage' : (context) => secondpage(),
      },
    ),
  );
}
