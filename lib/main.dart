import 'package:facebook_ui_clone/config/palette.dart';
import 'package:facebook_ui_clone/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Facebool UI',
      theme: ThemeData(
        scaffoldBackgroundColor: Palette.scaffold,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}
