import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SocialSkills extends StatefulWidget {
  const SocialSkills({super.key});

  @override
  State<SocialSkills> createState() => _SocialSkillsState();
}

class _SocialSkillsState extends State<SocialSkills> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidht = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Positioned(
              top: 35 * screenHeight / 844,
              left: 30 * screenWidht / 390,
              child: Image.asset(
                "images/back_button.png",
                height: 40 * screenHeight / 844,
                width: 40 * screenWidht / 390, // Corrigido para 390
              ),
            ),
            Positioned(
              top: 41 * screenHeight / 844,
              left: 80 * screenWidht / 390,
              child: Text(
                "Voltar",
                style: GoogleFonts.firaSans(
                  fontSize: 24 * screenHeight / 844,
                  fontWeight: FontWeight.w400,
                  color: Color.fromRGBO(69, 69, 69, 1),
                ),
              ),
            ),
            Positioned(
              right: 0,
              top: 0,
              child: Image.asset("images/yellow_ball_up.png"),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: Image.asset("images/blue_ball_up.png"),
            ),
            Positioned(
              top: 130*screenHeight/844 ,
              left: 30*screenWidht/390,
              child: Container(
                  height: 20*screenHeight/844,
                  width: 3*screenWidht/390,
                  decoration: BoxDecoration(
                    gradient:LinearGradient(colors: <Color>[
                      Color.fromRGBO(125, 185, 240, 1),
                      Color.fromRGBO(80, 149, 213, 1)
                    ])
                  ),)
                ),
            Positioned(
              top: 125*screenHeight/844,
              left: 38*screenWidht/390,
              child: Text("habilidades socio-emocionais",style: GoogleFonts.poppins(
                fontSize: screenHeight*20/844,
                fontWeight: FontWeight.w700,
                color: Color.fromRGBO(69, 69, 69, 1)
              ),),
            ),
            Positioned(
              top: 160*screenHeight/844,
              left: 30*screenWidht/390,
              child: Text("possíveis observações referentes às \nhabilidades sociais e emocionais:",style: GoogleFonts.firaSans(
              fontSize: screenHeight*20/844,
              fontWeight: FontWeight.w500,
              color: Color.fromRGBO(114, 114, 114, 1)
            ),)
            ),
            Positioned(
              top: 213*screenHeight/844,
              left: 30*screenWidht/390,
              child: Text("A criança busca contato espontâneo com o/a\nmãe/pai, o/a terapeuta e outras crianças.", style: GoogleFonts.firaSans(
              fontSize: 16*screenHeight/844,
              fontWeight: FontWeight.w400,
              color: Color.fromRGBO(114, 114, 114, 1),
            ), textAlign: TextAlign.justify,)
            ),
            Positioned(
              top: 265*screenHeight/844,
              left: 30*screenWidht/390,
              child: Container(
                width: 330*screenWidht/390,
                height: 40*screenHeight/844,
                child: TextFormField(
                  autofocus: true,
                  keyboardType: TextInputType.numberWithOptions(),
                  decoration: InputDecoration(
                    labelText: " Comentários",
                    labelStyle: GoogleFonts.firaSans(
                      backgroundColor: Colors.white,
                      fontSize: 16*screenHeight/844,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(171, 171, 171,1)
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Color.fromRGBO(171, 171, 171, 1), width: 2)
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Color.fromRGBO(171, 171, 171, 1), width: 2)
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color.fromRGBO(171, 171, 171, 1), width: 2
                      ),
                      borderRadius: BorderRadius.circular(15)
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    contentPadding: EdgeInsets.only(top:screenHeight*(-4)/844, left:screenWidht*14/390)
                  ),
                ),
              ) ),
              // decoration: BoxDecoration(
              //     border: Border.all(color: Color.fromRGBO(171, 171, 171, 1),
              //     width:2 ),
              //     borderRadius: BorderRadius.circular(15)
              //   ),
              //container 2
              //texto 2
              Positioned(
                top: 310*screenHeight/844,
                left: 30*screenWidht/390,
                child: Text("A criança demonstra afeto sorrindo,\nchorando, abraçando, beijando, solicitando\ncolo, “fazendo bico”, cruzando os braços,\nverbalizando “eca”.",
                style: GoogleFonts.firaSans(
                  fontSize: 16*screenHeight/844,
              fontWeight: FontWeight.w400,
              color: Color.fromRGBO(114, 114, 114, 1)
                ),
                )),
              Positioned(
              top: 405*screenHeight/844,
              left: 30*screenWidht/390,
              child: Container(
                width: 330*screenWidht/390,
                height: 40*screenHeight/844,
                child: TextFormField(
                  autofocus: true,
                  keyboardType: TextInputType.numberWithOptions(),
                  decoration: InputDecoration(
                    labelText: " Comentários",
                    labelStyle: GoogleFonts.firaSans(
                      backgroundColor: Colors.white,
                      fontSize: 16*screenHeight/844,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(171, 171, 171,1)
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Color.fromRGBO(171, 171, 171, 1), width: 2)
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Color.fromRGBO(171, 171, 171, 1), width: 2)
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color.fromRGBO(171, 171, 171, 1), width: 2
                      ),
                      borderRadius: BorderRadius.circular(15)
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    contentPadding: EdgeInsets.only(top:screenHeight*(-4)/844, left:screenWidht*14/390)
                  ),
                ),
              ) ),
              //texto 3
              Positioned(
                top:445*screenHeight/844,
                left: 30*screenWidht/390,
                child: Text("A criança sorri para parceiro social, atende\nquando chamado o seu nome, direciona es\nustenta contato visual, responde a sons\nvocais.",
                style: GoogleFonts.firaSans(
                  fontSize: 16*screenHeight/844,
              fontWeight: FontWeight.w400,
              color: Color.fromRGBO(114, 114, 114, 1)
                ),)),
              Positioned(
              top: 540*screenHeight/844,
              left: 30*screenWidht/390,
              child: Container(
                width: 330*screenWidht/390,
                height: 40*screenHeight/844,
                child: TextFormField(
                  autofocus: true,
                  keyboardType: TextInputType.numberWithOptions(),
                  decoration: InputDecoration(
                    labelText: " Comentários",
                    labelStyle: GoogleFonts.firaSans(
                      backgroundColor: Colors.white,
                      fontSize: 16*screenHeight/844,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(171, 171, 171,1)
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Color.fromRGBO(171, 171, 171, 1), width: 2)
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Color.fromRGBO(171, 171, 171, 1), width: 2)
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color.fromRGBO(171, 171, 171, 1), width: 2
                      ),
                      borderRadius: BorderRadius.circular(15)
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    contentPadding: EdgeInsets.only(top:screenHeight*(-4)/844, left:screenWidht*14/390)
                  ),
                ),
              ) ),
              Positioned(
                top: 580*screenHeight/844,
                left: 30*screenWidht/390,
                child: Text("A criança observa o comportamento de\noutras crianças utilizando brinquedos ou\nrealizando ações.",
              style: GoogleFonts.firaSans(
                fontSize: 16*screenHeight/844,
              fontWeight: FontWeight.w400,
              color: Color.fromRGBO(114, 114, 114, 1)
              ),)),
            Positioned(
              bottom: 0,
              left: 0,
              child: Image.asset("images/blue_ball_down.png")),
            Positioned(
              bottom: 30*screenHeight/844,
              left: 0,
              child: Image.asset("images/red_ball_down.png"))
              
          ],
        ),
      ),
    );
  }
}
