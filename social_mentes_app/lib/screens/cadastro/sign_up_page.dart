import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import 'package:social_mentes/screens/cadastro/signUp_data.dart';

class GradientText extends StatelessWidget {
  const GradientText({
    super.key,
    required this.text,
    this.style,
    required this.gradient,
  });
  final String text;
  final TextStyle? style;
  final Gradient gradient;
  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Text(text, style: style),
    );
  }
}

class SignUpPage extends StatefulWidget {
  const SignUpPage({
    super.key,
    this.back
  });

  final Function()? back;

  @override
  State<StatefulWidget> createState() {
    return SignUpPageState();
  }
}

class SignUpPageState extends State<SignUpPage> {
  bool paciente = false;
  bool profissional = false;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height; //pega o tamanho vertical da tela
    double screenWidth = MediaQuery.of(context).size.width; //pega o tamanho horizontal da tela

    void back() {
      Navigator.pop(context);
    }

    void onContinueTap(bool paciente, bool profissional) {
      Navigator.push(
        context,
        CupertinoPageRoute(builder: (context) => SignUpDataPage(
          paciente: paciente,
          profissional: profissional,
        )),
      );
    }

    return SafeArea(
      child: Container(
        color: Colors.white,
        child: Stack(
          children: [
            Positioned(
            top: 0,
            right: 0,
            child: Image.asset(
              "assets/images/defaultBG_up.png",
              scale: 150/((150/844)*screenHeight),
            )
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset(
              "assets/images/defaultBG_down.png",
              scale: 214/((214/844)*screenHeight),
            )
          ),

            Scaffold(
              backgroundColor: Colors.transparent,
              body: Align(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: screenWidth * 0.08,
                        left: screenWidth * 0.08
                      ),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            IconButton(
                              onPressed: () {
                                back();
                              },
                              icon: const Image(image: AssetImage('assets/images/back_button.png'))
                            ),
                            Text('Voltar', style: GoogleFonts.firaSans(fontSize: screenWidth * 0.05, color: const Color.fromRGBO(69, 69, 69, 1)),)
                          ],
                        ),
                    ),
                    const SizedBox(height: 141,),
                    Container(
                      height: screenHeight * 0.5,
                      width: screenWidth,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('cadastro', style: GoogleFonts.poppins(
                            fontWeight: FontWeight.bold,
                            color: const Color.fromRGBO(69, 69, 69, 1),
                            fontSize: screenWidth * 0.05
                          )),
                          SizedBox(height: screenHeight * 0.01),
                          Container(
                            height: 4,
                            width: screenWidth * 0.65,
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(colors: [
                                Color.fromRGBO(206, 231, 255, 0.53),
                                Color.fromRGBO(125, 185, 240, 1),
                                Color.fromRGBO(206, 231, 255, 1)
                              ])
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.01),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: screenWidth * 0.2),
                                child: LinearPercentIndicator(width: screenWidth * 0.15,
                                  percent: 1,
                                  progressColor: const Color.fromRGBO(206, 231, 255, 1),
                                ),
                              ),
                              LinearPercentIndicator(
                                width: screenWidth * 0.15,
                                percent: 0,
                                progressColor: const Color.fromRGBO(206, 231, 255, 1),
                              ),
                              LinearPercentIndicator(width: screenWidth * 0.15,
                                percent: 0,
                                progressColor: const Color.fromRGBO(215, 215, 215, 1),
                              ),
                              LinearPercentIndicator(width: screenWidth * 0.15,
                                percent: 0,
                                progressColor: const Color.fromRGBO(215, 215, 215, 1),
                              ),
                            ],
                          ),
                          SizedBox(height: screenHeight * 0.01),
                          Text(
                            'escolha uma categoria:', 
                            style: GoogleFonts.firaSans(
                              fontWeight: FontWeight.bold,
                              color: const Color.fromARGB(255, 114, 114, 114),
                              fontSize: screenWidth * 0.05
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.01),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(
                                onPressed: () {
                                  setState(() {
                                    paciente = true;
                                    profissional = false;
                                  }); 
                                },
                                child: paciente
                                ? GradientText(
                                  text: 'Paciente',
                                  gradient: const LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [Color.fromARGB(206, 80, 149, 213), Color.fromARGB(255, 139, 199, 255)],
                                  ),
                                  style: GoogleFonts.firaSans(
                                    fontSize: screenWidth * 0.05
                                  ),
                                )
                                : Text(
                                  'Paciente',
                                  style: GoogleFonts.firaSans(
                                    color: const Color.fromARGB(255, 171, 171, 171),
                                    fontSize: screenWidth * 0.05
                                  ),
                                )
                              ),
                              TextButton(
                                onPressed: () {
                                  setState(() {
                                    paciente = false;
                                    profissional = true;
                                  });
                                },
                                child: profissional
                                ? GradientText(
                                  text: 'Profissional',
                                  gradient: const LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [Color.fromARGB(206, 80, 149, 213), Color.fromARGB(255, 139, 199, 255)],
                                  ),
                                  style: GoogleFonts.firaSans(
                                    fontSize: screenWidth * 0.05
                                  ),
                                )
                                : Text(
                                  'Profissional',
                                  style: GoogleFonts.firaSans(
                                    color: const Color.fromARGB(255, 171, 171, 171),
                                    fontSize: screenWidth * 0.05
                                  ),
                                )
                              ),
                            ],
                          ),
                          SizedBox(height: screenHeight * 0.01),
                          InkWell(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: (paciente || profissional) 
                              ? () => onContinueTap(paciente, profissional)
                              : () {},
                            child: Container(
                              width: 350,
                              height: 44,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: const LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [Color.fromARGB(255, 139, 199, 255),Color.fromARGB(206, 80, 149, 213)],
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'CONTINUAR',
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ), 
                                  const SizedBox(width: 10),
                                  Image.asset('assets/images/forward.png'),                  
                                ],
                              ),
                            ),
                          ),
                                    
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}