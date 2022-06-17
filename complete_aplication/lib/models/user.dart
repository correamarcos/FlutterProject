class UserModel {
  String _nome;
  String _sobrenome;
  String _genero;
  String _email;
  String _password;

  get nome => this._nome;

  set nome(value) => this._nome = value;

  get sobrenome => this._sobrenome;

  set sobrenome(value) => this._sobrenome = value;

  get genero => this._genero;

  set genero(value) => this._genero = value;

  get email => this._email;

  set email(value) => this._email = value;

  get password => this._password;

  set password(value) => this._password = value;

  UserModel(
    this._nome,
    this._sobrenome,
    this._genero,
    this._email,
    this._password,
  );
}
