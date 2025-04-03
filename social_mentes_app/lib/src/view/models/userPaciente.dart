import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social_mentes/src/view/models/responsavel.dart';

class UserPaciente with ChangeNotifier {
  List<List<String>> profissionais;
  List<String> intervencao;
  String nome = 'nome';
  String cep = 'nome';
  String cpf = 'nome';
  String celular = 'nome';
  String nascimento = 'nome';
  String uf = 'nome';
  String cidade = 'nome';
  String bairro = 'nome';
  String logradouro = 'nome';
  String numero = 'nome';
  String complemento = 'nome';
  String fotoPath = 'nome';
  Responsavel resp1 = Responsavel();
  Responsavel resp2 = Responsavel();
  // profissionais (lista dos profissionais externos) = [[nome, email, celular, cargo]]
  // intervencao (lista dos profissionais da equipe de intervencao) = [uids de cada profissional] 

  UserPaciente({
    List<List<String>>? profissionais,
    List<String>? intervencao,
    Responsavel? resp1,
    Responsavel? resp2,
    String nome = 'nome',
    String cep = 'nome',
    String cpf = 'nome',
    String celular = 'nome',
    String nascimento = 'nome',
    String uf = 'nome',
    String cidade = 'nome',
    String bairro = 'nome',
    String logradouro = 'nome',
    String numero = 'nome',
    String complemento = 'nome',
    String fotoPath = 'nome'
  }) :
      resp1 = resp1 ?? Responsavel(),
      resp2 = resp2 ?? Responsavel(),
      profissionais = profissionais ?? [],
      intervencao = intervencao ?? [];

  @override
  String toString() {
    return 'UserPaciente(nome: $nome, cep: $cep, cpf: $cpf, celular: $celular, nascimento: $nascimento, uf: $uf, cidade: $cidade, bairro: $bairro, logradouro: $logradouro, numero: $numero, complemento: $complemento, fotoPath: $fotoPath, resp1: ${resp1.toString()}, resp2: ${resp2.toString()}, profissionais: $profissionais, intervencao: $intervencao)';
  }

  void addIntervencao(String lista) {
    intervencao.add(lista);
    notifyListeners();
  }

  void addProfissional(List<String> lista) {
    profissionais.add(lista);
    notifyListeners();
  }

  void updatePaciente(String key, int index, String value) {
    if (index == 0) {
      setNome(key, value);
    } else if (index == 1) {
      setCep(value);
    }  else if (index == 2) {
      setCpf(key, value);
    }  else if (index == 3) {
      setCelular(key, value);
    }  else if (index == 4) {
      setNascimento(key, value);
    }  else if (index == 5) {
      setUf(value);
    }  else if (index == 6) {
      setCidade(value);
    }  else if (index == 7) {
      setBairro(value);
    }  else if (index == 8) {
      setLogradouro(value);
    }  else if (index == 9) {
      setNumero(value);
    }  else if (index == 10) {
      setComplemento(value);
    }  else if (index == 11) {
      setFotoPath(value);
    } else if (index == 12) {
      setParentesco(key, value);
    } else if (index == 13) {
      setEmail(key, value);
    } else if (index == 14) {
      setRg(key, value);
    }
    notifyListeners();
  }

    String fetchValue(String key, int index) {
    if (index == 0) {
      return getNome(key);
    } else if (index == 1) {
      return getCep();
    }  else if (index == 2) {
      return getCpf(key);
    }  else if (index == 3) {
      return getCelular(key);
    }  else if (index == 4) {
      return getNascimento(key);
    }  else if (index == 5) {
      return getUf();
    }  else if (index == 6) {
      return getCidade();
    }  else if (index == 7) {
      return getBairro();
    }  else if (index == 8) {
      return getLogradouro();
    }  else if (index == 9) {
      return getNumero();
    }  else if (index == 10) {
      return getComplemento();
    }  else if (index == 11) {
      return getFotoPath();
    } else if (index == 12) {
      return getParentesco(key);
    } else if (index == 13) {
      return getEmail(key);
    } else if (index == 14) {
      return getRg(key);
    }
    return '';
  }

  // RG
  String getRg(String id) {
    if (id == 'Resp1') {
      return resp1.getRg();
    } else if (id == 'Resp2') {
      return resp2.getRg();
    }
    return '';
  }
  void setRg(String id, String value) {
    if (id == 'Resp1') {
      resp1.setRg(value);
    } else if (id == 'Resp2') {
      resp2.setRg(value);
    }
  } 

  // Parentesco  
  String getParentesco(String id) {
    if (id == 'Resp1') {
      return resp1.getParentesco();
    } else if (id == 'Resp2') {
      return resp2.getParentesco();
    }
    return '';
  }
  void setParentesco(String id, String value) {
    if (id == 'Resp1') {
      resp1.setParentesco(value);
    } else if (id == 'Resp2') {
      resp2.setParentesco(value);
    }
  }

  // Nascimento
  String getNascimento(String id) {
    if (id == 'Resp1') {
      return resp1.getNascimento();
    } else if (id == 'Resp2') {
      return resp2.getNascimento();
    } else if (id == 'Paciente') {
      return nascimento;
    }
    return '';
  }
  void setNascimento(String id, String value) {
    if (id == 'Resp1') {
      resp1.setNascimento(value);
    } else if (id == 'Resp2') {
      resp2.setNascimento(value);
    } else if (id == 'Paciente') {
      nascimento = value;
    }
  }

  // Foto Path
  String getFotoPath() {
    return fotoPath;
  }
  void setFotoPath(String value) => fotoPath = value;

  // Nome
  String getNome(String id) {
    if (id == 'Resp1') {
      return resp1.getNome();
    } else if (id == 'Resp2') {
      return resp2.getNome();
    } else if (id == 'Paciente') {
      return nome;
    }
    return '';
  }
  void setNome(String id, String value) {
    if (id == 'Resp1') {
      resp1.setNome(value);
    } else if (id == 'Resp2') {
      resp2.setNome(value);
    } else if (id == 'Paciente') {
      nome = value;
    }
  }

  // Email
  String getEmail(String id) {
    if (id == 'Resp1') {
      return resp1.getEmail();
    } else if (id == 'Resp2') {
      return resp2.getEmail();
    }
    return '';
  }
  void setEmail(String id, String value) {
    if (id == 'Resp1') {
      resp1.setEmail(value);
    } else if (id == 'Resp2') {
      resp2.setEmail(value);
    }
  } 

  // CEP
  String getCep() {
    return cep;
  }
  void setCep(String value) => cep = value;

  // CPF
  String getCpf(String id) {
    if (id == 'Resp1') {
      return resp1.getCpf();
    } else if (id == 'Resp2') {
      return resp2.getCpf();
    } else if (id == 'Paciente') {
      return cpf;
    }
    return '';
  }
  void setCpf(String id, String value) {
    if (id == 'Resp1') {
      resp1.setCpf(value);
    } else if (id == 'Resp2') {
      resp2.setCpf(value);
    } else if (id == 'Paciente') {
      cpf = value;
    }
  }

  // Celular
  String getCelular(String id) {
    if (id == 'Resp1') {
      return resp1.getCelular();
    } else if (id == 'Resp2') {
      return resp2.getCelular();
    } else if (id == 'Paciente') {
      return celular;
    }
    return '';
  }
  void setCelular(String id, String value) {
    if (id == 'Resp1') {
      resp1.setCelular(value);
    } else if (id == 'Resp2') {
      resp2.setCelular(value);
    } else if (id == 'Paciente') {
      celular = value;
    }
  }

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
}
