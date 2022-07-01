import 'package:chat_flutter/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ControllerRegisterLogin {
  ControllerRegisterLogin();

  initializerFirebase() async {
    WidgetsFlutterBinding.ensureInitialized();
    return await Firebase.initializeApp();
  }

  Future<bool> autenticarUsuario(String user_email, String user_pass) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    initializerFirebase();
    FirebaseAuth auth = FirebaseAuth.instance;

    return auth
        .signInWithEmailAndPassword(email: user_email, password: user_pass)
        .then((firebaseUser) {
      dynamic user = firebaseUser.user;
      sharedPreferences.setString('token', '${auth.currentUser!.uid}');
      print("Logar usuario: sucesso!! e-mail: " + user.email);
      return true;
    }).catchError((erro) {
      print("Logar usuario: erro " + erro.toString());
      return false;
    });
  }

  Future recuperarUsuario() async {
    initializerFirebase();
    FirebaseAuth auth = FirebaseAuth.instance;
  }
}
