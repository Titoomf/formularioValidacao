import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore: camel_case_types
class telefoneMask extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var telefone = newValue.text;

    // regex para phone ! diferente de
    if (telefone.length > 14) {
      return oldValue;
    }

    telefone = telefone.replaceAll(RegExp(r'\D'), '');

    var formatted = '';
    final characteres = telefone.characters.toList();
    for (var i = 0; i < characteres.length; i++) {
      if (i == 0) {
        formatted += '(';
        formatted += characteres[i];
      } else if (i == 2) {
        formatted += ')';
        formatted += characteres[i];
      } else if (i == 7) {
        formatted += '-';
        formatted += characteres[i];
      } else {
        formatted += characteres[i];
      }
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
