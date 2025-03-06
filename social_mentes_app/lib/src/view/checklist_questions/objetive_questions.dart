import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:social_mentes/src/view/firebase/data_checklist.dart';

class ObjetiveQuestions extends StatefulWidget {
  final String description;
  final String question;
  final double screenHeight;
  final double screenWidht;
  final int index;
  const ObjetiveQuestions({
  super.key, 
  required this.description, 
  required this.question,
  required this.screenHeight,
  required this.screenWidht,
  required this.index
  });

  @override
  State<ObjetiveQuestions> createState() => _ObjetiveQuestionsState();
}

class _ObjetiveQuestionsState extends State<ObjetiveQuestions> {
  String? _opcaoSelecionada;
  @override
  Widget build(BuildContext context) {
    return Container(
    
      child:Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${widget.index}. ${widget.question}",
              style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            Text(
              widget.description,
              style: GoogleFonts.firaSans(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: const Color.fromRGBO(114, 114, 114, 1)
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                _buildOpcao("Adquirido    "),
                const SizedBox(width:36),
                _buildOpcao("Não adquirido"),
              ],
            ),
            const SizedBox(height:6),
            Row(
              children: [
                _buildOpcao("Parcialmente"),
                const SizedBox(width: 30,),
                _buildOpcao("Sem oportunidade"),

              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildOpcao(String titulo) {
    bool isSelected = _opcaoSelecionada == titulo;

    return GestureDetector(
      onTap: () {
        setState(() {
          _opcaoSelecionada = titulo;
        });
      },
      child: Row(
        children: [
            Radio<String>(
            value: titulo,
            groupValue: _opcaoSelecionada,
            activeColor: Colors.blue,
            fillColor: WidgetStateProperty.resolveWith<Color>((states) {
              if (states.contains(WidgetState.selected)) {
                return Colors.blue;
              }
              return const Color.fromRGBO(171, 171, 171, 1);
            }),
            onChanged: (value) {
              setState(() {
                _opcaoSelecionada = value;
              });
            },
          ),
          Text(
            titulo,
            style: GoogleFonts.firaSans(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: isSelected ? Colors.blue : const Color.fromRGBO(171, 171, 171, 1),
            ),
          ),
        ],
      ),
    );
  }
}