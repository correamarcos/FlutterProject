import 'package:complete_aplication/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TextButton(
        onPressed: () async {
          SharedPreferences sh = await SharedPreferences.getInstance();
          sh.clear();
          Navigator.pushReplacementNamed(context, AppRoutes.WELCOME);
        },
        child: Text('Sair'),
      ),
    );
  }
}
