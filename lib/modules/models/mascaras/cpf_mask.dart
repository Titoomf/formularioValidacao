import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CpfMask extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var cpf = newValue.text;

    // regex para cpf ! diferente de
    if (cpf.length > 14) {
      return oldValue;
    }

    // vai remover tudo que nao é numero
    cpf = cpf.replaceAll(RegExp(r'\D'), '');
    // pegar cada um dos caracteres temos duas formar uma com split e outra com o flutter
    // final characteres = cpf.characters.toList();

    var formatted = '';

    for (var i = 0; i < cpf.characters.length; i++) {
      if ([3, 6, 9].contains(i)) {
        formatted += i == 9 ? '-' : '.';
      }
      // Stirng é um array de chaves
      formatted += cpf[i];
    }

    return newValue.copyWith(
      text: formatted,
      selection: TextSelection.fromPosition(
        TextPosition(
          offset: formatted.length,
        ),
      ),
    );
  }
}
