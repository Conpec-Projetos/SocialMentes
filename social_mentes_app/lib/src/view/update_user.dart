import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> updatePositions(String newPosition) async {
  try {
    // Obtenha a referência à coleção "userProfiles"
    CollectionReference collection = FirebaseFirestore.instance.collection('userProfiles');

    // Obtenha todos os documentos da coleção
    QuerySnapshot snapshot = await collection.get();

    // Itere sobre cada documento e atualize o campo "position"
    for (QueryDocumentSnapshot doc in snapshot.docs) {
      await doc.reference.update({'position': newPosition});
      print('Campo "position" atualizado para o documento com ID: ${doc.id}');
    }

    print('Todos os documentos atualizados com sucesso!');
  } catch (e) {
    print('Erro ao atualizar os campos "position" nos documentos: $e');
  }
}
