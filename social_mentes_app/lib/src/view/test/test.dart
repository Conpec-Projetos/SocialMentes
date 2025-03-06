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
  @override
  void initState(){
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    List<Map<String, dynamic>> data = await getDataChecklist(widget.competence, widget.level);
    setState(() {
    vector_competence = data;  
    });
    
  }
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidht = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
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
                width: 78*screenWidht/392,
              ),
              Image.asset("images/balls_up.png"),
              
              
            ],   
          ),
          Expanded(
            child: ListView.builder(
              itemCount:vector_competence.length , 
              itemBuilder: (context, index){
                return ObjetiveQuestions(description: vector_competence[index]['description'] ?? "teste teste teste", question: vector_competence[index]['question'] ?? "testeQ testeQ testeQ" , screenHeight: screenHeight, screenWidht: screenWidht, index: widget.index,);
              }),
          ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset("images/balls_down.png")
              ],
            )
          
      ])
    );
  }
}