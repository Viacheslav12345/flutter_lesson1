import 'package:flutter/material.dart';
import 'package:flutter_lesson_1/splash_screen.dart';

import 'auth_screen.dart';
import 'welcome.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lesson 1',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      routes: {
        '/splashScreen': (context) => const SplashScreen(),
        '/authScreen': (context) => const AuthScreen(),
        '/welcomeScreen': (context) => const WelcomeScreen(),
      },
      home: const SplashScreen(),
    );
  }
}
