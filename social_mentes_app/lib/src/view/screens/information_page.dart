import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InformationPage extends StatefulWidget {
  const InformationPage({super.key});

  @override
  _InformationPageState createState() => _InformationPageState();
}
  class _InformationPageState extends State<InformationPage> {
    String ? selectedButton;

    void _onButtonPressed(String buttonName){
      setState(() {
        selectedButton = buttonName;
        print("Butão selecionado: $selectedButton");
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
            child: Image.asset("images/back_button_information_page.png")),
            Positioned(
              top: 0,
              right: 0,
              child: Image.asset("images/up_image.png")),
            Positioned(
              top: screenHeight*41/844,
              left: screenWidth*80/390,
              child:Container(
                width: screenWidth*65/390,
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
            onTap: () => _onButtonPressed("Paciente"),
            child:Container(
            height: 42*screenHeight/844,
            width: 110*screenWidth/390,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical:10 ), //deixar responsivo
            decoration: ShapeDecoration(shape: RoundedRectangleBorder(
              side: BorderSide(width: 2, color: Color(0xFFD7D7D7)), //deixar responsivo
              borderRadius: BorderRadius.circular(5)),
            ),
            child: 
            Align(
              alignment: Alignment.center,
              child:Text("Paciente", 
            style: GoogleFonts.firaSans(
              fontSize: 18,
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
            onTap: () => _onButtonPressed("Responsável"),
            child:Container(
            height: 42*screenHeight/844,
            width: 143*screenWidth/390,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical:10 ), //deixar responsivo
            decoration: ShapeDecoration(shape: RoundedRectangleBorder(
              side: BorderSide(width: 2, color: Color(0xFFD7D7D7)), //deixar responsivo
              borderRadius: BorderRadius.circular(5)),
            ),
            child: Align(
              alignment: Alignment.center,
              child: Text("Responsável",
            style: GoogleFonts.firaSans(
              fontSize: 18,
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
            onTap: () => _onButtonPressed("Administrador"),
            child:Container(
            height: 42*screenHeight/844,
            width: 157*screenWidth/390,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical:10 ), //deixar responsivo
            decoration: ShapeDecoration(shape: RoundedRectangleBorder(
              side: BorderSide(width: 2, color: Color(0xFFD7D7D7)), //deixar responsivo
              borderRadius: BorderRadius.circular(5)),
            ),
            child: Align(
              alignment: Alignment.center,
              child: Text("Administrador",
            style: GoogleFonts.firaSans(
              fontSize: 18,
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
            onTap: () => _onButtonPressed("Psicólogo"),
            child: Container(
            height: 42*screenHeight/844,
            width: 119*screenWidth/390,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical:10 ), //deixar responsivo
            decoration: ShapeDecoration(shape: RoundedRectangleBorder(
              side: BorderSide(width: 2, color: Color(0xFFD7D7D7)), //deixar responsivo
              borderRadius: BorderRadius.circular(5)),
            ),
            child: Align(
              alignment: Alignment.center,
              child: Text("Psicólogo",
            style: GoogleFonts.firaSans(
              fontSize: 18,
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