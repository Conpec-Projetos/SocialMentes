import 'package:http/http.dart' as http;
import 'dart:convert';

// Validar CPF (formato e existente)
// Validar os dados bancários (formato e existente(?))
// ...........
class Validacao {
  static bool verificadoresCpf(String cpf) {
  /* Validação do primeiro dígito após o "-". */
      int soma = 0, j = 10;
      for (int i = 0; i < cpf.length - 2; i++) {
        int numero = int.parse(cpf[i]);
        soma += (numero * j);
        j--;
      }
      int resto = (soma * 10) % 11;
      if (resto == 10) {
        resto = 0;
      }
      if (resto != int.parse(cpf[9])) {
        return false;
      }
  /* Validação do segundo dígito após o "-". */
      soma = 0;
      j = 11;
      for (int k = 0; k < cpf.length - 1; k++) {
        soma += (int.parse(cpf[k]) * j);
        j--;
      }
      resto = (soma * 10) % 11;
      if (resto == 10) {
        resto = 0;
      }
      if (resto != int.parse(cpf[10])) {
        return false;
      }
      return true;
  }

  static bool validarCpf(String cpf) {
    String cpfLimpo = cpf.replaceAll('.', '').replaceAll('-', '');
    if (cpfLimpo.length != 11) {
      return false;
    }
    String c = cpfLimpo[0];
    for (int i = 1; i < cpfLimpo.length - 1; i++) {
      if (c != cpfLimpo[i + 1]) {
        return verificadoresCpf(cpfLimpo);
      }
    }
    return false;
  }
  // Validação de Nome
  static bool validarNome(String nome) {
    return nome.isNotEmpty && nome.length >= 3;
  }

  // Validação de Email
  static bool validarEmail(String email) {
    final RegExp emailRegExp = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    return emailRegExp.hasMatch(email);
  }

  // Validação de Celular
  static bool validarCelular(String celular) {
    final RegExp celularRegExp = RegExp(
      r'^\(\d{2}\) \d{4,5}-\d{4}$',
    );
    return celularRegExp.hasMatch(celular);
  }

  // Validação de CEP
  static bool validarCep(String cep) {
    final RegExp cepRegExp = RegExp(
      r'^\d{5}-\d{3}$',
    );
    return cepRegExp.hasMatch(cep);
  }

  // Validação existência do CEP
  static Future<Map<String, dynamic>?> verificarCepExistente(String cep) async {
    final String url = 'https://viacep.com.br/ws/$cep/json/';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return data;
    } else {
      return null;
    }
  }
  // Validação de Chave Pix
  static bool validarChavePix(String chavePix) {
    // Chave Pix pode ser CPF, CNPJ, email, telefone ou chave aleatória
    final RegExp cpfRegExp = RegExp(
      r'^\d{3}\.\d{3}\.\d{3}-\d{2}$',
    );
    final RegExp cnpjRegExp = RegExp(
      r'^\d{2}\.\d{3}\.\d{3}/\d{4}-\d{2}$',
    );
    final RegExp emailRegExp = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    final RegExp telefoneRegExp = RegExp(
      r'^\(\d{2}\) \d{4,5}-\d{4}$',
    );
    final RegExp chaveAleatoriaRegExp = RegExp(
      r'^[a-fA-F0-9]{32}$',
    );

    return cpfRegExp.hasMatch(chavePix) ||
        cnpjRegExp.hasMatch(chavePix) ||
        emailRegExp.hasMatch(chavePix) ||
        telefoneRegExp.hasMatch(chavePix) ||
        chaveAleatoriaRegExp.hasMatch(chavePix);
  }
}