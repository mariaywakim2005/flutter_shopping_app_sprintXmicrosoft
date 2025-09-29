// import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:my_phone/welcome_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: "Suwannaphum"),
      home: WelcomeScreen(),
    );
  }
}

