import 'package:flutter/material.dart';
import 'dashboard.dart';

import 'welcome.dart';
import 'login.dart';
import 'register.dart';
import 'newHabit.dart';
import 'newHabitMain.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: const WelcomePage(),
    );
  }
}