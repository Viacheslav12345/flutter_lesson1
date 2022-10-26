import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool rememberMe = false;

  final loginTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  Widget _inputTextField(
    Icon icon,
    String hint,
    TextEditingController controller,
    bool obscure,
  ) {
    return TextField(
      controller: controller,
      obscureText: obscure,
      style: const TextStyle(
        fontSize: 18,
        color: Color(0xFF404040),
        fontWeight: FontWeight.w600,
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        isCollapsed: true,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: IconTheme(
            data: const IconThemeData(
              color: Color.fromARGB(255, 174, 171, 171),
            ),
            child: icon,
          ),
        ),
        hintText: hint,
        hintStyle: const TextStyle(
          fontSize: 17,
          color: Color.fromARGB(255, 174, 171, 171),
        ),
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            borderSide: BorderSide.none),
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(30)),
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor,
            style: BorderStyle.solid,
            width: 2,
          ),
        ),
      ),
    );
  }

  void userTrue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('userTrue', true);
  }

  Widget _button(String text) {
    return ElevatedButton(
      onPressed: () => {
        (loginTextController.text == 'admin' &&
                passwordTextController.text == '123456')
            ? setState(() {
                userTrue();
                Navigator.of(context).pushReplacementNamed('/welcomeScreen');
              })
            : Fluttertoast.showToast(
                msg: "Ви ввели неправильний логін чи пароль! Спробуйте ще раз!",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 2,
                backgroundColor: Colors.pink.shade300,
                textColor: Colors.white,
                fontSize: 16.0),
      },
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
        backgroundColor:
            MaterialStateProperty.all(Theme.of(context).primaryColor),
        foregroundColor: MaterialStateProperty.all(Colors.white),
        textStyle: MaterialStateProperty.all(
          const TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
        ),
        padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(horizontal: 40, vertical: 15)),
      ),
      child: Text(text),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 40,
          centerTitle: true,
          title: const Text('Авторизація'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 40),
                _inputTextField(const Icon(Icons.login), "ЛОГІН",
                    loginTextController, false),
                const SizedBox(height: 20),
                _inputTextField(const Icon(Icons.lock), "ПАРОЛЬ",
                    passwordTextController, true),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            Checkbox(
                              value: rememberMe,
                              onChanged: (bool? value) async {
                                rememberMe = value!;
                                SharedPreferences prefs =
                                    await SharedPreferences.getInstance();
                                prefs.setBool('rememberMe', value);
                                setState(() {});
                              },
                            ),
                            const Text("Запам'ятати"),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(width: 100),
                    _button('Далі'),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
