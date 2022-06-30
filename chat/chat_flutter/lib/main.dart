import 'package:chat_flutter/config/constants.dart';
import 'package:chat_flutter/pages/welcome_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
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
      home: const WelcomePage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: COR_PRIMARIA,
        fontFamily: 'Roboto',
      ),
    );
  }
}
