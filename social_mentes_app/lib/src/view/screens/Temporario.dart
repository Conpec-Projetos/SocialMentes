import 'package:flutter/material.dart';
import 'package:social_mentes/src/view/screens/sign_up_page.dart';

class Temporario extends StatelessWidget {
  const Temporario({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage(),));
        }
      )
    );
  }
}