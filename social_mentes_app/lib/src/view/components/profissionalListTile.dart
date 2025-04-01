import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:social_mentes/src/view/models/userPaciente.dart';
import 'package:provider/provider.dart';

class PopUpItemsText extends StatefulWidget {
  final String text;
  final String data;
  const PopUpItemsText({
    super.key,
    required this.text,
    required this.data,
  });

  @override
  State<PopUpItemsText> createState() => _PopUpItemsTextState();
}

class _PopUpItemsTextState extends State<PopUpItemsText> {
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: widget.text,
            style: GoogleFonts.firaSans(
              color: const Color.fromARGB(255, 114, 114, 114),
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: widget.data,
            style: GoogleFonts.firaSans(
              color: const Color.fromARGB(255, 114, 114, 114),
            ), 
          ),
        ],
      ),
    );
  }
}

class ProfListTile extends StatefulWidget {
  final Size size;
  final List<String> list;
  final String type;
  int index;

  ProfListTile({
    super.key,
    required this.size,
    required this.list,
    required this.index,
    required this.type,
    });

  @override
  State<ProfListTile> createState() => _ProfListTileState();
}

class _ProfListTileState extends State<ProfListTile> {

  void _deleteProExt() {
    final userData = Provider.of<UserPaciente>(context, listen: false);
    if (widget.type == 'Profissional') {
      userData.profissionais.removeAt(widget.index);
    } else if (widget.type == 'Intervenção') {
      userData.intervencao.removeAt(widget.index);
    }
    userData.notifyListeners();
  }

  void showProfExt() {
    showDialog(
      context: context, 
      builder: (BuildContext context) => Container(
        width: widget.size.width * 300/390,
        height: double.minPositive,
        child: AlertDialog(
          backgroundColor: Colors.white,
          title: SizedBox(
            width: widget.size.width * 300/390,
            height: widget.size.height * 70/844,
            child: Stack(
              children: [
                Positioned(
                  top: 23,
                  right: 153,
                  child: Image.asset('../assets/images/LogoSociaMentes2 1.png')),
                Positioned(
                  top: 40,
                  right: 105,
                  child: Image.asset('../assets/images/LogoTextoSocialMentes.png')),
                Positioned(
                  top: 35,
                  right: 30,
                  child: InkWell(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(
                      Icons.close,
                      color: Color.fromARGB(255, 171, 171, 171),
                    ),
                  ),
                ),
              ],
            ),
          ),
          content: Column(
            children: [
              PopUpItemsText(
                text: 'Nome: ', 
                data: widget.list[0],
              ),
              SizedBox(height: widget.size.height * 15/844),
              PopUpItemsText(
                text: 'Função: ', 
                data: widget.list[3],
              ),
              SizedBox(height: widget.size.height * 15/844),
              PopUpItemsText(
                text: 'Telefone: ', 
                data: widget.list[2],
              ),
              SizedBox(height: widget.size.height * 15/844),
              PopUpItemsText(
                text: 'Email: ', 
                data: widget.list[1],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size.width * 350/390,
      height: widget.size.height * 23/844,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 2,
            child: SizedBox(
              width: widget.size.width * 194/390,
              height: widget.size.height * 19/844,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap:() => showProfExt(),
                    child: const Icon(
                      Icons.info,
                      color: Color.fromARGB(255, 114, 114, 114),
                      size: 15,
                    ),
                  ),
                  Text(
                    widget.list[0],
                    style: GoogleFonts.firaSans(
                      color: const Color.fromARGB(255, 114, 114, 114),
                    ),  
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 295,
            top: 0,
            child: InkWell(
              onTap: () => _deleteProExt(),
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: Container(
                width: 55,
                height: 23,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(width: 2.50, color: Color(0xFFFF87A8),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Center(
                  child: Text(
                    'APAGAR',
                    style: GoogleFonts.poppins(
                      color: const Color(0xFFFF87A8),
                      fontSize: 10,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}