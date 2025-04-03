
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'login_page.dart';
import 'package:google_fonts/google_fonts.dart';

class BackPage extends StatelessWidget {
  const BackPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF4F4F4),
      body: Center(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 100,
              child: Stack(
                children: [
                  Image.asset('images/yellow_ball_up.png'),
                  Image.asset('images/blue_ball_up.png'),
                  Image.asset('images/red_ball_up.png'),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 50),
              child: Image.asset(
                'images/Logo.png',
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
            Container(
              child: Text(
                'Enviamos um link para redefinir sua senha',
                style: GoogleFonts.firaSans(
                  fontSize: 18,
                  color: Color(0xFFABABAB),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style:
                  ElevatedButton.styleFrom(backgroundColor: Color(0xFF5095D5)),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginPage(),
                  ),
                );
              },
              child: Text(
                'Voltar a tela de login',
                style: GoogleFonts.poppins(color: Colors.white),
              ),
            ),
            SizedBox(height: 244.2),
            Container(
              width: double.infinity,
              height: 200,
              child: Stack(
                children: [
                  Positioned(
                    right: -25,
                    top: -10,
                    child: Image.asset('images/yellow_ball_down.png'),
                  ),
                  Positioned(
                    top: 139,
                    right: -40,
                    child: Image.asset('images/blue_ball_down.png'),
                  ),
                  Positioned(
                    right: 0,
                    top: 120,
                    child: Image.asset('images/red_ball_down.png'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
