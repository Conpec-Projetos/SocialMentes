import 'package:flutter/material.dart';
import 'src/view/components/app_widget.dart';
import 'package:social_mentes/models/userPaciente.dart';
import 'package:social_mentes/models/userProfissional.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserPaciente()),
        ChangeNotifierProvider(create: (context) => UserProfissional()),
      ],
      child: const AppWidget()) 
    );
}