import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:social_mentes/models/objetive_questions.dart';
import 'package:social_mentes/services/data_checklist.dart';

class ChecklistPage extends StatefulWidget {
    final double screenHeight;
  final double screenWidht;
  final String competence;
  final String level;
  final int index;
  const ChecklistPage ({
    super.key, 
    required this.screenHeight, 
    required this.screenWidht,
    required this.competence,
    required this.level,
    required this.index
    });
  
  @override
  State<ChecklistPage> createState() => _ChecklistPageState();
}

class _ChecklistPageState extends State<ChecklistPage> {
  List<Map<String, dynamic>> vector_competence = [];
  Set<int> viewedQuestions = {}; // Armazena os índices das perguntas vistas
  double lastScrollOffset = 0.0;
  bool showSaveButton = false; // Define se o botão será exibido
  ScrollController _scrollController = ScrollController();
  late double space;
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
  
  bool _showButtons = false;  // Controla a visibilidade dos botões

  // Função para detectar quando o usuário chegou ao final da lista
  void _onScroll() {
    if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
      setState(() {
        _showButtons = true;  // Mostrar os botões quando o final for alcançado
      });
    }
  }

  @override

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);  // Remove o listener quando o widget for destruído
    super.dispose();
  }
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidht = MediaQuery.of(context).size.width;
     if(screenWidht > 400){
      space = 70*screenWidht/390;
    }else{
      space = 49*screenWidht/390;
    }
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 35*screenHeight/844,
            left: 30*screenWidht/390 ,
            child: GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: Image.asset("assets/images/back_button.png") ,
            ),
          ),
    
          Positioned(
            top: 41*screenHeight/844,
            left: 80*screenWidht/390,
            child: Text(
              "Voltar",
              style: GoogleFonts.firaSans(
                fontWeight: FontWeight.w400,
                fontSize: 24,
                color: const Color.fromRGBO(69, 69, 69, 1)
              ),
            ),
          ),
          
          Positioned(
            top: 0,
            right: 0,
            child: Image.asset("assets/images/balls_up.png")),

            Positioned(
              top: 101*screenHeight/844,
              left: 30*screenWidht/390,
              child:Row(
          children: [
            SizedBox(
              width: 15*screenWidht/390,
            ),
            Container(
            height: 40*screenHeight/844 ,
            width: 269*screenWidht/390,
            child: Row(
              children: [
                Image.asset("assets/images/arrow_checklist.png"),
                SizedBox(width: 15,),
                Text("${widget.competence} - nível ${widget.level}", style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w600
                ),)
          
              ],
            ),
          ),
        ]),
         ),

          Positioned(
            top: 131 * screenHeight / 844,
            left: 5 * screenWidht / 390,
            child: SizedBox(
              height: 550 * screenHeight / 890,
              width: 380 * screenWidht / 390,
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      controller: _scrollController,
                      itemCount: vector_competence.length,
                      itemBuilder: (context, index) {
                        return Visibility(
                          key: ValueKey(index),
                          visible: true,
                          child: ObjetiveQuestions(
                            description: vector_competence[index]['description'] ?? "teste teste teste",
                            question: vector_competence[index]['question'] ?? "testeQ testeQ testeQ",
                            screenHeight: widget.screenHeight,
                            screenWidht: widget.screenWidht,
                            index: index + 1,
                          ),
                        );
                      },
                    ),
                  ),
                  if (_showButtons) 
                    SizedBox(
                      width: double.infinity,
                      height: 44 * screenHeight / 844,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              width: 230 * screenWidht / 390,
                              height: 44 * screenHeight / 844,
                              decoration: BoxDecoration(
                                border: Border.all(color: const Color(0xFF7DB9F0)),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Row(
                                children: [
                                  const SizedBox(width: 10),
                                  Text(
                                    "ADICIONAR CHECKLIST",
                                    style: GoogleFonts.poppins(
                                      color: const Color(0xFF7DB9F0),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(width: 10 * screenWidht / 390),
                                  Image.asset("assets/images/checklist_icon.png")
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 10 * screenWidht / 390),
                          GestureDetector(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    content: Container(
                                      height: 300 * screenWidht / 390,
                                      width: 300 * screenWidht / 390,
                                      child: Stack(
                                        children: [
                                          Column(
                                            children: [
                                              Container(
                                                width: 350 * screenWidht / 390,
                                                child: Row(
                                                  children: [
                                                    Padding(
                                                      padding: EdgeInsets.only(left: 90 * screenWidht / 390),
                                                      child: Image.asset(
                                                        "assets/images/logo_socialmentes.png",
                                                        width: 100 * screenWidht / 390,
                                                      ),
                                                    ),
                                                    SizedBox(width: space),
                                                    GestureDetector(
                                                      onTap: () {
                                                        Navigator.of(context).pop();
                                                      },
                                                      child: Image.asset(
                                                        "assets/images/X_icon.png",
                                                        height: 14 * screenWidht / 390,
                                                        width: 14 * screenWidht / 390,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(height: 15 * screenWidht / 390),
                                              Row(
                                                children: [
                                                  SizedBox(
                                                    height: 60 * screenHeight / 844,
                                                    width: 239 * screenWidht / 390,
                                                    child: Padding(
                                                      padding: EdgeInsets.only(left: 10 * screenWidht / 390),
                                                      child: Text(
                                                        "Você deseja finalizar o seu teste?",
                                                        textAlign: TextAlign.center,
                                                        style: GoogleFonts.poppins(
                                                          fontSize: 20 * screenHeight / 844,
                                                          fontWeight: FontWeight.w500,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: 30 * screenHeight / 844),
                                              SizedBox(
                                                height: 60 * screenHeight / 844,
                                                width: 239 * screenWidht / 390,
                                                child: Text(
                                                  'Caso finalizado, você não poderá alterá-lo depois!',
                                                  textAlign: TextAlign.center,
                                                  style: GoogleFonts.poppins(
                                                    fontSize: 16 * screenHeight / 844,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(height: 40 * screenWidht / 390),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    height: 44 * screenHeight / 844,
                                                    width: 105 * screenWidht / 390,
                                                    decoration: BoxDecoration(
                                                      border: Border.all(color: const Color(0xFFF83D70)),
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
                                                      border: Border.all(color: const Color(0xFF7DB9F0)),
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
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                            child: Container(
                              height: 44 * screenHeight / 844,
                              width: 136 * screenWidht / 390,
                              decoration: BoxDecoration(
                                color: const Color(0xFF65AAEA),
                                borderRadius: BorderRadius.circular(10),
                                gradient: const LinearGradient(
                                  colors: <Color>[Color(0xFF7DB9F0), Color(0xFF5095D5)],
                                ),
                              ),
                              child: Row(
                                children: [
                                  const SizedBox(width: 10),
                                  Text(
                                    "ENCERRAR",
                                    style: GoogleFonts.poppins(
                                      color: const Color(0xFFEFF7FF),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(width: 5),
                                  const Icon(
                                    Icons.check,
                                    color: Color(0xFFEFF7FF),
                                    size: 20,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Image.asset("assets/images/bolas_baixo.png"))
            
        ],
      ),
    );
  }
}