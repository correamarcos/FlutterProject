import 'package:chat_flutter/config/constants.dart';
import 'package:chat_flutter/pages/home.dart';
import 'package:chat_flutter/pages/login_page.dart';
import 'package:chat_flutter/pages/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shared_preferences/shared_preferences.dart';

bool _logado = false;
void main() async {
  Future<bool> verificarToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString('token') == null ? false : true;
  }

  verificarToken() == true ? _logado = true : _logado = false;

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: _logado ? HomePage() : LoginPage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: COR_PRIMARIA,
        fontFamily: 'Roboto',
      ),
    );
  }
}
