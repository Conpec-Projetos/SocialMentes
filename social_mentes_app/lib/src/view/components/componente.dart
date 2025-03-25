import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WidgetPaciente extends StatelessWidget {
  final String name;
  final String cargo;
  final String foto;
  const WidgetPaciente({super.key,required this.name, required this.cargo, required this.foto});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
            width: screenWidth * (146 / 390),
            height: screenHeight * (138 / 844),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                width: 1,
                color: const Color(0xFFE5E5E5)
              ),
              gradient: const LinearGradient(colors: <Color>[
                Color(0xFFEDEDED),
                Color(0xFFD9D9D9)
              ]) 
            ),
      child: Stack(
          children: [
            Positioned(
              top: screenHeight * (30 / 844),
              left: screenWidth * (50 / 390),
              child: Image.network(foto, height: 40*screenHeight/844,width: 40*screenWidth/396,),
            ),
            Positioned(
              top: screenHeight * (70 / 844),
              left: screenWidth * (25 / 390),
              child: Column(
                children: [
                  SizedBox(
                    width: 90 * screenWidth / 390,
                    child: Center(
                      child: Text(
                        name,
                        style: GoogleFonts.firaSans(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: const Color.fromRGBO(69, 69, 69, 1),
                        ),
                        maxLines: 2,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenHeight*5/844,
                  ),
                  Row(
                    children: [
                      Image.asset("images/maleta_icon.png"),
                      SizedBox(
                        width: screenWidth * (7.5 / 390),
                      ),
                      Text(
                  cargo,
                  style: GoogleFonts.firaSans(
                    fontSize: 8,
                    fontWeight: FontWeight.w400,
                    color: const Color.fromRGBO(69, 69, 69, 1),
                  ),)
                    ],
                  )
                ],
              )  
              ),
            ]),
            );
  }
}