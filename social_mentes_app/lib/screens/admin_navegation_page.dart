import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:social_mentes/screens/cadastro/temporario.dart';
import 'package:social_mentes/screens/cargos/cargos_page.dart';
import 'package:social_mentes/services/autenticacao_servico.dart';

import '../common/colors.dart';


class AdmNavegacao extends StatefulWidget {
  final User user;

  const AdmNavegacao({super.key, required this.user});

  @override
  State<AdmNavegacao> createState() => _AdmNavegacaoState();
}

class _AdmNavegacaoState extends State<AdmNavegacao> {
  //TESTES
  final String nome = "Victor Satoh";

  //Páginas
  int _paginaAtualIndex = 0;
  final List<Widget> _navigator = [
    CargosPage(),
    Temporario()
  ];

  

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      extendBody: true,
      appBar: AppBar(
          toolbarHeight: (105.0/844) * screenHeight,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[Colours.azul1, Colours.azul2]),
            ),
          ),
          
          leadingWidth: (84.0 / 390) * screenWidth,
          leading: Container(
            padding: EdgeInsets.only(left: (24.0 / 390) * screenWidth, top: (32.0 / 844) * screenHeight, bottom: (13.0 / 844) * screenHeight),
            child: CircleAvatar(
              radius: ((30 / 844) * screenHeight) +2,
              backgroundColor: Color(0xFFCEE8FF),
              child: CircleAvatar(
                radius: (30 / 844) * screenHeight,
                backgroundImage: ExactAssetImage("assets/images/Perfil_teste.png"),
              ),
            ),
          ),

          titleSpacing: (10 / 390) * screenWidth,
          
          title: Container(
            margin: EdgeInsets.only(top: (10.0 / 844) * screenHeight),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(nome, style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w600, color: Colours.cinza1)),
                RichText(
                  
                  text: TextSpan(
                    text: "Editar perfil",
                    style: GoogleFonts.firaSans(fontSize: 16, fontWeight: FontWeight.w400, color: Colours.azul0),
                    recognizer: TapGestureRecognizer()..onTap = () {} //BOTAO EDITAR PERFIL
                  ),
                ),
              ],
            )
          ),
          
          actions: [
            Padding(
              padding: EdgeInsets.only(right: (20.0 / 390) * screenWidth),
              child: IconButton(
                //BOTAO DE SAIR DO PERFIL
                onPressed: (){
                  AutenticacaoServico().deslogar();
                },
                icon: Image.asset("assets/images/Logout.png"),
              ),
            ),
          ],
        ),
      

      bottomNavigationBar: Container(
        margin: EdgeInsets.fromLTRB(28, 0, 28, 30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Color(0xFFE4E4E4).withValues(alpha: 0.5)),
        ),
        child: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
            child: NavigationBarTheme(
              data: NavigationBarThemeData(
                labelTextStyle: WidgetStateTextStyle.resolveWith(
                  (Set<WidgetState> states) => states.contains(WidgetState.selected)
                    ? GoogleFonts.firaSans(fontSize: 14, fontWeight: FontWeight.w700, color: Color(0xFF3777B2))
                    : GoogleFonts.firaSans(fontSize: 14, fontWeight: FontWeight.w400, color: Colours.cinza4),
                ),
              ),
              child: NavigationBar(
                  height: 90,
                  elevation: 200,
                  selectedIndex: _paginaAtualIndex,
                  backgroundColor: Colors.white.withValues(alpha: 0),
                  indicatorColor: Colors.white.withValues(alpha: 0),
              
                  onDestinationSelected: (index) {
                    setState(() {
                      _paginaAtualIndex = index;
                    });
                  },
                
                  destinations: [
                    NavigationDestination(
                      icon: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(height: 12,),
                          Image.asset("assets/images/cargos_unselected.png"),
                        ],
                      ),
                      selectedIcon: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 68,
                            height: 3,
                            color: Colours.azul1,
                          ),
                          SizedBox(height: 9,),
                          Image.asset("assets/images/cargos_selected.png"),
                        ],
                      ),
              
                      label: 'Cargos',
                    ),
                    NavigationDestination(
                      icon: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(height: 12,),
                          Image.asset("assets/images/Add_User_unselected.png"),
                        ],
                      ),
                      selectedIcon: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 68,
                            height: 3,
                            color: Colours.azul1,
                          ),
                          SizedBox(height: 9,),
                          Image.asset("assets/images/Add_User_selected.png"),
                        ],
                      ),
              
                      label: 'Cadastro',
                    ),
                    
                  ],
                ),
            ),
          ),
        ),
      ),
      



      body: Stack(
        children: [
          Positioned(
            right: 0,
            bottom: 0,
            child: Image.asset("assets/images/Balls_down.png"),
          ),

          _navigator[_paginaAtualIndex],
        ],
      ),
      
    );
  }
}