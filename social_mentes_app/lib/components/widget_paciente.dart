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
    double space_name = 90 * (screenWidth / 390);

    return Container(
      padding: EdgeInsets.fromLTRB(
        30 * screenWidth / 390, 
        10 * screenHeight / 844, 
        30 * screenWidth / 390, 
        0
        ),
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.network(foto, height: 40*screenHeight/844,width: 40*screenWidth/396,),
          Column(
            children: [
              SizedBox(
                width: space_name,
                child: Center(
                  child: Text(
                    name,
                    style: GoogleFonts.firaSans(
                    fontSize: 12*screenWidth/390,
                    fontWeight: FontWeight.w500,
                    color: const Color.fromRGBO(69, 69, 69, 1),
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(
                height: screenHeight*5/844,
              ),
              Row(
                children: [
                  Image.asset("assets/images/maleta_icon.png"),
                  SizedBox(
                    width: screenWidth * (7.5 / 390),
                  ),
                  Text(
                    cargo,
                    style: GoogleFonts.firaSans(
                      fontSize: 8,
                      fontWeight: FontWeight.w400,
                      color: const Color.fromRGBO(69, 69, 69, 1),
                    ),
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}