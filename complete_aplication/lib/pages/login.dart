import 'package:complete_aplication/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Login'),
      ),
      body: Container(
        margin: EdgeInsets.all(16),
        child: Center(
          child: Column(
            children: [
              Container(
                width: 200,
                height: 200,
                color: Colors.black,
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(AppRoutes.REGISTER);
                },
                child: Text("Registrar-se"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
