import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AutenticacaoServico{

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String?> logarUsuarios({required String email, required String senha}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(email: email, password: senha);

      return null;
    } on FirebaseAuthException catch (e) {
      // conta não cadastrada

      return e.message;
    }
  }

  Future<void> deslogar(){
    return _firebaseAuth.signOut();
  }

  Future<Map<String, dynamic>> getUserInfo({required User user}) async {
    Map<String, dynamic> userInfo = {
      "position":null,
      "photoUrl": null,
      'fullName': null,
    };

    try {
      // Acessa o Firestore e pega o documento do usuário usando o UID
      DocumentSnapshot snapshot = await _firestore
          .collection('userProfiles')
          .doc(user.uid)
          .get();

      // Verifica se o documento existe e se o campo 'position' está presente
      if (snapshot.exists) {
        Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
        
        userInfo["position"] = data["position"] ?? 'Cargo não encontrado';
        userInfo['photoUrl'] = data["photoUrl"] ?? 'https://cdn-icons-png.flaticon.com/512/4519/4519678.png';
        userInfo['fullName'] = data["fullName"] ?? 'Sem nome';

        return userInfo;
      } else {
        return userInfo;
      }
    } catch (e) {
      print("Erro ao pegar o cargo: $e");
      return userInfo;
    }
  }





}
    


