import 'package:flutter/material.dart';

import 'day1_page.dart';
import 'day2_page.dart';
import 'day3_page.dart';
import 'day4_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Day4Page(),
    );
  }
}

