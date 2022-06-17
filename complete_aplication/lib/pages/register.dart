import 'package:complete_aplication/network/firebase.dart';
import 'package:complete_aplication/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../models/user.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

_validaCampos(String nome, String email, String genero, String enderecoEmail,
    String senha) {}

class _RegisterPageState extends State<RegisterPage> {
  GlobalKey<FormState> _registerKey = GlobalKey<FormState>();
  TextEditingController _controllerNome = TextEditingController();
  TextEditingController _controllerSobrenome = TextEditingController();
  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerPassword = TextEditingController();
  String? _controllerGenero;

  bool _valueRadio = false;

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
              margin: EdgeInsets.only(top: 50),
              padding: EdgeInsets.symmetric(horizontal: 10),
              color: Colors.grey[50],
              width: 300,
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
                      child: RadioListTile(
                        title: Text("Masculino"),
                        value: 'm',
                        groupValue: _controllerGenero,
                        onChanged: (String? value) {
                          setState(() {
                            _controllerGenero = value!;
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      child: RadioListTile(
                        title: Text("Feminino"),
                        value: 'f',
                        groupValue: _controllerGenero,
                        onChanged: (String? value) {
                          setState(() {
                            _controllerGenero = value!;
                          });
                        },
                      ),
                    ),
                    TextFormField(
                      controller: _controllerEmail,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: "E-mail",
                        border: InputBorder.none,
                      ),
                      validator: (email) {
                        if (email == null || email.trim().isEmpty) {
                          return 'Digite seu e-mail';
                        } else if (!RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(_controllerEmail.text)) {
                          return 'Digite um e-mail válido';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _controllerPassword,
                      obscureText: true,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: "Password",
                        border: InputBorder.none,
                      ),
                      validator: (senha) {
                        if (senha == null || senha.length < 6) {
                          return 'A senha deve possuir 6 caracteres ou mais';
                        }
                        return null;
                      },
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 18),
                      child: ElevatedButton(
                        onPressed: () async {
                          if (_registerKey.currentState!.validate()) {
                            UserModel u = UserModel(
                                _controllerNome.text,
                                _controllerSobrenome.text,
                                _controllerGenero!,
                                _controllerEmail.text,
                                _controllerPassword.text);

                            FireBaseApp fb = FireBaseApp();
                            bool resultado = await fb.cadastrarUsuario(u);
                            resultado
                                ? Navigator.pushReplacementNamed(
                                    context, AppRoutes.WELCOME)
                                : ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                          }
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

  final snackBar = SnackBar(
    content: Text(
      'E-mail já cadastrado',
      textAlign: TextAlign.center,
    ),
    backgroundColor: Colors.redAccent,
  );
}
