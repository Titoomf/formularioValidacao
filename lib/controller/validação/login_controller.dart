import 'package:flutter/material.dart';

import '../../modules/models/usuario/user_model.dart';

// ignore: camel_case_types
class loginPageController {
  final formKey = GlobalKey<FormState>();
  var user = const UserModel();

  String? validarNome(String? nome) {
    if (nome == null || nome.isEmpty) {
      return 'This field can\'t be empty';
    }
    if (nome.length < 5) {
      return 'Fiel name needs more 5 characters.(Has ${nome.length},)';
    }
    return null;
  }

  String? validarCpf(String? cpf) {
    if (!RegExp(r'^\d{3}\.\d{3}\.\d{3}\-\d{2}$').hasMatch(cpf ?? '')) {
      return 'Error in cpf, enter a true cpf';
    }
    return null;
  }

  String? validarPhone(String? phone) {
    if (!RegExp(r'^\(?\d{2}\)?[\s-]?[\s9]?\d{4}-?\d{4}$')
        .hasMatch(phone ?? '')) {
      return 'Error in phone,enter a true phone';
    }
    return null;
  }

  String? validarRg(String? nome) {
    if (nome == null || nome.isEmpty) {
      return 'This field can\'t be empty';
    }
    if (nome.length < 7) {
      return 'Fiel name needs more 7 characters.(Has ${nome.length},)';
    }
    return null;
  }
}
