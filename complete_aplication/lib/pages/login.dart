import 'package:complete_aplication/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../network/firebase.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> _loginKey = GlobalKey<FormState>();
  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Login'),
      ),
      body: Container(
        margin: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 50),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  color: Colors.grey[50],
                  width: 300,
                  child: Form(
                    key: _loginKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
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
                              return 'E-mail inválido';
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
                              return 'Senha inválida';
                            }
                            return null;
                          },
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 18),
                          child: ElevatedButton(
                            onPressed: () async {
                              if (_loginKey.currentState!.validate()) {
                                FireBaseApp fb = FireBaseApp();
                                bool resultado = await fb.realizarLogin(
                                    _controllerEmail.text,
                                    _controllerPassword.text);

                                resultado
                                    ? Navigator.pushReplacementNamed(
                                        context, AppRoutes.WELCOME)
                                    : ScaffoldMessenger.of(context)
                                        .showSnackBar(snackBar);
                              }
                            },
                            child: Text('Login'),
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.all(10),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
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
      ),
    );
  }

  final snackBar = SnackBar(
    content: Text(
      'E-mail ou senha incorretos',
      textAlign: TextAlign.center,
    ),
    backgroundColor: Colors.redAccent,
  );
}
