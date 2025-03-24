import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:social_mentes/class.dart';

class CompetenciasList extends StatefulWidget {

  final ValueNotifier<bool> stateButtonNotifer;
  final String competenceText;

  CompetenciasList({super.key, required this.stateButtonNotifer, required this.competenceText});

  @override
  _CompetenciasListState createState() => _CompetenciasListState();
}

class _CompetenciasListState extends State<CompetenciasList> {
  final List<String> competencias = [
    'Comunicação Receptiva', 'Comunicação Expressiva',
    'Competências Sociais', "Imitação", "Cognição", "Jogo",
    "Motricidade Fina", "Motricidade Grossa", "Comportamento", "Independência Pessoal"
  ];

  int ? index_selecionado;
  bool state_image = false;
  Color color_word = Color.fromRGBO(114, 114, 114, 1);
  ImageProvider image_button = AssetImage('images/choose_button.png');
  dynamic texto;

  void check_color(bool stateColor) {
    setState(() {
      if (stateColor == true) {
        color_word = Color.fromRGBO(125, 185, 240, 1); // Cor quando ativo
      } else {
        color_word = Color.fromRGBO(114, 114, 114, 1); // Cor quando inativo
      }
    });
  }

  void appear_image(bool state_image) {
    if (state_image == true) {
      image_button = AssetImage('images/choose_button.png');
    } else {
      image_button = Null as ImageProvider<Object>;
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidht = MediaQuery.of(context).size.width;

    return ValueListenableBuilder<bool>(
      valueListenable: stateButtonNotifer, // Observa o estado de stateButtonNotifer
      builder: (context, state_wiget, child) {
        return Container(
          height: screenHeight * 463 / 844,
          width: screenWidht,
          child: Stack(
            children: [
              Positioned(
                top: screenHeight * 10 / 844,
                left: screenWidht * 161 / 390,
                child: Image.asset("images/rectangle_detail.png"),
              ),
              Positioned(
                top: screenHeight * 25 / 844,
                left: 76 * screenWidht / 390,
                child: Text(
                  "Escolha a competência",
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Color.fromRGBO(69, 69, 69, 1),
                  ),
                ),
              ),
              SizedBox(height: 97 * screenHeight / 844),
              Expanded(
                child: ListView.builder(
                  itemCount: competencias.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      child: Padding(
                        padding: index == 0
                            ? EdgeInsets.only(top: screenHeight * 59 / 844)
                            : EdgeInsets.all(3.5 * screenHeight / 844),
                        child: Center(
                          child: Text(
                            competencias[index],
                            style: GoogleFonts.firaSans(
                              fontSize: 20 * screenHeight / 844,
                              fontWeight: FontWeight.w400,
                              color: index_selecionado == index
                                  ? const Color.fromRGBO(125, 185, 240, 1)
                                  : const Color.fromRGBO(114, 114, 114, 1),
                            ),
                          ),
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          index_selecionado = index;
                          state_image = true;
                          print(index_selecionado);
                          print(competencias[index_selecionado!]);
                          appear_image(state_image);
                        });
                      },
                    );
                  },
                ),
              ),
              if (state_image == true)
                Positioned(
                  top: 420 * screenHeight / 844,
                  left: 19 * screenWidht / 390,
                  child: GestureDetector(
                    child: Image(
                      image: image_button,
                      height: 44 * screenHeight / 844,
                      width: 350 * screenWidht / 390,
                    ),
                    onTap: () {
                      widget.stateButtonNotifer.value = !widget.stateButtonNotifer.value;
                      if(index_selecionado != null){
                        Navigator.pop(context,{'stateButton': widget.stateButtonNotifer.value, 'competencia': competencias[index_selecionado!]});
                        
        
                      }
                    },
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
