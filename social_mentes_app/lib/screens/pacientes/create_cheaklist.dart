import 'package:flutter/material.dart';
import 'package:social_mentes/common/colors.dart';
import 'package:uuid/uuid.dart';
import 'package:google_fonts/google_fonts.dart';

import 'competencias_list.dart';
import 'package:social_mentes/class.dart';
import 'package:social_mentes/models/model_questions.dart';
import 'package:social_mentes/components/func_change_state.dart';

class CreateProtocols2 extends StatefulWidget {
  const CreateProtocols2({super.key});

  @override
  State<CreateProtocols2> createState() => _CreateProtocols2State();
}

class _CreateProtocols2State extends State<CreateProtocols2> {
  bool state_button1 = false;
  bool state_button2 = false;
  bool state_button3 = false;
  bool state_button4 = false;
  bool state_icon_arrow = false;
  bool iconTapped = false;
  bool status_texto = false;
  String competence_text = "";
  String level_checklist = "";
  ImageProvider container_image =
      const AssetImage("assets/images/container_arrow.png");

  List<Map<String, dynamic>> selectedCompetences = [];
  final Uuid uuid = Uuid();

  int counter = 0;
  void addCompetence(String competence, String level, int index) {
    if(!selectedCompetences.any((element) => element["competence"] == competence)){
      setState(() {
      selectedCompetences.add({
        "competence": competence,
        "level": level,
        "id":uuid.v4()
      });
    });
    }
  }

