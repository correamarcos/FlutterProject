import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:complete_aplication/models/user.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FireBaseApp {
  FireBaseApp();

  Future<bool> cadastrarUsuario(UserModel usuario) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    //INICIANDO INTANCIA FIREBASE
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();

    String? email = '${usuario.email}';
    String? senha = '${usuario.password}';

    FirebaseAuth auth = FirebaseAuth.instance;
    return auth
        .createUserWithEmailAndPassword(email: email, password: senha)
        .then((firebaseUser) {
      dynamic user = firebaseUser.user;
      sharedPreferences.setString('token', '${auth.currentUser}');
      _cadastrarTabelaUser(usuario);
      return true;
    }).catchError((erro) {
      return false;
    });
  }

  void _cadastrarTabelaUser(UserModel usuario) async {
    //INICIANDO INTANCIA FIREBASE
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    FirebaseFirestore db = FirebaseFirestore.instance;

    String? nome = '${usuario.nome}';
    String? sobrenome = '${usuario.sobrenome}';
    String? genero = '${usuario.genero}';
    String? email = '${usuario.email}';
    String? senha = '${usuario.password}';

    //BUSCANDO DADOS DO USUARIO
    db.collection("usuarios").add({
      "nome": nome,
      "sobrenome": sobrenome,
      "genero": genero,
      "email": email,
      "password": senha,
    });
  }

  Future<bool> realizarLogin(String email, String senha) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    //INICIANDO INTANCIA FIREBASE
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();

    FirebaseAuth auth = FirebaseAuth.instance;

    return auth
        .signInWithEmailAndPassword(email: email, password: senha)
        .then((firebaseUser) {
      dynamic user = firebaseUser.user;
      print("Logar usuario: sucesso!! e-mail: " + user.email);
      sharedPreferences.setString('token', '${auth.currentUser}');
      return true;
    }).catchError((erro) {
      print("Logar usuario: erro " + erro.toString());
      return false;
    });
  }
}

//   FirebaseFirestore db = FirebaseFirestore.instance;

  //   DocumentReference ref = await db.collection("usuarios").add({
  //     "nome": usuario.nome,
  //     "sobrenome": usuario.sobrenome,
  //     "genero": usuario.genero,
  //     "email": usuario.email,
  //     "password": usuario.password,
  //   });
   /* Criando usuário com e-mail e senha */