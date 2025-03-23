import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:social_mentes/src/view/screens/login_page.dart';
import 'firebase_options.dart';

import 'src/view/screens/cargos_page.dart';
import 'src/view/screens/information_page.dart';
import 'src/view/screens/sign_up_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SocialMentes',
      home: InformationPage(),
    );
  }
}
