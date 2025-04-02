import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:social_mentes/common/colors.dart';
import 'package:social_mentes/src/view/screens/protocolo_testes_anteriores.dart';

class ProtocoloPacienteWidget extends StatelessWidget {
  final String nome;
  final List<dynamic> testes;

  //TESTE
  final String foto;
  //---

  const ProtocoloPacienteWidget({super.key, required this.nome, required this.foto, required this.testes});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      
      height: (60 / 844) * screenHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: Cores.cinza2,
          width: 2,
        ),
      ),
      padding: EdgeInsets.fromLTRB((15.0 / 390) * screenWidth, (10.0 / 844) * screenHeight, (15.0 / 390) * screenWidth, (10.0 / 844) * screenHeight),
      margin: EdgeInsets.fromLTRB((25.0 / 390) * screenWidth, (10.0 / 844) * screenHeight, (25.0 / 390) * screenWidth, 0),

      child: Container(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  backgroundColor: Cores.cinza2,
                  radius: ((18 / 844) * screenHeight) + 2,
                  child: CircleAvatar(
                    radius: (18 / 844) * screenHeight,
                    backgroundImage: ExactAssetImage(foto),        
                  ),
                ),
                SizedBox(width: (10 / 390) * screenWidth,),
                SizedBox(
                  width: (210.0 / 390) * screenWidth,
                  child: Text(
                    nome,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.firaSans(
                      color: Cores.cinza4,
                      fontSize: 16,
                      fontWeight: FontWeight.w400
                    ),
                  ),
                ),
              ],
            ),
            Spacer(),
            SizedBox(
              width: (35.0 / 390) * screenWidth,
              child: IconButton(
                onPressed:  (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProtocoloTestesAnteriores(nome: nome, testes: testes,),),);
                },
                icon: Image.asset("../images/Add_report.png"),
              ),
            ),
          ],
        ),
      ),

    );
  }
}