  void uptade_iconTap(bool iconTap) {
      setState(() {
        iconTapped = iconTap;
      });
    }
  void removeCompetence(String id) {
    setState(() {
      selectedCompetences.removeWhere((element) => element['id'] == id);
    });
  }
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidht = MediaQuery.of(context).size.width;
    return Scaffold(
        bottomNavigationBar: SizedBox(
        height: 110*screenHeight/844,
        width: screenWidht,
        child:Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset("assets/images/bolas_baixo.png"),
                ],
              ),),
        body:SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Image.asset("assets/images/back_button.png") ,
                ),
                SizedBox(
                  width:10*screenWidht/392 ,
                ),
                Text(
                  "Voltar",
                  style: GoogleFonts.firaSans(
                    fontWeight: FontWeight.w400,
                    fontSize: 24,
                    color: const Color.fromRGBO(69, 69, 69, 1)
                  ),
                ),
                SizedBox(
                  width: 40*screenWidht/390,
                ),
                Image.asset("assets/images/defaultBG_up.png"),
              ],
            ),      
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 63 * screenWidht / 390,
                  height: 24 * screenHeight / 844,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: const Color.fromRGBO(114, 114, 114, 1),
                        width: 1.5),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Stack(
                    children: [
                      Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 7 * screenWidht / 390,
                              vertical: 5 * screenHeight / 844),
                          child: Image.asset(
                            "assets/images/icon_tabela.png",
                            height: 11 * screenHeight / 844,
                            width: 11 * screenHeight / 844,
                          )),
                      Padding(
                          padding: EdgeInsets.only(
                              left: 18 * screenWidht / 390,
                              top: 2 * screenWidht / 390),
                          child: Text(
                            "Tabela",
                            style: GoogleFonts.firaSans(
                                fontSize: 12 * screenWidht / 390,
                                fontWeight: FontWeight.w400,
                                color: const Color.fromRGBO(114, 114, 114, 1)),
                          )),
                    ],
                  ),
                ),
                SizedBox(
                  width: 10 * screenWidht / 390,
                ),
                Container(
                  width: 63 * screenWidht / 390,
                  height: 24 * screenHeight / 844,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: const Color.fromRGBO(114, 114, 114, 1),
                        width: 1.5),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Stack(
                    children: [
                      Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 5 * screenWidht / 390,
                              vertical: 5 * screenHeight / 844),
                          child: Image.asset(
                            "assets/images/grafico_icon.png",
                            height: 11 * screenHeight / 844,
                            width: 11 * screenHeight / 844,
                          )),
                      Padding(
                          padding: EdgeInsets.only(
                              left: 16 * screenWidht / 390,
                              top: 2 * screenWidht / 390),
                          child: Text(
                            "Gráfico",
                            style: GoogleFonts.firaSans(
                                fontSize: 12 * screenWidht / 390,
                                fontWeight: FontWeight.w400,
                                color: const Color.fromRGBO(114, 114, 114, 1)),
                          )),
                    ],
                  ),
                ),
                SizedBox(
                  width: 10 * screenWidht / 390,
                ),
                Container(
                  width: 80 * screenWidht / 390,
                  height: 24 * screenHeight / 844,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: const Color.fromRGBO(114, 114, 114, 1),
                        width: 1.5),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 5 * screenWidht / 390,
                            vertical: 5 * screenHeight / 844),
                        child: Image.asset(
                          "assets/images/relatorio_icon.png",
                          height: 11 * screenHeight / 844,
                          width: 11 * screenHeight / 844,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 18 * screenWidht / 390,
                            top: 2 * screenWidht / 390),
                        child: Text(
                          "Relatório",
                          style: GoogleFonts.firaSans(
                              fontSize: 12 * screenWidht / 390,
                              fontWeight: FontWeight.w400,
                              color: const Color.fromRGBO(114, 114, 114, 1)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20 * screenHeight / 844,
            ),
            Padding(
              padding: EdgeInsets.only(left: 25 * screenWidht / 390),
              child: Text(
                "0055",
                style: GoogleFonts.poppins(
                  fontSize: 32,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            SizedBox(
              height: 15 * screenHeight / 844,
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: screenWidht * 25 / 390),
                  child: Image.asset("assets/images/rectangle_detail2.png"),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 5 * screenWidht / 390),
                  child: Text(
                    "nível",
                    style: GoogleFonts.poppins(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: const Color.fromRGBO(114, 114, 114, 1)),
                  ),
                )
              ],
            ),
            SizedBox(height: 10 * screenHeight / 844),
            Padding(
              padding: EdgeInsets.only(left: 25 * screenWidht / 390),
              child: Row(
                children: [
                  GestureDetector(
                    child: Container(
                      height: 85 * screenWidht / 844,
                      width: 85 * screenWidht / 844,
                      decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                              side: BorderSide(width: 4, color: bordaButton1),
                              borderRadius: BorderRadius.circular(6))),
                      child: Center(
                        child: Text(
                          "1",
                          style: GoogleFonts.firaSans(
                              fontSize: screenHeight * 25 / 844,
                              fontWeight: FontWeight.w600,
                              color: bordaButton1),
                        ),
                      ),
                    ),
                    onTap: () => setState(() {
                      state_button1 = true;
                      state_button2 = false;
                      state_button3 = false;
                      state_button4 = false;
                      level_checklist = "1";
                      setState(() {
                      stateButton(state_button1, state_button2, state_button3,
                            state_button4);
                      });
                    }),
                  ),
                  SizedBox(width: 17.5 * screenWidht / 390),
                  GestureDetector(
                    onTap: () => setState(() {
                      state_button2 = true;
                      state_button1 = false;
                      state_button3 = false;
                      state_button4 = false;
                      level_checklist = "2";
                      setState(() {
                        stateButton(state_button1, state_button2, state_button3,
                            state_button4);
                      });
                    }),
                    child: Container(
                      height: 85 * screenWidht / 844,
                      width: 85 * screenWidht / 844,
                      decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                              side: BorderSide(width: 4, color: bordaButton2),
                              borderRadius: BorderRadius.circular(6))),
                      child: Center(
                        child: Text(
                          "2",
                          style: GoogleFonts.firaSans(
                              fontSize: 25 * screenHeight / 844,
                              fontWeight: FontWeight.w600,
                              color: bordaButton2),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 17.5 * screenWidht / 390),
                  GestureDetector(
                    child: Container(
                      height: 85 * screenWidht / 844,
                      width: 85 * screenWidht / 844,
                      decoration: BoxDecoration(
                        border: Border.all(color: bordaButton3, width: 4),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Center(
                        child: Text(
                          "3",
                          style: GoogleFonts.firaSans(
                              fontSize: 25 * screenHeight / 844,
                              fontWeight: FontWeight.w600,
                              color: bordaButton3),
                        ),
                      ),
                    ),
                    onTap: () => setState(() {
                      state_button3 = true;
                      state_button1 = false;
                      state_button2 = false;
                      state_button4 = false;
                      level_checklist = "3";
                      stateButton(state_button1, state_button2, state_button3,
                          state_button4);
                    }),
                  ),
                  SizedBox(width: 17.5 * screenWidht / 390),
                  GestureDetector(
                    child: Container(
                      height: 85 * screenWidht / 844,
                      width: 85 * screenWidht / 844,
                      decoration: BoxDecoration(
                        border: Border.all(color: bordaButton4, width: 4),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Center(
                        child: Text(
                          "4",
                          style: GoogleFonts.firaSans(
                              fontSize: 25 * screenHeight / 844,
                              fontWeight: FontWeight.w600,
                              color: bordaButton4),
                        ),
                      ),
                    ),
                    onTap: () => setState(() {
                      state_button4 = true;
                      state_button1 = false;
                      state_button2 = false;
                      state_button3 = false;
                      level_checklist = "4";
                      stateButton(state_button1, state_button2, state_button3,
                          state_button4);
                    }),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10 * screenHeight / 844,
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 25 * screenWidht / 390),
                  child: Image.asset("assets/images/rectangle_detail2.png"),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 5 * screenWidht / 390),
                  child: Text(
                    "competência",
                    style: GoogleFonts.poppins(
                        color: const Color.fromRGBO(114, 114, 114, 1),
                        fontSize: 24 * screenHeight / 844,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10 * screenHeight / 844,
            ),
            Padding(
              padding: EdgeInsets.only(left: 25 * screenWidht / 390),
              child: Container(
                  height: 50 * screenHeight / 844,
                  width: 314 * screenWidht / 390,
                  decoration: BoxDecoration(
                      border: Border.all(color: arrowConatiner, width: 3),
                      borderRadius: BorderRadius.circular(15)),
                  child: Stack(
                    children: [
                    Positioned(
                        top: screenHeight * 10 / 844,
                        left: screenHeight * 5 / 390,
                        child: Container(),
                      
                    ),
                    Positioned(
                          top: 15 * screenHeight / 844,
                          left: 280 * screenWidht / 390,
                        child: GestureDetector(
                          onTap: () => setState(() {
                            state_icon_arrow = true;
                            stateArrow(state_icon_arrow);
                            outWidget();
                            if (stateButtonNotifer.value == true) {
                              showModalBottomSheet(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return CompetenciasList(
                                        stateButtonNotifer: stateButtonNotifer,
                                        competenceText: competence_text);
                                  }).then((competenciaSelecionada) {
                                if (competenciaSelecionada != null) {
                                  setState(() {
                                    competence_text =
                                        competenciaSelecionada['competencia'];
                                    selectedCompetences.add({
                                      "competence": competence_text,
                                      "level":level_checklist,
                                      "id": uuid.v4()
                                    });
                                  });
                                }
                              });
                            }
                          }),
                          child: Image(image: container_image),
                        ))
                  ])),
            ),
            SizedBox(height: 10 * screenHeight / 844),
            Row(children: [
              Padding(
                  padding: EdgeInsets.only(left: 25 * screenWidht / 390),
                  child: Image.asset("assets/images/rectangle_detail2.png")),
              Padding(
                  padding: EdgeInsets.only(left: 5 * screenWidht / 390),
                  child: Text(
                    "checklist",
                    style: GoogleFonts.poppins(
                        color: const Color.fromRGBO(114, 114, 114, 1),
                        fontSize: 24 * screenHeight / 844,
                        fontWeight: FontWeight.w700),
                  ))
            ]),   
          Column(
            children: [
              selectedCompetences.isEmpty
          ? Center(
              child: Text(
              "Não há testes ainda",
              style: GoogleFonts.inter(
                  fontStyle: FontStyle.italic,
                  fontSize: 20 * screenHeight / 844,
                  fontWeight: FontWeight.w500,
                  color: const Color.fromRGBO(171, 171, 171, 1)),
            ))
          : SizedBox(
              height: 80 * screenHeight / 844,
              child: ListView.builder(
                itemCount: selectedCompetences.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                  padding: EdgeInsets.only(bottom: 10 * screenHeight / 844),
                  child: ModelQuestions(
                    screenHeight: screenHeight,
                    screenWidht: screenWidht,
                    competence: selectedCompetences[index]["competence"] ?? '',
                    level: selectedCompetences[index]["level"] ?? '',
                    onDelete: () => removeCompetence(selectedCompetences[index]['id'],), 
                    index: index,
                  ),
                  );
                }),
            ),
              ],
            ),
            SizedBox(
              height: 10 * screenHeight / 844,
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 25 * screenWidht / 390),
                  child: Image.asset("assets/images/rectangle_detail2.png"),
                ),
                Padding(
                    padding: EdgeInsets.only(left: 5 * screenWidht / 390),
                    child: Text(
                      "intervenção",
                      style: GoogleFonts.poppins(
                          color: const Color.fromRGBO(114, 114, 114, 1),
                          fontSize: 24 * screenHeight / 844,
                          fontWeight: FontWeight.w700),
                    ))
              ],
            ),
            SizedBox(
              height: screenHeight * 24 / 844,
              width: screenWidht * 326 / 390,
              child: Center(
                child: Text(
                  "Não há planos ainda",
                  style: GoogleFonts.inter(
                      fontStyle: FontStyle.italic,
                      fontSize: 20 * screenHeight / 844,
                      fontWeight: FontWeight.w500,
                      color: const Color.fromRGBO(171, 171, 171, 1)),
                ),
              ),
            ),
            SizedBox(
              height: 40 * screenHeight / 844,
            ),
            Padding(
              padding: EdgeInsets.only(left: 21 * screenWidht / 390),
              child: Row(
                children: [
                  Container(
                      width: 207 * screenWidht / 390,
                      height: 44 * screenHeight / 844,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color.fromRGBO(248, 61, 112, 1),
                            width: 2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Stack(
                        children: [
                          Padding(
                              padding: EdgeInsets.only(
                                  top: 10 * screenHeight / 844,
                                  left: 10 * screenWidht / 390),
                              child: Text(
                                "CRIAR INTERVENÇÃO",
                                style: GoogleFonts.poppins(
                                    fontSize: 14 * screenWidht / 390,
                                    fontWeight: FontWeight.w600,
                                    color: const Color.fromRGBO(248, 61, 112, 1)),
                              )),
                          Padding(
                              padding: EdgeInsets.only(
                                left: screenWidht * 170 / 390,
                              ),
                              child: Center(
                                child: Image.asset(
                                  "assets/images/red_icon.png",
                                  height: 8 * screenHeight / 844,
                                  width: 14 * screenWidht / 390,
                                ),
                              ))
                        ],
                      )),
                  SizedBox(
                    width: 10 * screenWidht / 390,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        
                      });
                    },
                    child: Image.asset("assets/images/save_button.png",
                        width: 131 * screenWidht / 390,
                        height: 44 * screenHeight / 844),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50 * screenHeight / 844,
            ),
          ])));
        
  }
}
