import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:social_mentes/src/view/screens/cargos_page.dart';
import 'package:social_mentes/src/view/screens/sign_up_page.dart';

class Temporario extends StatelessWidget {
  const Temporario({super.key});

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFFF4F4F4),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                width: screenWidth,
                height: screenHeight * (105 / 844),
                decoration: const ShapeDecoration(
                  gradient: LinearGradient(
                    begin: Alignment(-0.10, -0.99),
                    end: Alignment(0.1, 0.99),
                    colors: [Color(0xFF7DB8EF), Color(0xFF4F94D4)],
                  ),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1, color: Color(0xFF9BCFFF)),
                  ),
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
                        child:GestureDetector(
                          onTap: () => print("botão está funfando") ,
                          child:Image.asset(
                          'images/exit.png',
                          height: screenHeight * (104 / 844) * (40 / (105)),
                        ),
                        ) 
                        
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
                        child: Text(
                          "Editar Perfil",
                          style: GoogleFonts.poppins(
                            color: Color(0xFFCEE7FF),
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 32 * screenHeight / 844,
                      left: 24 * screenWidth / 390,
                      child: Image.asset("images/satoh_lindo.png"),
                    ),
                  ],
                ),
              ),

            ],
          ),
          // Container com os botões na parte inferior
          Positioned(
            bottom: 30*screenHeight/844, // Define o espaço de 30 pixels da borda inferior
            left: screenWidth*100/390, // Centraliza o container horizontalmente
            child: Container(
              width: 190*screenWidth/390,
              height: 82*screenHeight/844,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              decoration: ShapeDecoration(
                color: Color.fromRGBO(255, 255, 255, 0.01),
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 2, color: Color(0x7FE3E3E3)),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Botão de cargos
                  GestureDetector(
                    onTap: () {
                      print("Cargos ON DMSSS!!!!");

                      
                      Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CargosPage(),
                                ),
                      );      
      
                    },
                    child: Image.asset("images/icon_cargos_2.png"),
                  ),
                  // Botão de cadastro
                  GestureDetector(
                    onTap: () {
                      print("Botão funcionário funfando");
                    },
                    child: Image.asset("images/icon_cadastro_2.png"),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(backgroundColor: Colors.blue[100] ,onPressed: (){
        Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SignUpPage(),
                  ),
        );      
      }),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
