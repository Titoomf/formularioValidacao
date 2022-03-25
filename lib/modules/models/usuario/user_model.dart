import 'dart:convert';

import 'package:flutter/cupertino.dart';

@immutable
class UserModel {
  final String name;
  final String email;
  final String password;
  final String cpf;
  final String telefone;
  final String rg;
  const UserModel({
    this.name = '',
    this.email = '',
    this.password = '',
    this.cpf = '',
    this.telefone = '',
    this.rg = '',
  });

  UserModel copyWith({
    String? name,
    String? email,
    String? password,
    String? cpf,
    String? telefone,
    String? rg,
  }) {
    return UserModel(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      cpf: cpf ?? this.cpf,
      telefone: telefone ?? this.telefone,
      rg: rg ?? this.rg,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'cpf': cpf,
      'telefone': telefone,
      'rg': rg,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? '',
      cpf: map['cpf'] ?? '',
      telefone: map['telefone'] ?? '',
      rg: map['rg'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));
}
