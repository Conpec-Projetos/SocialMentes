import 'package:firebase_auth/firebase_auth.dart';

class AutenticacaoServico{

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

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




}



