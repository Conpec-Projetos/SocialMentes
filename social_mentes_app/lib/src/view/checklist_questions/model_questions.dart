import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ModelQuestions extends StatelessWidget {
  final double screenHeight;
  final double screenWidht;
  final String competence;
  final String level;
  const ModelQuestions({super.key, 
  required this.screenHeight, 
  required this.screenWidht,
  required this.competence,
  required this.level
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(),
      child: GestureDetector(
        onTap: () {
          print(
            competence
          );
        },
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: 15*screenWidht/390
              ),
              child: Image.asset("images/container_arrow.png"),
              ),
              SizedBox(
                width: 10*screenWidht/390,
              ),
              Text(
                "$competence - nível $level", style: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 20,),
              )
          ],
        ),
      ),
      
    );
  }
}