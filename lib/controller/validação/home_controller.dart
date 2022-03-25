import 'package:flutter/material.dart';

import '../../modules/models/usuario/user_model.dart';

class HomePageController {
  final formKey = GlobalKey<FormState>();
  var user = const UserModel();

  String? validarFullNome(String? nome) {
    if (nome == null || nome.isEmpty) {
      return 'This field can\'t be empty';
    }
    if (nome.length < 7) {
      return 'Fiel name needs more 7 characters.(Has ${nome.length},)';
    }
    return null;
  }

  String? validarEmail(String? email) {
    // caso ele nao passe nao der match ele me retorna a frase,regex de email
    if (!RegExp(
      r'[a-zA-Z0-9.-_]+@[a-zA-Z0-9-_]+\..+',
    ).hasMatch(email ?? '')) {
      return 'This field can\'t be empty'; //Este campo não pode estar vazio
    }
    return null;
    //preencher os dados corretos
  }

  String? validarPassword(String? password) {
    if (password == null || password.isEmpty) {
      return 'This filed can\'t be empty';
    }
    if (password.length < 5) {
      return 'Fiel passowrd needs more 5 characters.(Has ${password.length},)';
    }
    return null;
  }

  String? validarPasswordConfirm(String? passwordConfirm) {
    if (passwordConfirm == null || passwordConfirm.isEmpty) {
      return 'This filed can\'t be empty';
    }
    if (passwordConfirm.length < 5) {
      return 'Fiel passowrd needs more 5 characters.(Has ${passwordConfirm.length},)';
    }
    return null;
  }
}
