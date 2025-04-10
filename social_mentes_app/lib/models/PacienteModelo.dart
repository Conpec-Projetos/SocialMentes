class PacienteModelo {
  //atributos
  String nome;
  String foto;
  List<dynamic> testes;

  String? urlImagem; //pode ser nula

  //construtor
  PacienteModelo({
    required this.nome, 
    required this.foto,
    required this.testes
  });

  //funções
  //Contrutor nomeado, usado quando pega no banco de dados
  PacienteModelo.fromMap(Map<String, dynamic> map)
    : nome = map["children"]["name"],
      foto = "assets/images/Patient1.png",
      testes = (map["tests"] == null)? []: map["tests"]
      /*,
      urlImagem = map["urlImagem"]*/;


  
}







