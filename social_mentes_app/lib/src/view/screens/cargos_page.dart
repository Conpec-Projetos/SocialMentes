import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CargosPage extends StatelessWidget {
  const CargosPage({super.key});

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(0xFFF4F4F4),
      body: Stack(
        children: [
          Center(
            child: Column(
              children: [
                //container azul
                Container(
                  width: double.infinity,
                  height: screenHeight * (105 / 844),
                  decoration: ShapeDecoration(
                    gradient: LinearGradient(
                      begin: Alignment(-0.10, -0.99),
                      end: Alignment(0.1, 0.99),
                      colors: [Color(0xFF7DB8EF), Color(0xFF4F94D4)],
                    ),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1, color: Color(0xFF9BCFFF)),
                    ),
                    shadows: [
                      BoxShadow(
                        color: Color(0x827DB8EF),
                        blurRadius: 4,
                        offset: Offset(0, 1),
                        spreadRadius: 1,
                      )
                    ],
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        left: screenWidth * 343 / 390,
                        top: screenHeight * (104 / 844) * (40 / (105)),
                        child: GestureDetector(
                          onTap: () {
                            print("Voltei");
                          },
                          child: Image.asset(
                            'images/exit.png',
                            height:
                                screenHeight * (104 / 844) * (40 / (105)),
                          ),
                        ),
                      ),
                      Positioned(
                        top: screenHeight * 38 / 844,
                        left: screenWidth * 94 / 390,
                        child: Container(
                          height: screenHeight * 30 / 105,
                          width: screenWidth * 125 / 390,
                          child: Text(
                            "Victor Satoh",
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              color: Color(0xFFF4F4F4),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: screenHeight * 55 / 844,
                        left: screenWidth * 94 / 390,
                        child: Container(
                          height: screenHeight * 30 / 105,
                          width: screenWidth * 125 / 390,
                          child: Text(
                            "Editar perfil",
                            style: GoogleFonts.firaSans(
                              fontSize: 16,
                              color: Color(0xFFF4F4F4),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: screenHeight * 68 / 105,
                        left: screenWidth * 94 / 390,
                        child: Container(
                            child: Text("Editar Perfil",
                                style: GoogleFonts.poppins(
                                    color: Color(0xFFCEE7FF),
                                    fontSize: 16))),
                      ),
                      Positioned(
                        top: 32 * screenHeight / 844,
                        left: 24 * screenWidth / 390,
                        child: Image.asset("images/satoh_lindo.png"),
                      ),
                    ],
                  ),
                ),

                //row dentro do container para os cards
                Row(
                  children: [
                    //coluna 1 de cards
                    SizedBox(width: screenWidth * (39 / 390)),
                    SizedBox(height: screenHeight * (20 / 844)),
                    Column(
                      children: [
                        SizedBox(height: screenHeight * (20 / 844)),
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
                                  width: 1, color: Color(0xFFE4E4E4)),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                  top: screenHeight * (20 / (844)),
                                  left: (30 / 146) *
                                      screenWidth *
                                      (146 / 390),
                                  child:
                                      Image.asset("images/seiji_lindo.png")),
                            ],
                          ),
                        ),
                        SizedBox(width: screenWidth * (20 / 390)),
                        SizedBox(height: screenHeight * (20 / 844)),
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
                              side: BorderSide(width: 1, color: Color(0xFFE4E4E4)),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Stack(
                            children: [
                              // Imagem
                              Positioned(
                                top: screenHeight * (20 / 844),
                                left: screenWidth * (30 / 390),
                                child: Image.asset("images/seiji_lindo.png"),
                              ),
                              // Container preto sobreposto à imagem
                              Positioned(
                                top: screenHeight * (10 / 138), // Ajustar posição para que apareça sobre o card
                                left: screenWidth * (40 / 390), // Ajustar a posição horizontal conforme necessário
                                child: Container(
                                  width:screenWidth * (146 / 390) ,
                                  height: 20,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        )

                      ],
                    ),
                    SizedBox(width: screenWidth * (20 / 390)),

                    //coluna 2 de cards
                    Column(
                      children: [
                        SizedBox(height: screenHeight * 20 / (844)),
                        Container(
                          width: 146,
                          height: 138,
                          padding: const EdgeInsets.all(30),
                          decoration: ShapeDecoration(
                            gradient: LinearGradient(
                              begin: Alignment(0.74, -0.68),
                              end: Alignment(-0.74, 0.68),
                              colors: [Color(0xFFECECEC), Color(0xFFD9D9D9)],
                            ),
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  width: 1, color: Color(0xFFE4E4E4)),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                  top: 15,
                                  left: 23,
                                  child:
                                      Image.asset("images/seiji_lindo.png")),
                            ],
                          ),
                        ),
                        SizedBox(width: screenWidth * 20 / 390),
                        SizedBox(height: screenHeight * (20 / 844)),
                        Container(
                          width: 146,
                          height: 138,
                          //padding: const (30),
                          decoration: ShapeDecoration(
                            gradient: LinearGradient(
                              begin: Alignment(0.74, -0.68),
                              end: Alignment(-0.74, 0.68),
                              colors: [Color(0xFFECECEC), Color(0xFFD9D9D9)],
                            ),
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  width: 1, color: Color(0xFFE4E4E4)),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Image.asset("images/seiji_lindo.png"),
                        ),
                      ],
                    ),
                  ],
                ),

                // container branco que está os botões de cargo e cadastro
                Container(
                  margin: EdgeInsets.only(top: 20),
                  width: 190,
                  height: 82,
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  decoration: ShapeDecoration(
                    color: Colors.white.withOpacity(0.009999999776482582),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 2, color: Color(0x7FE3E3E3)),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: Row(
                    children: [
                      //adm cargo e cadastro
                      GestureDetector(
                        onTap: () {
                          print("Cargos ON DMSSS!!!!");
                        },
                        child: Image.asset("images/icon_cargos_2.png"),
                      ),
                      SizedBox(width: 50),
                      GestureDetector(
                        onTap: () {
                          print("Botão funcionário funfando");
                        },
                        child: Image.asset("images/icon_cadastro_2.png"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Imagem inferior posicionada no canto inferior direito da tela
          SizedBox(height: 1000,), 
          Positioned(
            bottom: 0,
            child: Container(
              width: screenWidth,
              child: Align(
                alignment: Alignment.bottomRight, // Alinhar no canto inferior direito
                child: Image.asset(
                  "images/imagem_inferior.png",
      ),
    ),
  ),
)


          
          
        ],
      ),
    );
  }
}




