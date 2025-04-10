import 'package:flutter/material.dart';

class Responsavel with ChangeNotifier {
  // dadosResponsável = [nome, parentesco, cpf, celular, nascimento, rg, email]
  String nome = 'nome';
  String parentesco = 'nome';
  String cpf = 'nome';
  String celular = 'nome';
  String nascimento = 'nome';
  String rg = 'nome';
  String email = 'nome';

  Responsavel({
    String nome = 'nome',
    String parentesco = 'nome',
    String cpf = 'nome',
    String celular = 'nome',
    String nascimento = 'nome',
    String rg = 'nome',
    String email = 'nome'
  });

  @override
  String toString() {
    return 'Responsavel(nome: $nome, parentesco: $parentesco, cpf: $cpf, celular: $celular, nascimento: $nascimento, rg: $rg, email: $email)';
  }

  String getNome() {
    return nome;
  }
  void setNome(String value) => nome = value;

  String getParentesco() {
    return parentesco;
  }
  void setParentesco(String value) => parentesco = value;

  String getCpf() {
    return cpf;
  }
  void setCpf(String value) => cpf = value;

  String getCelular() {
    return celular;
  }
  void setCelular(String value) => celular = value;

  String getNascimento() {
    return nascimento;
  }
  void setNascimento(String value) => nascimento = value;

  String getRg() {
    return rg;
  }
  void setRg(String value) => rg = value;

  String getEmail() {
    return email;
  }
  void setEmail(String value) => email = value;
}