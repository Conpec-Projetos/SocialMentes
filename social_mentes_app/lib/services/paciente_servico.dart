import "package:cloud_firestore/cloud_firestore.dart";

class PacienteServico {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<QuerySnapshot<Map<String, dynamic>>> conectarStreamPaciente(){
    return _firestore.collection("patients").snapshots();
  }


}