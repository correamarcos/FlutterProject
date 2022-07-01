// ignore_for_file: prefer_const_constructors

import 'package:chat_flutter/config/constants.dart';
import 'package:flutter/cupertino.dart';
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
                          TextFormField(
                            decoration: InputDecoration(
                                label: Text("E-mail"),
                                contentPadding: EdgeInsets.only(left: 20),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30))),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 12, bottom: 12),
                            child: TextFormField(
                              decoration: InputDecoration(
                                  label: Text("Password"),
                                  contentPadding: EdgeInsets.only(left: 20),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30))),
                            ),
                          ),
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
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(30), // <-- Radius
                              ),
                            ),
                            onPressed: () {},
                            child: const Text(
                              "Login",
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              print("clicou");
                            },
                            child: Padding(
                              padding: EdgeInsets.only(top: 15.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
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
