import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool remeberMe = false;
  bool userTrue = false;

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      remeberMe = ((prefs.getBool('rememberMe') != null)
          ? prefs.getBool('rememberMe')
          : false)!;
      userTrue = ((prefs.getBool('userTrue') != null)
          ? prefs.getBool('userTrue')
          : false)!;
      (remeberMe && userTrue)
          ? Navigator.of(context).pushReplacementNamed('/welcomeScreen')
          : Navigator.of(context).pushReplacementNamed('/authScreen');
    });
  }

  @override
  Widget build(BuildContext context) {
    const image = AssetImage('images/image_flutter_lesson_1.png');
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
        title: const Text('Flutter - Урок 1'),
        centerTitle: true,
      ),
      body: const Center(
        child: Image(
          image: image,
        ),
      ),
    );
  }
}
