import 'package:flutter/material.dart';

import 'package:social_mentes/screens/cadastro/sign_up_page.dart';

class Temporario extends StatelessWidget {
  const Temporario({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 126),
      child: Center(
        child: FloatingActionButton(backgroundColor: Colors.blue[100] ,onPressed: (){
          Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignUpPage(),
                    ),
          );      
        }),
      ),
    );
  }
}