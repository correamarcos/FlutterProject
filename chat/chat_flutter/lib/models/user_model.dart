import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  late String _nome;
  late String _email;
  late String _password;
  String get nome => this._nome;

  set nome(String value) => this._nome = value;

  get email => this._email;

  set email(value) => this._email = value;

  get password => this._password;

  set password(value) => this._password = value;

  UserModel({
    nome,
    required email,
    required password,
  });
}
