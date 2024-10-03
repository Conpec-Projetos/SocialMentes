import 'package:flutter/material.dart';
//import 'src/view/components/app_widget.dart';
//import 'src/view/screens/cargos_page.dart';
import 'src/view/screens/information_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  
  runApp(AppWidget());
}

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Socialmentes",
      home: InformationPage(),
    );
  }
}
