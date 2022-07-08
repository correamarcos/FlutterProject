// ignore_for_file: prefer_const_constructors

import 'package:chat_flutter/config/constants.dart';
import 'package:chat_flutter/network/controllers/controller_register_login.dart';
import 'package:chat_flutter/pages/stores/login_store.dart';
import 'package:chat_flutter/styles/custom_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

ControllerRegisterLogin ctrl = ControllerRegisterLogin();
bool _value = true;
bool _obscure = true;

class _LoginPageState extends State<LoginPage> {
  LoginStore loginStore = LoginStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/backPng.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
            child: SizedBox(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                    child: Image.asset("assets/images/simbolo.png"),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: COR_SECUNDARIA,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                          color: GREY,
                          offset: Offset(0.5, 5.0), //(x,y)
                          blurRadius: 6.0,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Center(
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(top: 15, bottom: 20),
                              child: Text(
                                "Sign In",
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Observer(builder: (_) {
                            return CustomTextField(
                              label: "E-mail",
                              prefix: Icon(Icons.account_circle),
                              textInputType: TextInputType.emailAddress,
                              onChanged: loginStore.setEmail,
                              enabled: !loginStore.loading,
                              obscure: false,
                              padding: 20,
                            );
                          }),
                          SizedBox(height: 15),
                          Observer(builder: (_) {
                            return CustomTextField(
                              label: "Password",
                              prefix: Icon(Icons.lock),
                              textInputType: TextInputType.text,
                              onChanged: loginStore.setPassword,
                              enabled: !loginStore.loading,
                              obscure: loginStore.isInvisiblePass,
                              padding: 20,
                              suffix: IconButton(
                                icon: Icon(loginStore.isInvisiblePass
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                                onPressed: loginStore.setPassVisibility,
                              ),
                            );
                          }),
                          GestureDetector(
                            onTap: () {
                              print("clicou");
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, bottom: 15, left: 8),
                              child: Text("Forgot Password?"),
                            ),
                          ),
                          Observer(builder: (_) {
                            return ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 15),
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(30), // <-- Radius
                                  ),
                                ),
                                child: const Text(
                                  "Login",
                                  style: TextStyle(fontSize: 20),
                                ),
                                onPressed: loginStore.loading
                                    ? null
                                    : () {
                                        loginStore.loginPressed;
                                      }

                                // ? () {
                                //     // ctrl.autenticarUsuario(
                                //     //     "marcosga.correa@gmail.com", "123456;") == true
                                //     //     ? Navigator.pushReplacement(HomePage())
                                //     //     : ;
                                //   }
                                // : null,
                                );
                          }),
                          GestureDetector(
                            onTap: () {
                              print("clicou");
                            },
                            child: Padding(
                              padding: EdgeInsets.only(top: 15.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    "Don't have an account?",
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                  Text(
                                    " Sign Up",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                        color: COR_PRIMARIA),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
