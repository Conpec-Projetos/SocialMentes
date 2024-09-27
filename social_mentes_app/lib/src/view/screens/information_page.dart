//import 'dart:nativewrappers/_internal/vm/lib/ffi_native_type_patch.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'cargos_page.dart';

class InformationPage extends StatefulWidget {
  const InformationPage({super.key});

  @override
  _InformationPageState createState() => _InformationPageState();
}
  class _InformationPageState extends State<InformationPage> {
    LinearGradient ? _containerColor;
    String ? selectedButton;
    // bool gradient = false;
    bool gradient_Paciente = false;
    bool gradient_Responsavel = false;
    bool gradient_Administrador = false;
    bool gradient_Psicologo = false;

    void _onButtonPressed(String buttonName){
      setState(() {
        selectedButton = buttonName;
        print("Butão selecionado: $selectedButton");
      });
    
    
  }

    void estadoInicial(){
      super.initState();
       _containerColor = LinearGradient(colors:<Color>[Color.fromRGBO(175, 214, 250, 1), Color.fromRGBO(125, 185, 240, 1)] );
    }
    void changeColor(){ //melhorar essa lógica 
      setState(() {
       if (gradient_Paciente == false) {
        _containerColor = null;
       } else{
        _containerColor =  LinearGradient(colors:<Color>[Color.fromRGBO(175, 214, 250, 1), Color.fromRGBO(125, 185, 240, 1)] );
       }
       if (gradient_Administrador == false){
        _containerColor = null;
       }else{
        _containerColor =  LinearGradient(colors:<Color>[Color.fromRGBO(175, 214, 250, 1), Color.fromRGBO(125, 185, 240, 1)] );
       }
       if (gradient_Responsavel == false){
        _containerColor = null;
       }else{
        _containerColor =  LinearGradient(colors:<Color>[Color.fromRGBO(175, 214, 250, 1), Color.fromRGBO(125, 185, 240, 1)] );
       }
       if (gradient_Psicologo == false){
        _containerColor = null;
       }else{
        _containerColor =  LinearGradient(colors:<Color>[Color.fromRGBO(175, 214, 250, 1), Color.fromRGBO(125, 185, 240, 1)] );
       }
      });
      
    }


  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: screenHeight*35/844,
            left: 30*screenWidth/390,
            child: GestureDetector(
              onTap: () {
                showDialog(context: context, builder: (BuildContext context) {
                  return AlertDialog(
                    content: Stack(
                      children: [
                        Container(
                        height: screenWidth*300/390,
                        width: screenWidth*300/390,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2.5),
                        ),
                    ),
                    Positioned(
                      child: Image.asset("images/LogoSociaMentes2.png"),
                      top: screenWidth*18/390,
                      left: screenWidth*87/390,
                    ),
                    Positioned(
                      child: Image.asset("images/Vector.png"),
                      top: screenWidth*31/390,
                      left: screenWidth*130/390,
                    ),
                    Positioned(
                      top: screenWidth*30/390,
                      left: screenWidth*240/390,
                      child:GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Image.asset("images/X.png"),
                      )
                    ),
                    Positioned(
                      top: screenWidth*75/390,
                      child: Container(
                        width: screenWidth*239/390 ,
                        alignment: Alignment.center,
                        child: Padding(
                          padding: EdgeInsets.only(left:31),
                          child: Text("Você tem certeza que deseja sair?", 
                          textAlign: TextAlign.center,
                          style: GoogleFonts.firaSans(
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                            color: Color.fromRGBO(69, 69, 69, 1)
                          ),
                        ),
                      ),
                    )
                    ),
                    Positioned(
                      top: screenWidth*143/390 ,
                      child: Container(
                        width: screenWidth*249/390,
                        child: Padding(
                          padding: EdgeInsets.only(left:26),
                          child: Text("As mudanças que você deseja fazer ainda não foram salvas!",
                          textAlign: TextAlign.center ,
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Color.fromRGBO(114, 114, 114, 1)
                          ),),
                        ),
                      ),
                    ),
                    Positioned(
                      top: screenWidth*216/390,
                      left:screenWidth*90/390 ,
                      child:Container(
                    width: 105,
                    height: 44,
                    padding: const EdgeInsets.all(10),
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 2, color: Color(0xFF4F94D4)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: GestureDetector(
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => CargosPage())),
                      child:Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'SAIR',
                          style: TextStyle(
                            color: Color(0xFF4F94D4),
                            fontSize: 16,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            height: 0,
                          ),
                        ),
                  
                      ],
                    ), 
                    ) 
                  ),
                    )
                      ],
                    )      
                  );
                });
              },
              child: Image.asset("images/back_button_information_page.png")
            )
          )
            ,
            Positioned(
              top: 0,
              right: 0,
              child: Image.asset("images/up_image.png")),
            Positioned(
              top: screenHeight*41/844,
              left: screenWidth*80/390,
              child:Container(
                width: screenWidth*70/390,
                height: 35*screenHeight/844,
                child: Text("Voltar",
                style: GoogleFonts.firaSans(
                  fontSize:24,//pensar em forma de deixar responsivo
                  color: Color.fromRGBO(69,69,69,1),
                  fontWeight: FontWeight.w400),
                  ),
              ) ),
            Positioned(
              top: 205*screenHeight/844,
              left: 145*screenWidth/390,
              child: Image.asset("images/seiji_info_page.png"), //pensar na responsiidade do tamanho das imagens
            ),
            Positioned(
              top: 320*screenHeight/844,
              left: 130*screenWidth/390,
              child: Text("Fábio Satoh",
                      style: GoogleFonts.firaSans(
                        fontSize: 24,
                        color: Color.fromRGBO(69, 69, 69, 1),
                        fontWeight:FontWeight.w500)
                        ),
            ),
            Positioned(
              top: 355.5*screenHeight/844,
              left: 153*screenWidth/390,
              child: Image.asset("images/maleta_icon.png"),
            ),
            Positioned(
              top: 351*screenHeight/844,
              left: 168*screenWidth/390,
              child: Text("Psicólogo",
                      style: GoogleFonts.firaSans(
                        fontSize: 16,
                        color: Color.fromRGBO(69, 69, 69, 1),
                        fontWeight: FontWeight.w400)
                        ),
            ),
            Positioned(
              top: 390*screenHeight/844,
              left: 58*screenWidth/390,
              child: Container(
                width: 274*screenWidth/390,
                height: 0.8*screenHeight/844,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromRGBO(206, 231, 255,0.53),
                      Color.fromRGBO(125,185 ,240 ,1 ),
                      Color.fromRGBO(206, 231,255 ,1)
                    ]
                  )
                ),
              ) ),
            Positioned(
              top: 410*screenHeight/844,
              left: 162*screenWidth/390,
              child: Text("CARGOS", 
                        style: GoogleFonts.firaSans(
                          fontSize: 18,
                          color: Color.fromRGBO(69, 69, 69, 1),
                          fontWeight: FontWeight.w500,)
                        )
            ),

            //botões de paciente e psicólogo
      
        Positioned(
          top: 452*screenHeight/844,
          left: 61*screenWidth/390,
          child:GestureDetector(
            onTap: () => setState(() {
              _onButtonPressed("Paciente");
              if (selectedButton == "Paciente"){
                gradient_Paciente = true;
                gradient_Administrador = false;
                gradient_Psicologo = false;
                gradient_Responsavel = false;
              }
              if (gradient_Paciente = true){
                changeColor();
              }
            }),
            child:Container(
            height: 42*screenHeight/844,
            width: 110*screenWidth/390,
            padding: EdgeInsets.symmetric(horizontal:  10*screenWidth/390, vertical:5*screenHeight/844 ), //deixar responsivo
            decoration: ShapeDecoration(
              gradient:  _containerColor,
              shape: RoundedRectangleBorder(
              side: BorderSide(width: 2, color: Color.fromRGBO(114, 114, 114, 1)), //deixar responsivo
              borderRadius: BorderRadius.circular(5)),
            ),
            child: 
            Align(
              alignment: Alignment.center,
              child:Text("Paciente", 
            style: GoogleFonts.firaSans(
              fontSize: screenHeight/844 * 18 ,
              fontWeight: FontWeight.w400,
              color: Color.fromRGBO(114, 114, 114, 1)
            )),
            ) 
            ),
          ), 
          ),
          
          
          Positioned(
          top: 452*screenHeight/844,
          left: screenWidth*186/390,
          child: GestureDetector(
            onTap: () => setState(() {
              _onButtonPressed("Responsável");
              if (selectedButton == "Responsável"){
                gradient_Paciente = false;
                gradient_Administrador = false;
                gradient_Psicologo = false;
                gradient_Responsavel = true;
              }
              if (gradient_Responsavel == true){
                changeColor();
              }
            }),
            child:Container(
            height: 42*screenHeight/844,
            width: 143*screenWidth/390,
            padding: EdgeInsets.symmetric(horizontal: 10*screenWidth/390, vertical:5*screenHeight/844 ), //deixar responsivo
            decoration: ShapeDecoration(
              gradient: _containerColor,
              shape: RoundedRectangleBorder(
              side: BorderSide(width: 2, color: Color(0xFFD7D7D7)), //deixar responsivo
              borderRadius: BorderRadius.circular(5)),
            ),
            child: Align(
              alignment: Alignment.center,
              child: Text("Responsável",
            style: GoogleFonts.firaSans(
              fontSize: screenHeight/844 * 18 ,
              fontWeight: FontWeight.w400,
              color: Color.fromRGBO(114, 114, 114, 1)
            )),
            ),
            
            ),
          ) , 
          ),
  
          Positioned(
          top: 514*screenHeight/844,
          left: screenWidth*50/390,
          child:GestureDetector(
            onTap: () => setState(() {
               _onButtonPressed("Administrador");
              if (selectedButton == "Administrador"){
                gradient_Paciente = false;
                gradient_Administrador = true;
                gradient_Psicologo = false;
                gradient_Responsavel = false;
              }
              if (gradient_Administrador = true){
                changeColor();
              }
            }),
            child:Container(
            height: 42*screenHeight/844,
            width: 157*screenWidth/390,
            padding: EdgeInsets.symmetric(horizontal:  10*screenWidth/390, vertical:5*screenHeight/844 ), //deixar responsivo
            decoration: ShapeDecoration(
              gradient: _containerColor,
              shape: RoundedRectangleBorder(
              side: BorderSide(width: 2, color: Color(0xFFD7D7D7)), //deixar responsivo
              borderRadius: BorderRadius.circular(5)),
            ),
            child: Align(
              alignment: Alignment.center,
              child: Text("Administrador",
            style: GoogleFonts.firaSans(
              fontSize: screenHeight/844 * 18 ,
              fontWeight: FontWeight.w400,
              color: Color.fromRGBO(114, 114, 114, 1)
            )),
            ),
            
            ),
          ) ,
          ),
          Positioned(
          top: 514*screenHeight/844,
          left: screenWidth*222/390,
          child:GestureDetector(
            onTap: () => setState(() {
              _onButtonPressed("Psicólogo");
              if (selectedButton == "Psicólogo"){
                gradient_Paciente = false;
                gradient_Administrador = false;
                gradient_Psicologo = true;
                gradient_Responsavel = false;
              }
              if (gradient_Psicologo = true){
              changeColor();
              }
            }),
            child: Container(
            height: 42*screenHeight/844,
            width: 119*screenWidth/390,
            padding: EdgeInsets.symmetric(horizontal:  10*screenWidth/390, vertical:5*screenHeight/844 ), //deixar responsivo
            decoration: ShapeDecoration(
              gradient: _containerColor,
              shape: RoundedRectangleBorder(
              side: BorderSide(width: 2, color: Color(0xFFD7D7D7)), //deixar responsivo
              borderRadius: BorderRadius.circular(5)),
            ),
            child: Align(
              alignment: Alignment.center,
              child: Text("Psicólogo",
            style: GoogleFonts.firaSans(
              fontSize: screenHeight/844 * 18 ,
              fontWeight: FontWeight.w400,
              color: Color.fromRGBO(114, 114, 114, 1)
            )),
            ),
            
            ),
          ) ,
          ),
          Positioned(
              bottom: 0,
              right: 0,
              child: Image.asset("images/down_image_information_page.png")),
        ],
      ),
    );
  }
}