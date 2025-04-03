import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:social_mentes/screens/pacientes/checklist_page.dart';

class ModelQuestions extends StatefulWidget {
  final double screenHeight;
  final double screenWidht;
  final String competence;
  final String level;
  final int index;
  final VoidCallback onDelete;
  const ModelQuestions({super.key, 
  required this.screenHeight, 
  required this.screenWidht,
  required this.competence,
  required this.level,
  required this.onDelete,
  required this.index
  });

  @override
  State<ModelQuestions> createState() => _ModelQuestionsState();
}

class _ModelQuestionsState extends State<ModelQuestions> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => ChecklistPage(screenHeight: widget.screenHeight, screenWidht: widget.screenWidht, competence: widget.competence, level: widget.level, index: widget.index
          ,)));
          print(
            widget.competence
          );
        },
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: 15*widget.screenWidht/390
              ),
              child: Image.asset("assets/images/container_arrow.png"),
              ),
              SizedBox(
                width: 10*widget.screenWidht/390,
              ),
              Text(
                "${widget.competence} - nível ${widget.level}", style: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 16*widget.screenWidht/390,),
              ),
              SizedBox(
                width: 10*widget.screenWidht/390,
              ),
              
              GestureDetector(
                onTap: () {
                  widget.onDelete();
                },
                child: Image.asset("assets/images/delete.png", width: 40*widget.screenWidht/390,))
          ],
        ),
      ),
      
    );
  }
}