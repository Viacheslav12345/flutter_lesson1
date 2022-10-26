import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushReplacementNamed('/splashScreen');
          },
          icon: const Icon(Icons.repeat),
        ),
        title: const Text('Flutter - Урок 1'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              prefs.setBool('rememberMe', false);
              prefs.setBool('userTrue', false);
              Navigator.of(context).pushReplacementNamed('/authScreen');
            },
            icon: const Icon(Icons.output),
          ),
        ],
      ),
      body: const Center(
          child: Text(
        'ВІТАЮ!',
        style: TextStyle(
          fontSize: 55,
          color: Colors.red,
          fontWeight: FontWeight.bold,
        ),
      )),
    );
  }
}
