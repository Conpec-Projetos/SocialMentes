import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> updatePosition(String uid, String newPosition) async {
  try {
    // Obtenha a referência ao documento específico pela sua ID
    DocumentReference document = FirebaseFirestore.instance.collection('userProfiles').doc(uid);
    //DocumentSnapshot snapshot = await document.get();
      // Atualiza o campo "position" do documento
      await document.update({'position': newPosition});
      print('Campo "position" atualizado com sucesso para o documento com ID: $uid e nova posição $newPosition');
  } catch (e) {
    print('Erro ao atualizar o campo "position" no documento: $e');
  }
}
