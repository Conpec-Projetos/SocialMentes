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
                      Navigator.push(context, MaterialPageRoute(builder: (context) => BackPage()))
                      .then((response){
                        Navigator.pop(context);
                      });
                    } ,
                    child: Text("Enviar", 
                    style:GoogleFonts.poppins(color: Colors.white),
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