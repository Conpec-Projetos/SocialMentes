import 'package:flutter/material.dart';
import 'src/view/components/app_widget.dart';
import 'src/view/screens/cargos_page.dart';

void main() {
  runApp(AppWidget());
}

class AppWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Socialmentes",
      home: CargosPage(),
    );
  }
}