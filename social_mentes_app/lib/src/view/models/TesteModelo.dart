class TesteModelo {
  //atributos
  String nomePaci;
  int id;
  int situation;
  String data;

  String? urlImagem; //pode ser nula

  //construtor
  TesteModelo({
    required this.nomePaci, 
    required this.id, 
    required this.situation,
    required this.data
  });

  //funções
  //Contrutor nomeado, usado quando pega no banco de dados
  TesteModelo.fromMap(Map<String, dynamic> map)
    : id = map["id"],
      situation = map["situation"],
      data = map["timestamp"],
      nomePaci = map["patientName"];
}







