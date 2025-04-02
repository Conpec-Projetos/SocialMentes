import 'package:flutter/material.dart';

class UserProfissional with ChangeNotifier{
  String nome = 'nome';
  String email = 'nome';
  String cep = 'nome';
  String cpf = 'nome';
  String celular = 'nome';
  String cargo = 'nome';
  String uf = 'nome';
  String cidade = 'nome';
  String bairro = 'nome';
  String logradouro = 'nome';
  String numero = 'nome';
  String complemento = 'nome';
  String banco = 'nome';
  String agencia = 'nome';
  String conta = 'nome';
  String pix = 'nome';
  String fotoPath = 'nome';

  UserProfissional({  
    String nome = 'nome',
    String email = 'nome',
    String cep = 'nome',
    String cpf = 'nome',
    String celular = 'nome',
    String cargo = 'nome',
    String uf = 'nome',
    String cidade = 'nome',
    String bairro = 'nome',
    String logradouro = 'nome',
    String numero = 'nome',
    String complemento = 'nome',
    String banco = 'nome',
    String agencia = 'nome',
    String conta = 'nome',
    String pix = 'nome',
    String fotoPath = 'nome'
    });

  void updateProfissional(int index, String value) {
    if (index == 0) {
      setNome(value);
    } else if (index == 1) {
      setEmail(value);
    } else if (index == 2) {
      setCep(value);
    } else if (index == 3) {
      setCpf(value);
    } else if (index == 4) {
      setCelular(value);
    } else if (index == 5) {
      setCargo(value);
    } else if (index == 6) {
      setUf(value);
    } else if (index == 7) {
      setCidade(value);
    } else if (index == 8) {
      setBairro(value);
    } else if (index == 9) {
      setLogradouro(value);
    } else if (index == 10) {
      setNumero(value);
    } else if (index == 11) {
      setComplemento(value);
    } else if (index == 12) {
      setBanco(value);
    } else if (index == 13) {
      setAgencia(value);
    } else if (index == 14) {
      setConta(value);
    } else if (index == 15) {
      setChavePix(value);
    } else if (index == 16) {
      setFotoPath(value);
    }
    notifyListeners();
  }
  String fetchValue(int index) {
    if (index == 0) {
      return getNome();
    } else if (index == 1) {
      return getEmail();
    } else if (index == 2) {
      return getCep();
    } else if (index == 3) {
      return getCpf();
    } else if (index == 4) {
      return getCelular();
    } else if (index == 5) {
      return getCargo();
    } else if (index == 6) {
      return getUf();
    } else if (index == 7) {
      return getCidade();
    } else if (index == 8) {
      return getBairro();
    } else if (index == 9) {
      return getLogradouro();
    } else if (index == 10) {
      return getNumero();
    } else if (index == 11) {
      return getComplemento();
    } else if (index == 12) {
      return getBanco();
    } else if (index == 13) {
      return getAgencia();
    } else if (index == 14) {
      return getConta();
    } else if (index == 15) {
      return getChavePix();
    } else if (index == 16) {
      return getFotoPath();
    }
    return '';
  }

  // Foto Path
  String getFotoPath() {
    return fotoPath;
  }
  void setFotoPath(String value) => fotoPath = value;

  // Nome
  String getNome() {
    return nome;
  }
  void setNome(String value) => nome = value;

  // Email
  String getEmail() {
    return email;
  }
  void setEmail(String value) => email = value;

  // CEP
  String getCep() {
    return cep;
  }
  void setCep(String value) => cep = value;

  // CPF
  String getCpf() {
    return cpf;
  }
  void setCpf(String value) => cpf = value;

  // Celular
  String getCelular() {
    return celular;
  }
  void setCelular(String value) => celular = value;

  // Cargo
  String getCargo() {
    return cargo;
  }
  void setCargo(String value) => cargo = value;

  // UF
  String getUf() {
    return uf;
  }
  void setUf(String value) => uf = value;

  // Cidade
  String getCidade() {
    return cidade;
  }
  void setCidade(String value) => cidade = value;

  // Bairro
  String getBairro() {
    return bairro;
  }
  void setBairro(String value) => bairro = value;

  // Logradouro
  String getLogradouro() {
    return logradouro;
  }
  void setLogradouro(String value) => logradouro = value;

  // Número
  String getNumero() {
    return numero;
  }
  void setNumero(String value) => numero = value;

  // Complemento
  String getComplemento() {
    return complemento;
  }
  void setComplemento(String value) => complemento = value;

  // Banco
  String getBanco() {
    return banco;
  }
  void setBanco(String value) => banco = value;
  
  // Agência
  String getAgencia() {
    return agencia;
  }
  void setAgencia(String value) => agencia = value;
  
  // Conta
  String getConta() {
    return conta;
  }
  void setConta(String value) => conta = value;
  
  // Chave Pix
  String getChavePix() {
    return pix;
  }
  void setChavePix(String value) => pix = value;
}
