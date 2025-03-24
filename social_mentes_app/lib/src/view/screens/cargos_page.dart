import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:social_mentes/src/view/components/componente.dart';
import 'package:social_mentes/src/view/screens/information_page.dart';
import 'package:social_mentes/src/view/user_quantity.dart';

class CargosPage extends StatelessWidget {
  const CargosPage({super.key});

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
              // Conteúdo da página (incluindo o container azul e os cards)
              // Container azul
              Container(
                width: double.infinity,
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
                  shadows: [
                    BoxShadow(
                      color: Color(0x827DB8EF),
                      blurRadius: 4,
                      offset: Offset(0, 1),
                      spreadRadius: 1,
                    ),
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
      
  FutureBuilder<List<Map<String, dynamic>>>(
  future: DataUser(),
  builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return Center(child: CircularProgressIndicator());
    } else if (snapshot.hasError) {
      return Center(child: Text('Erro ao carregar dados'));
    } else {
      List<Map<String, dynamic>> users = snapshot.data ?? [];

      return Expanded(
        child: GridView.builder(
          padding: EdgeInsets.only(left: 16, right: 16), 
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 2,
            mainAxisSpacing: 2,
            childAspectRatio: 1,
          ),
          itemCount: users.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => InformationPage(
                      name: users[index]['fullName'] ?? 'sem nome',
                      cargo: users[index]['position'] ?? 'sem cargo',
                      foto: users[index]['photoUrl'] ?? 'https://cdn-icons-png.flaticon.com/512/4519/4519678.png',
                      id: users[index]['id'],
                    ),
                  ),
                );
              },
              child: Column(
                children: [
                  SizedBox(height: 20 * screenHeight / 844),
                  WidgetPaciente(
                    name: users[index]['fullName'] ?? 'Sem Nome',
                    cargo: users[index]['position'] ?? 'Sem Cargo',
                    foto: users[index]['photoUrl'] ?? 'https://cdn-icons-png.flaticon.com/512/4519/4519678.png',
                    
                  ),
                  SizedBox(height: 20 * screenHeight / 844),
                ],
              ),
            );
          },
        ),
      );
    }
  },
)

            ],
          ),
          // Container com os botões na parte inferior
          Positioned(
            bottom: 30, // Define o espaço de 30 pixels da borda inferior
            left: MediaQuery.of(context).size.width / 2 - 95, // Centraliza o container horizontalmente
            child: Container(
              width: 190,
              height: 82,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              decoration: ShapeDecoration(
                color: Colors.white.withOpacity(0.9),
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
    );
  }
}
