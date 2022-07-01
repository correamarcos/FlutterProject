import 'package:chat_flutter/config/constants.dart';
import 'package:chat_flutter/pages/home.dart';
import 'package:chat_flutter/pages/login_page.dart';
import 'package:chat_flutter/pages/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: COR_PRIMARIA,
        fontFamily: 'Roboto',
      ),
    );
  }
}
