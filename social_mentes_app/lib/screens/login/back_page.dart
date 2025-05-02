import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BackPage extends StatelessWidget {
  const BackPage({super.key});

  @override
  Widget build(BuildContext context) {
    //Tamanho tela
    final double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      color: Color(0xFFF4F4F4),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset(
              "assets/images/loginBG_up.png",
              scale: 150/((150/844)*screenHeight),
            )
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset(
              "assets/images/loginBG_down.png",
              scale: 214/((214/844)*screenHeight),
            )
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            body: SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: (173/844)*screenHeight),
                    child: Image.asset(
                      'assets/images/logo_grande.png',
                      width: 100,
                      height: 100,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 1),
                    child: Text(
                      'Verfique seu e-mail',
                      style: GoogleFonts.poppins(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF5095D5),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Enviamos um link para redefinir sua senha',
                    style: GoogleFonts.firaSans(
                      fontSize: 18,
                      color: Color(0xFFABABAB),
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Color(0xFF5095D5)),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Voltar a tela de login',
                      style: GoogleFonts.poppins(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}