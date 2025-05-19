import 'package:flutter/material.dart';
import 'package:social_mentes/screens/cadastro/sign_up_page.dart';

class CadastroList extends StatelessWidget {
  const CadastroList({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        Positioned.fill(
          child: Container(),
        ),

        Positioned(
          bottom: screenHeight * 0.20,
          right: screenWidth * 0.05,
          child: RawMaterialButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SignUpPage(),
                ),
              );
            },
            elevation: 0,
            fillColor: Colors.transparent,
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(0),
            constraints: const BoxConstraints(),
            child: Image.asset(
              'assets/images/Person_add.png',
              width: 48,
              height: 48,
            ),
          ),
        ),
      ],
    );
  }
}
