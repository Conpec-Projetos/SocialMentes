import "package:cloud_firestore/cloud_firestore.dart";

class TestesServico {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<QuerySnapshot<Map<String, dynamic>>> conectarStreamTeste(){
    return _firestore.collection("tests").snapshots();
  }


}