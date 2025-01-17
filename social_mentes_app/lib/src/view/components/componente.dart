import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WidgetPaciente extends StatelessWidget {
  final String nome;
  final String cargo;
  final String foto;
  const WidgetPaciente({super.key,required this.nome, required this.cargo, required this.foto});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Stack(
        children: [
          Container(
                      width: screenWidth * (146 / 390),
                      height: screenHeight * (138 / 844),
                      padding: const EdgeInsets.all(30),
                      decoration: ShapeDecoration(
                        gradient: LinearGradient(
                          begin: Alignment(0.74, -0.68),
                          end: Alignment(-0.74, 0.68),
                          colors: [Color(0xFFECECEC), Color(0xFFD9D9D9)],
                        ),
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 1,
                            color: Color(0xFFE4E4E4),
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            top: screenHeight * (1 / 844),
                            left: screenWidth * (30 / 390),
                            child: Image.asset("images/seiji_lindo.png"),
                          ),
                          Positioned(
                            top: screenHeight * (42 / 844),
                            left: screenWidth * (3.5 / 390),
                            child: Text(
                              nome,
                              style: GoogleFonts.firaSans(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Color.fromRGBO(69, 69, 69, 1),
                              ),
                            ),
                          ),
                          Positioned(
                            top: screenHeight * (10 / 138),
                            left: screenWidth * (21 / 390),
                            child: Container(
                              width: screenWidth * (7.5 / 390),
                              height: 20,
                              child: Image.asset("images/maleta_icon.png"),
                            ),
                          ),
                          Positioned(
                            top: screenHeight * (10.5 / 138),
                            left: screenWidth * (31 / 390),
                            child: Container(
                              width: screenWidth * (86 / 390),
                              height: 20,
                              child: Text(
                                cargo,
                                style: GoogleFonts.firaSans(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromRGBO(69, 69, 69, 1),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
        ]
    );
  }
}