// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:jodel/pages/home_page.dart';
import 'package:jodel/pages/settings_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      routes: {
        '/settingsPage': (context) => SettingsPage(),
      },
      theme: ThemeData(
          primarySwatch: Colors.yellow,
          appBarTheme: AppBarTheme(backgroundColor: Colors.yellow)),
    );
  }
}
