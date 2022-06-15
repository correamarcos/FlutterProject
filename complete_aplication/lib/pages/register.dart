import 'package:complete_aplication/network/firebase.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../models/user.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  FireBaseApp fb = FireBaseApp();

  GlobalKey _registerKey = GlobalKey();
  TextEditingController _controllerNome = TextEditingController();
  TextEditingController _controllerSobrenome = TextEditingController();
  TextEditingController _controllerGenero = TextEditingController();
  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Registro"),
      ),
      body: Container(
        margin: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Center(
            child: Container(
              margin: EdgeInsets.only(top: 100),
              padding: EdgeInsets.symmetric(horizontal: 10),
              color: Colors.black12,
              width: 300,
              height: 355,
              child: Form(
                key: _registerKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextFormField(
                      controller: _controllerNome,
                      decoration: InputDecoration(
                        labelText: "Nome",
                        border: InputBorder.none,
                      ),
                    ),
                    TextFormField(
                      controller: _controllerSobrenome,
                      decoration: InputDecoration(
                        labelText: "Sobrenome",
                        border: InputBorder.none,
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    TextFormField(
                      controller: _controllerEmail,
                      decoration: InputDecoration(
                        labelText: "E-mail",
                        border: InputBorder.none,
                      ),
                    ),
                    TextFormField(
                      controller: _controllerPassword,
                      decoration: InputDecoration(
                        labelText: "Password",
                        border: InputBorder.none,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 18),
                      child: ElevatedButton(
                        onPressed: () {
                          User u = User("Marcos", "Teste", "Masculino",
                              "marcos@email.com", "_password");
                          fb.cadastrar(u);
                        },
                        child: Text('Cadastrar'),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(10),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
