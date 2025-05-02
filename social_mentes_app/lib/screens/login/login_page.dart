import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:social_mentes/services/autenticacao_servico.dart';
import 'forget_password_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _passwordVisible = false; // Controle da visibilidade da senha
  final TextEditingController _emailController =
      TextEditingController(); // Controle do campo de email
  final TextEditingController _passwordController =
      TextEditingController(); // Controle do campo de senha

  final AutenticacaoServico _autenServico = AutenticacaoServico();


  void _loginUser() async {
    String email = _emailController.text;
    String senha = _passwordController.text;

    try {
      _autenServico.logarUsuarios(email: email, senha: senha);
      
    } catch (e) {
      print('Erro ao autenticar: $e');
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
                      'bem-vindo',
                      style: GoogleFonts.poppins(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF5095D5),
                      ),
                    ),
                  ),
                  Text(
                    'Sentimos sua falta!',
                    style: GoogleFonts.firaSans(
                      fontSize: 17,
                      color: Color(0xFFABABAB),
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
                        child: Image.asset('assets/images/Button.png'),
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}