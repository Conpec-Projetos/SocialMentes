import 'package:flutter/material.dart';
//import 'src/view/components/app_widget.dart';
import 'src/view/screens/tela4.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'src/view/screens/create_cheaklist.dart';

void main() {
  runApp(AppWidget());
}

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: "socialmentes", 
    home: CreateProtocols2());
  }
}
