import 'package:cloud_firestore/cloud_firestore.dart';

Future<int> UserQuantity () async {
  try {
    CollectionReference colecao = FirebaseFirestore.instance.collection('userProfiles');
    QuerySnapshot snapshot = await colecao.get();
    // Retorne a quantidade de documentos
    return snapshot.docs.length;
  } catch (e) {
    print('Deu ruim, não consiguiu pegar a quantidade de elementos');
    return 0; 
  }
}

Future<List<Map<String, dynamic>>>  DataUser() async {
  try {
    // Obtenha a referência à coleção "userProfiles"
    CollectionReference colecao = FirebaseFirestore.instance.collection('userProfiles');

    // Obtenha todos os documentos da coleção
    QuerySnapshot snapshot = await colecao.get();

    // Extraia os cargos de cada documento e converta para List<String>
     List<Map<String, dynamic>> users = snapshot.docs.map((doc) {
      return doc.data() as Map<String, dynamic>;
    }).toList();

    return users;
  } catch (e) {
    print('Erro ao obter os perfis de usuários: $e');
    return [];
  }
}
