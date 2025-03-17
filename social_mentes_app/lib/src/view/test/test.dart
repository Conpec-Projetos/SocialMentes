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
      body: SingleChildScrollView(
        child: Column(
            children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 30*screenWidht/392,
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Image.asset("images/back_button.png") ,
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
                  width: 56.5*screenWidht/392,
                ),
                Image.asset("images/balls_up.png"),
                
                
              ],   
            ),
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
            if (showSaveButton)
            Positioned(
              bottom: 20, // Define a posição do botão fixado na parte inferior
              left: 0,
              right: 0,
              child: Center(
                child: Image.asset(
                  "images/save_button.png",
                  width: 200, // Ajuste o tamanho do botão se necessário
                ),)),
            // Image.asset("images/save_button.png"),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset("images/balls_down.png")
                ],
              )
            
        ]),
      )
    );
  }
}