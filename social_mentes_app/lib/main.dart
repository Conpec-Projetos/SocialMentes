import 'package:flutter/material.dart';
//import 'src/view/components/app_widget.dart';
import 'src/view/screens/tela4.dart';

import 'package:social_mentes/src/view/screens/psico_navegacao.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const AppWidget());
}

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: "socialmentes", home: PsicoNavegacao());
  }
}

/*

void main() {
  runApp(AppWidget());
}

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: "socialmentes", 
    home: CreateProtocols());
  }
}
*/
