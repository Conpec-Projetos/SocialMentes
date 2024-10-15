import 'package:flutter/material.dart';
// import 'src/view/components/app_widget.dart';
import 'src/view/screens/social_skills.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'firebase_options.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Socialmentes',
      home: SocialSkills(),
    );
  }
}

