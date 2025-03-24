import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:social_mentes/src/view/screens/psico_navegacao.dart';
import 'forget_password_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _passwordVisible = false; // Controle da visibilidade da senha
  final TextEditingController _emailController =
      TextEditingController(); // Controle do campo de email
  final TextEditingController _passwordController =
      TextEditingController(); // Controle do campo de senha

  void _loginUser() async {
    String email = _emailController.text;
    String senha = _passwordController.text;

    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: senha,
      );

      User? user = userCredential.user;
      if (user != null) {
        print('Usuário autenticado: ${user.email}');

        /*
        Navigator.push(
          context, 
          MaterialPageRoute(
            builder: (context) => PsicoNavegacao(),
          ),
        );*/
      }
    } catch (e) {
      print('Erro ao autenticar: $e');
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
                'bem-vindo',
                style: GoogleFonts.poppins(
                  fontSize: 40,
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
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                controller: _passwordController,
                keyboardType: TextInputType.text,
                obscureText: !_passwordVisible,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock, color: Color(0xFF727272)),
                  labelText: 'Senha',
                  labelStyle: GoogleFonts.firaSans(
                      fontSize: 20, color: Color(0xFF727272)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Color(0xFF727272)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Color(0xFF5095D5)),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _passwordVisible
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: Color(0xFF727272),
                    ),
                    onPressed: () {
                      setState(() {
                        _passwordVisible = !_passwordVisible;
                      });
                    },
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              width: 150,
              height: 70,
              child: GestureDetector(
                onTap: _loginUser,
                child: OverflowBox(
                  minWidth: 0.0,
                  minHeight: 0.0,
                  maxWidth: double.infinity,
                  maxHeight: double.infinity,
                  child: Image.asset('images/Button.png'),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Esqueceu sua senha?',
                    style: GoogleFonts.firaSans(
                      fontSize: 15,
                      color: Color(0xFF727272),
                    ),
                  ),
                  SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PasswordPage(),
                        ),
                      );
                    },
                    child: Text(
                      'Clique aqui!',
                      style: GoogleFonts.firaSans(
                        fontSize: 15,
                        color: Color(0xFF5095D5),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 75.25),
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
