import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:complete_aplication/models/user.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class FireBaseApp {
  FireBaseApp();

  void cadastrar(User usuario) async {
    //INICIANDO INTANCIA BANCO DE DADOS
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();

    FirebaseFirestore db = FirebaseFirestore.instance;

    DocumentReference ref = await db.collection("usuarios").add({
      "nome": usuario.nome,
      "sobrenome": usuario.sobrenome,
      "genero": usuario.genero,
      "email": usuario.email,
      "password": usuario.password,
    });
  }
}
