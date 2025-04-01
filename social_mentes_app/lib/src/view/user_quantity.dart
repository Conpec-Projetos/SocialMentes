import 'package:cloud_firestore/cloud_firestore.dart';

Future<List<Map<String, dynamic>>> DataUser() async {
  try {
    // Obtenha os documentos da coleção "userProfiles"
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('userProfiles').get();
    // Mapeie os documentos para incluir o ID
    return querySnapshot.docs.map((doc) {
      return {
        'id': doc.id, // Incluindo o ID do documento
        ...doc.data() as Map<String, dynamic>, // Adicionando os dados do documento
      };
    }).toList();
  } catch (e) {
    //print('Erro ao buscar os dados: $e');
    return [];
  }
}

