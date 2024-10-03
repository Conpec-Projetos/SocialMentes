import 'package:flutter/material.dart';
import 'src/view/components/app_widget.dart';
import 'src/view/screens/protocolo.dart';

void main() {
  runApp(AppWidget());
}

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: "socialmentes", home: myProtocolo());
  }
}
