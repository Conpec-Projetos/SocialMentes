import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'back_page.dart';

class PasswordPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();

  PasswordPage({super.key});

  void _resetPassword() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailController.text);
    } catch (e) {
      print('Error $e');
    }
  }

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
                'Recuperar Senha',
                style: GoogleFonts.poppins(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF5095D5),
                ),
              ),
            ),
            Container(
              child: Text(
                'Sentimos sua falta!',
                style: GoogleFonts.firaSans(
                  fontSize: 17,
                  color: Color(0xFFABABAB),
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                controller: _emailController,
                autofocus: true,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email, color: Color(0xFF727272)),
                  labelText: 'Email',
                  labelStyle: GoogleFonts.firaSans(
                    fontSize: 20,
                    color: Color(0xFF727272),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Color(0xFF727272)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Color(0xFF5095D5)),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF5095D5)),
                onPressed:() async{
                   _resetPassword();
                  Navigator.push(context, MaterialPageRoute(builder: (context) => BackPage()));
                } ,
                child: Text("Enviar", 
                style:GoogleFonts.poppins(color: Colors.white),
                ),
                ),
            SizedBox(height: 187.2),
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
