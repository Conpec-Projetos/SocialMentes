import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:social_mentes/src/view/checklist_questions/objetive_questions.dart';
import 'package:social_mentes/src/view/firebase/data_checklist.dart';


class Test extends StatefulWidget {
  final double screenHeight;
  final double screenWidht;
  final String competence;
  final String level;
  final int index;
  const Test({
    super.key, 
    required this.screenHeight, 
    required this.screenWidht,
    required this.competence,
    required this.level,
    required this.index
    });

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  List<Map<String, dynamic>> vector_competence = [];
  Set<int> viewedQuestions = {}; // Armazena os índices das perguntas vistas
  late ScrollController _scrollController;
  double lastScrollOffset = 0.0;
  bool showSaveButton = false; // Define se o botão será exibido
  @override
  void initState() {
    super.initState();
    _loadData();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }
  List<int> list_counter = [];
  Future<void> _loadData() async {
    List<Map<String, dynamic>> data = await getDataChecklist(widget.competence, widget.level);
    setState(() {
  vector_competence = data;  
  });
}
    void _onScroll() {
    double currentOffset = _scrollController.offset;
    double maxScroll = _scrollController.position.maxScrollExtent;
    double viewportFraction = 0.8; // Percentual necessário para considerar uma pergunta vista

    // Quando desliza para baixo, adicionamos ao conjunto
    if (currentOffset > lastScrollOffset) {
      for (int i = 0; i < vector_competence.length; i++) {
        double itemPosition = i * (widget.screenHeight * 0.15); // Aproximação da altura do item
        if (currentOffset >= itemPosition * viewportFraction) {
          viewedQuestions.add(i);
        }
      }
    } 
    // Quando desliza para cima, removemos do conjunto
    else {
      for (int i = 0; i < vector_competence.length; i++) {
        double itemPosition = i * (widget.screenHeight * 0.15);
        if (currentOffset < itemPosition * viewportFraction) {
          viewedQuestions.remove(i);
        }
      }
    }

    // Atualiza a exibição do botão
    setState(() {
      showSaveButton = viewedQuestions.length >= vector_competence.length;
    });

    lastScrollOffset = currentOffset;
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }


  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidht = MediaQuery.of(context).size.width;
    return Scaffold(
      bottomNavigationBar: 
      SizedBox(
        height: 100*screenHeight/844,
        width: screenWidht,
        child:Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset("images/bolas_baixo.png"),
                ],
              ),),
      body: SingleChildScrollView(
        child: Column(
            children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Image.asset("images/back_button.png") ,
                ),
                SizedBox(
                  width:10*screenWidht/390 ,
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
                Image.asset("images/balls_up.png"),
              ],
            ),
            
            Row(
              children: [
                SizedBox(
                  width: 15*screenWidht/390,
                ),
                Container(
                height: 40*screenHeight/844 ,
                width: 269*screenWidht/390,
                child: Row(
                  children: [
                    Image.asset("images/arrow_checklist.png"),
                    SizedBox(width: 15,),
                    Text("${widget.competence} - nível ${widget.level}", style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w600
                    ),)
              
                  ],
                ),
              ),
            ]),
            SizedBox(
              height: 550 * screenHeight / 890,
              child: NotificationListener<ScrollUpdateNotification>(
                onNotification: (scrollNotification) {
                  double maxScroll = _scrollController.position.maxScrollExtent;
                  double currentScroll = _scrollController.position.pixels;

                  if (currentScroll >= maxScroll * 0.9) {
                    setState(() {
                      viewedQuestions =
                          List.generate(vector_competence.length, (i) => i)
                              .toSet();
                    });
                  }
                  return true;
                },
                child: ListView.builder(
                  controller: _scrollController,
                  itemCount: vector_competence.length,
                  itemBuilder: (context, index) {
                    return Visibility(
                      key: ValueKey(index),
                      visible: true,
                      child: ObjetiveQuestions(
                        description:
                            vector_competence[index]['description'] ??
                                "teste teste teste",
                        question:
                            vector_competence[index]['question'] ??
                                "testeQ testeQ testeQ",
                        screenHeight: widget.screenHeight,
                        screenWidht: widget.screenWidht,
                        index: index + 1,
                      ),
                    );
                  },
                ),
              ),
            ),
            SizedBox(
              height: 20*screenHeight/844,
            ),
            if (showSaveButton)
            Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: Row(
                children: [
                  const SizedBox(width: 10,),
                  GestureDetector(
                    onTap: () => {},
                    child: Container(
                      width: 230*screenWidht/390,
                      height: 44*screenHeight/844,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color(0xFF7DB9F0)
                        ),
                        borderRadius: BorderRadius.circular(15)
                      ),
                        child: Row(
                      children: [
                        const SizedBox(width: 10,),
                        Text("ADICIONAR CHECKLIST", style: GoogleFonts.poppins(
                          color: const Color(0xFF7DB9F0),
                          fontSize: 14,
                          fontWeight: FontWeight.w600
                        ),),
                         SizedBox(
                          width: 10*screenWidht/390
                        ),
                        Image.asset("images/checklist_icon.png")
                                    ])),
                  ),
                SizedBox(width: 10*screenWidht/390,),
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                            return AlertDialog(
                              content: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  // color: const Color(0xFFF4F4F4)
                                ),
                                height: 300*screenWidht/390,
                                width: 300*screenWidht/390,
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(width: 103*screenWidht/390,),
                                        Image.asset("images/logo_socialmentes.png"),
                                        SizedBox(width: 58*screenWidht/390,),
                                        GestureDetector(
                                          onTap: (){
                                            Navigator.of(context).pop();
                                          },
                                          child: Image.asset("images/X_icon.png", height: 14*screenWidht/390, width: 14*screenWidht/390,),
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 15*screenWidht/390),
                              Row(
                                children: [
                                  SizedBox(
                                    height:60*screenHeight/844 ,
                                    width: 239*screenWidht/390,
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 10*screenWidht/390),
                                      child: Text(
                                          "Você deseja finalizar o seu teste?",
                                        // overflow: TextOverflow.,
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.poppins(
                                        fontSize: 20*screenHeight/844,
                                        fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                                                     ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 30*screenHeight/844,),
                              SizedBox(
                                height:60*screenHeight/844 ,
                                width: 239*screenWidht/390,
                                child: Text(
                                'Caso finalizado, você não poderá alterá-lo depois!',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                fontSize: 16*screenHeight/844,
                                fontWeight: FontWeight.w500,
                                ),
                                                            ),
                              ),
                            SizedBox(height: 40*screenWidht/390,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                height: 44 * screenHeight / 844,
                                width: 105 * screenWidht / 390,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                  color: const Color(0xFFF83D70),
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                  child: Text(
                                  "Finalizar",
                                  style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xFFF83D70),
                                  ),
                                  ),
                                ),
                                ),
                                SizedBox(width: 20),
                                Container(
                                height: 44 * screenHeight / 844,
                                width: 105 * screenWidht / 390,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                  color: const Color(0xFF7DB9F0),
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                  child: Text(
                                  "Salvar",
                                  style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xFF7DB9F0),
                                  ),
                                  ),
                                ),
                                ),
                              ],
                              ),
                                  ],
                                ),
                              ),
                              
                            // shape: RoundedRectangleBorder(
                            //   borderRadius: BorderRadius.circular(10),
                              
                            // ),
                            // title: Column(
                            //   children: [
                            //   Row(
                            //     mainAxisAlignment: MainAxisAlignment.start,
                            //     children: [
                            //       SizedBox(width: 80,),
                            //       Image.asset("images/logo_socialmentes.png"),
                            //       SizedBox(width: 60,),
                            //         GestureDetector(
                            //         onTap: () {
                            //           Navigator.of(context).pop();
                            //         },
                            //         child: Image.asset("images/X_icon.png"))
                            //     ],
                            //   ), // Adicione a imagem aqui
                            //   SizedBox(height: 10),
                            //   Text(
                            //     "Você deseja finalizar o seu teste?",
                            //     style: GoogleFonts.poppins(
                            //     fontSize: 20,
                            //     fontWeight: FontWeight.w500,
                            //     ),
                            //   ),
                            //   ],
                            // ),
                            // content: Text(
                            //   'Caso finalizado, você não poderá alterá-lo depois!',
                            //   style: GoogleFonts.poppins(
                            //   fontSize: 16,
                            //   fontWeight: FontWeight.w500,
                            //   ),
                            // ),
                            // actions: [
                            //   Row(
                            //   mainAxisAlignment: MainAxisAlignment.center,
                            //   children: [
                            //     Container(
                            //     height: 44 * screenHeight / 844,
                            //     width: 105 * screenWidht / 390,
                            //     decoration: BoxDecoration(
                            //       border: Border.all(
                            //       color: const Color(0xFFF83D70),
                            //       ),
                            //       borderRadius: BorderRadius.circular(10),
                            //     ),
                            //     child: Center(
                            //       child: Text(
                            //       "Finalizar",
                            //       style: GoogleFonts.poppins(
                            //         fontSize: 16,
                            //         fontWeight: FontWeight.w500,
                            //         color: const Color(0xFFF83D70),
                            //       ),
                            //       ),
                            //     ),
                            //     ),
                            //     SizedBox(width: 20),
                            //     Container(
                            //     height: 44 * screenHeight / 844,
                            //     width: 105 * screenWidht / 390,
                            //     decoration: BoxDecoration(
                            //       border: Border.all(
                            //       color: const Color(0xFF7DB9F0),
                            //       ),
                            //       borderRadius: BorderRadius.circular(10),
                            //     ),
                            //     child: Center(
                            //       child: Text(
                            //       "Salvar",
                            //       style: GoogleFonts.poppins(
                            //         fontSize: 16,
                            //         fontWeight: FontWeight.w500,
                            //         color: const Color(0xFF7DB9F0),
                            //       ),
                            //       ),
                            //     ),
                            //     ),
                            //   ],
                            //   ),
                            // ],
                            );
                        },
                      );
                    },
                    child: Container(
                    height: 44*screenHeight/844,
                    width: 136*screenWidht/390,
                    decoration: BoxDecoration(
                      color: const Color(0xFF65AAEA),
                      borderRadius: BorderRadius.circular(10),
                      gradient: const LinearGradient(colors: <Color>[
                        Color(0xFF7DB9F0),
                        Color(0xFF5095D5)
                      ])
                    ),
                    child: Row(
                      children: [
                        const SizedBox(width: 10,),
                        Text("ENCERRAR", style: GoogleFonts.poppins(
                          color: const Color(0xFFEFF7FF),
                          fontSize: 16,
                          fontWeight: FontWeight.w600
                        ),),
                        const SizedBox(
                          width: 5
                        ),
                        const Icon(
                          Icons.check,
                          color: Color(0xFFEFF7FF),
                          size: 20,
                        )
                    
                      ],
                    ),
                                    ),
                  ),])),
            // Image.asset("images/save_button.png"),
        ]),
      )
    );
  }
}