import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:auto_size_text/auto_size_text.dart';

import '../common/colors.dart';

import 'package:intl/intl.dart';


class TesteAnteriorWidget extends StatelessWidget {
  final String id;
  final String data;
  final bool finalizado;
  const TesteAnteriorWidget({super.key, required this.id, required this.data, required this.finalizado});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    String dataFormat = DateFormat('dd/MM/yyyy').format(DateFormat("yyyy-MM-dd").parse(data));

    return SizedBox(
      width: (160.0 / 390) * screenWidth,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: (40/844) * screenHeight,
            width: (72/390)*screenWidth,
            child: Container(
              padding: EdgeInsets.fromLTRB((10/390)*screenWidth, (5/844)*screenHeight, (10/390)*screenWidth, (5/844)*screenHeight),
              decoration: BoxDecoration(
                border: Border.all(color: Colours.cinza4, width: 3),
                borderRadius: const BorderRadius.all(Radius.circular(15)),
              ),
                                
              child: Center(
                child: AutoSizeText(
                  id,
                  style: GoogleFonts.poppins(fontSize: 17, fontWeight: FontWeight.w600, color: Colours.cinza4),
                ),
              ),
            ),
          ),

          SizedBox(width: (5/390)*screenWidth,),

          Container(
            width: (80/390) * screenWidth,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeText(
                  dataFormat,
                  maxLines: 1,
                  style: GoogleFonts.firaSans(fontWeight: FontWeight.w400, color: Colours.cinza3),
                ),
                AutoSizeText(
                  (finalizado)? "Finalizado" : "Não finalizado",
                  maxLines: 1,
                  minFontSize: 1,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.firaSans(fontStyle: FontStyle.italic, color: (finalizado)? Colours.cinza3: const Color(0xFFFF336A)),
                ),
            
                
              ],
            ),
          ),
        ],
      ),
    );
  }
}