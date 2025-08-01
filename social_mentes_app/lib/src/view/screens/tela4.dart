//import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../../../screens/pacientes/competencias_list.dart';
import 'package:social_mentes/class.dart';
//teste
class CreateProtocols extends StatefulHookWidget {
  const CreateProtocols({super.key});

  @override
  _CreateProtocolsState createState() => _CreateProtocolsState();
}

  class _CreateProtocolsState extends State<CreateProtocols> {
    bool state_button1 = false;
    bool state_button2 = false;
    bool state_button3 = false;
    bool state_button4 = false;
    bool state_icon_arrow = false;
    bool iconTapped = false;
    bool status_texto = false;
    String competence_text = "";
    ImageProvider container_image = const AssetImage("images/container_arrow.png");

    Color bordaButton = const Color.fromRGBO(171, 171, 171, 1);

    Color bordaButton1 = const Color.fromRGBO(171, 171, 171, 1);
    Color  bordaButton2 = const Color.fromRGBO(171, 171, 171, 1);
    Color  bordaButton3 = const Color.fromRGBO(171, 171, 171, 1);
    Color  bordaButton4 = const Color.fromRGBO(171, 171, 171, 1);
    Color arrow_conatiner = const Color.fromRGBO(171, 171, 171, 1);

    void change_Icon_container(String type_competencia){
      if(type_competencia != ""){
        container_image = const AssetImage("images/check_image.png");
      }
    }

    void stateArrow(bool stateArrow){
      if (stateArrow == true){
        arrow_conatiner = const Color.fromRGBO(125, 185, 240, 1);
      }
    }

    void stateButton(bool state1, bool state2, bool state3, bool state4){

      if (state1 == true){
        bordaButton1 =const Color.fromRGBO(125, 185, 240, 1);
      } else{
        bordaButton1 = bordaButton;
      }
      
      if(state2 == true){
        bordaButton2 =const Color.fromRGBO(125, 185, 240, 1);
      } else{
        bordaButton2 = bordaButton;
      }
      
      if(state3 == true){
        bordaButton3 =const Color.fromRGBO(125, 185, 240, 1);
      }else{
        bordaButton3 = bordaButton;
      }
      
      if(state4 == true){
        bordaButton4 = const Color.fromRGBO(125, 185, 240, 1);
      }else{
        bordaButton4 = bordaButton;
      }
    }

    void uptade_iconTap(bool iconTap){
      setState(() {
        iconTapped = iconTap;
      });
    }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidht = MediaQuery.of(context).size.width;
    return ValueListenableBuilder(valueListenable: stateButtonNotifer,
     builder: (context, state_widget,child){
      return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            child: Image.asset("images/blue_ball_up.png")),
            Positioned(
            top: screenHeight*16/844,
            right: 0,
            child: Image.asset("images/red_ball_up.png")),
            Positioned(
              top: screenHeight*35/844,
              left: 30*screenWidht/390,
              child: Image.asset("images/back_button.png")),
              Positioned(
                top: screenHeight*41/844,
                left: 80*screenWidht/390,
                child: Text("Voltar", style: GoogleFonts.firaSans(
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                ),)),
              //linha com os botões de tabela, gráficos e relatório
              Positioned(
                top: 132*screenHeight/844,
                left: 80.5*screenWidht/390,
                child: Row(
                children: [
                  Container(
                    width: 63*screenWidht/390,
                    height: 24*screenHeight/844,
                    decoration: BoxDecoration(
                      border:Border.all(
                        color: const Color.fromRGBO(114, 114, 114, 1),
                        width: 1.5
                      ) ,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Stack(
                      children: [
                        Padding(padding: EdgeInsets.symmetric(horizontal: 7*screenWidht/390, vertical: 5*screenHeight/844),
                        child: Image.asset("images/icon_tabela.png", height: 11*screenHeight/844,width: 11*screenHeight/844,)),
                        Padding(padding: EdgeInsets.only(left: 18*screenWidht/390, top: 2*screenWidht/390),
                        child: Text("Tabela", style: GoogleFonts.firaSans(
                            fontSize: 12*screenWidht/390,
                            fontWeight: FontWeight.w400,
                            color: const Color.fromRGBO(114, 114, 114, 1)
                          ),) ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10*screenWidht/390,),
                  Container(
                    width: 63*screenWidht/390,
                    height: 24*screenHeight/844,
                    decoration: BoxDecoration(
                      border:Border.all(
                        color: const Color.fromRGBO(114, 114, 114, 1),
                        width: 1.5
                      ) ,
                      borderRadius: BorderRadius.circular(6),
                      
                    ),
                    child: Stack(
                      children: [
                        Padding(padding:EdgeInsets.symmetric(horizontal: 5*screenWidht/390, vertical: 5*screenHeight/844) ,
                        child: Image.asset("images/grafico_icon.png", height: 11*screenHeight/844,width: 11*screenHeight/844,)),
                        Padding(padding: EdgeInsets.only(left: 16*screenWidht/390, top: 2*screenWidht/390),
                        child: Text("Gráfico", style: GoogleFonts.firaSans(
                            fontSize: 12*screenWidht/390,
                            fontWeight: FontWeight.w400,
                            color: const Color.fromRGBO(114, 114, 114, 1)
                          ),)),
                      ],
                    ),
                  ),
                  SizedBox(width: 10*screenWidht/390,),
                  Container(
                    width: 80*screenWidht/390,
                    height: 24*screenHeight/844,
                    decoration: BoxDecoration(
                      border:Border.all(
                        color: const Color.fromRGBO(114, 114, 114, 1),
                        width: 1.5
                      ) ,
                      borderRadius: BorderRadius.circular(6),
                      
                    ),
                    child: Stack(
                      children: [
                        Padding(padding:EdgeInsets.symmetric(horizontal: 5*screenWidht/390, vertical: 5*screenHeight/844),
                        child: Image.asset("images/relatorio_icon.png", height: 11*screenHeight/844,width: 11*screenHeight/844,),),
                        Padding(padding:EdgeInsets.only(left: 18*screenWidht/390, top: 2*screenWidht/390) ,
                        child:Text("Relatório", style: GoogleFonts.firaSans(
                            fontSize: 12*screenWidht/390,
                            fontWeight: FontWeight.w400,
                            color: const Color.fromRGBO(114, 114, 114, 1)
                          ),) ,),
                      ],
                    ),
                  ),
                ],
              )),
      
              //numero do paciente ???
              Positioned(
                top: 166*screenHeight/844,
                left: 21*screenWidht/390,
                child: Text("0055", style: GoogleFonts.poppins(
                  fontSize: 32,
                  fontWeight: FontWeight.w800,
                ),) ),
              
              Positioned(
                top: 222*screenHeight/844,
                left: 21*screenWidht/390,
                child: Container(
                height: 20*screenHeight/844,
                width: 3*screenWidht/390,
                decoration: const BoxDecoration(
                  gradient:LinearGradient(colors: <Color>[
                    Color.fromRGBO(125, 185, 240, 1),
                    Color.fromRGBO(80, 149, 213, 1)
                  ])
                ),
              )),
              Positioned(
                top: screenHeight*214/844,
                left: 29*screenWidht/390,
                child: Text("nível",style: GoogleFonts.poppins(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: const Color.fromRGBO(114, 114, 114, 1)
                ),)),
      
                Positioned(
                  top: screenHeight*260/844, left: 21*screenWidht/390,
                  child: Row(
                  children: [
                    GestureDetector(
                      child: Container(
                      height: 85*screenWidht/844,
                      width: 85*screenWidht/844,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(width: 4, color: bordaButton1),
                          borderRadius: BorderRadius.circular(6)
                        ) 
                      ),
                      child: Center(child: Text("1", style: GoogleFonts.firaSans(
                        fontSize: screenHeight*25/844,
                        fontWeight: FontWeight.w600,
                        color: bordaButton1
                      ),),),
                    ),
                    onTap: () => setState(() {
                      state_button1 = true;
                      state_button2 = false;
                      state_button3 = false;
                      state_button4 = false;
                      setState(() {
                        stateButton(state_button1, state_button2, state_button3, state_button4);
                      });
                    }),),
                    SizedBox(width: 17.5*screenWidht/390),
                    GestureDetector(
                      onTap: () => setState(() {
                        state_button2 = true;
                        state_button1 = false;
                        state_button3 = false;
                        state_button4 = false;
                        setState(() {
                          stateButton(state_button1, state_button2, state_button3, state_button4);
                        });
                        
                      }),
                    child:Container(
                      height: 85*screenWidht/844,
                      width: 85*screenWidht/844,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(width: 4, color: bordaButton2),
                          borderRadius: BorderRadius.circular(6)
                        )
                        
                      ),
                      child: Center(child: Text("2", style: GoogleFonts.firaSans(
                        fontSize: 25*screenHeight/844,
                        fontWeight: FontWeight.w600,
                        color: bordaButton2
                      ),),),
                    ), 
                    ),
                    SizedBox(width: 17.5*screenWidht/390),
                    GestureDetector(
                      child: Container(
                      height: 85*screenWidht/844,
                      width: 85*screenWidht/844,
                      decoration: BoxDecoration(
                        border: Border.all(color: bordaButton3,
                        width: 4),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Center(child: Text("3", style: GoogleFonts.firaSans(
                        fontSize: 25*screenHeight/844,
                        fontWeight: FontWeight.w600,
                        color: bordaButton3
                      ),),),
                    ),
                    onTap: () => setState(() {
                      state_button3 = true;
                      state_button1 = false;
                      state_button2 = false;
                      state_button4 = false;
                      stateButton(state_button1, state_button2, state_button3,state_button4);
                    }),
                    )
                    ,
                    SizedBox(width: 17.5*screenWidht/390),
                    GestureDetector(
                      child: Container(
                      height: 85*screenWidht/844,
                      width: 85*screenWidht/844,
                      decoration: BoxDecoration(
                        border: Border.all(color: bordaButton4,
                        width: 4),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Center(child: Text("4", style: GoogleFonts.firaSans(
                        fontSize: 25*screenHeight/844,
                        fontWeight: FontWeight.w600,
                        color: bordaButton4
                      ),),),
                    ),
                    onTap: () => setState(() {
                      state_button4 = true;
                      state_button1 = false;
                      state_button2 = false;
                      state_button3 = false;
                      stateButton(state_button1, state_button2, state_button3, state_button4);
                    }),
                    ),
                  ],
                )),
      
                Positioned(
                top: 316*screenHeight/844,
                left: 21*screenWidht/390,
                child: Container(
                height: 20*screenHeight/844,
                width: 3*screenWidht/390,
                decoration: const BoxDecoration(
                  gradient:LinearGradient(colors: <Color>[
                    Color.fromRGBO(125, 185, 240, 1),
                    Color.fromRGBO(80, 149, 213, 1)
                  ])
                ),
              )),
      
              Positioned(
                top: 308*screenHeight/844,
                left: 29*screenWidht/390,
                child: Text("competência",style:GoogleFonts.poppins(
                color: const Color.fromRGBO(114, 114, 114, 1),
                fontSize: 24*screenHeight/844, 
                fontWeight: FontWeight.w700), 
              )),
              Positioned( //mudar para icon de seta certo
                top: 354*screenHeight/844,
                left: 21*screenWidht/390,
                child: Container(
                  height: 50*screenHeight/844,
                  width: 314*screenWidht/390,
                decoration: BoxDecoration(
                  border:Border.all(color: arrow_conatiner, width: 3 ), 
                  borderRadius: BorderRadius.circular(15)),
                  child: Stack(
                    children:[
                      Positioned(
                        top: 15*screenHeight/844,
                        left: 280*screenWidht/390,
                        child: GestureDetector(
                        onTap: () => setState(() {
                          state_icon_arrow = true;
                        stateArrow(state_icon_arrow);
                        outWidget();
                        if (stateButtonNotifer.value == true){
                          showModalBottomSheet(
                          context: context, 
                          builder:(BuildContext context){
                            return CompetenciasList(stateButtonNotifer: stateButtonNotifer, competenceText: competence_text);
                          }).then((competenciaSelecionada){
                            if(competenciaSelecionada != null){
                              String competencia_selecionada = competenciaSelecionada['competencia'];
                              setState(() {
                                
                                competence_text = competencia_selecionada;
                              });
                              change_Icon_container(competence_text);
                              //print("A competência seleciondada é $competence_text");
                            }
                          });
                        }
                        }),
                        child: Image(image: container_image),
                      )),
                      Positioned(
                        top: screenHeight*10/844,
                        left: screenHeight*5/390,
                        child: Text(competence_text, style: GoogleFonts.firaSans(
                          fontSize: screenHeight*20/844,
                          color: Color.fromRGBO(171, 171, 171, 1),
                          fontWeight: FontWeight.w400,
                        ),))
                      
                    ]),),),
              Positioned(top: 416*screenHeight/844,
                left: 21*screenWidht/390,
                child: Container(
                height: 20*screenHeight/844,
                width: 3*screenWidht/390,
                decoration: const BoxDecoration(
                  gradient:LinearGradient(colors: <Color>[
                    Color.fromRGBO(125, 185, 240, 1),
                    Color.fromRGBO(80, 149, 213, 1)
                  ])
                ),
              )),
              Positioned(
                top: 408*screenHeight/844,
                left: 29*screenWidht/390,
                child: Text("checklist", style: GoogleFonts.poppins(
                  color: const Color.fromRGBO(114, 114, 114, 1),
                  fontSize: 24*screenHeight/844,
                  fontWeight: FontWeight.w700
                ),)),
              
              Positioned(
                top: 454*screenHeight/844,
                left: 21*screenWidht/390,
                child: SizedBox(
                  height: screenHeight*24/844,
                  width: screenWidht*326/390,
                  child: Center(
                    child:Text("Não há testes ainda",style: GoogleFonts.inter(
                fontStyle: FontStyle.italic,
                fontSize: 20*screenHeight/844,
                fontWeight: FontWeight.w500,
                color: const Color.fromRGBO(171, 171, 171, 1)
              ),) ,
                  ),
                )
                ),
      
              Positioned(top: 490*screenHeight/844,
                left: 21*screenWidht/390,
                child: Container(
                height: 20*screenHeight/844,
                width: 3*screenWidht/390,
                decoration: const BoxDecoration(
                  gradient:LinearGradient(colors: <Color>[
                    Color.fromRGBO(125, 185, 240, 1),
                    Color.fromRGBO(80, 149, 213, 1)
                  ])
                ),
              )),
              Positioned(
                top: 482*screenHeight/844,
                left: 29*screenWidht/390,
                child: Text("intervenção", style: GoogleFonts.poppins(
                  color: const Color.fromRGBO(114, 114, 114, 1),
                  fontSize: 24*screenHeight/844,
                  fontWeight: FontWeight.w700
                ),)),
              Positioned(
                top: 528*screenHeight/844,
                left: 21*screenWidht/390,
                child: SizedBox(
                  height: screenHeight*24/844,
                  width: screenWidht*326/390,
                  child: Center(
                    child:Text("Não há planos ainda",style: GoogleFonts.inter(
                fontStyle: FontStyle.italic,
                fontSize: 20*screenHeight/844,
                fontWeight: FontWeight.w500,
                color: const Color.fromRGBO(171, 171, 171, 1)
              ),) ,
                  ),
                )),
      
              Positioned(
                top: 582*screenHeight/844,
                left: 21*screenWidht/390,
                child: Container(
                  width: 207*screenWidht/390,
                  height: 44*screenHeight/844,
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color.fromRGBO(248, 61, 112, 1),width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        top: 10*screenHeight/844,
                        left: 10*screenWidht/390,
                        child: Text("CRIAR INTERVENÇÃO", style: GoogleFonts.poppins(
                          fontSize: 16*screenWidht/390,
                          fontWeight: FontWeight.w600,
                          color: const Color.fromRGBO(248, 61, 112, 1)
                        ),)),
                        Positioned(
                          right: screenWidht*10/390,
                          top: screenHeight*17/844,
                          child: Center(child: Image.asset("images/red_icon.png",height: 8*screenHeight/844, width: 14*screenWidht/390,) ,)
                         )
                    ],
                  ) ,
              )),
      
              Positioned(
                top: 582*screenHeight/844,
                right: 21*screenWidht/390,
                child: Image.asset("images/save_button.png", width: 131*screenWidht/390, height: 44*screenHeight/844,)),
                
              Positioned(
                bottom: 0,
                left: 0,
                child: Image.asset("images/yellow_ball_down.png")),
              Positioned(
                left: 0,
                bottom: 0,
                child: Image.asset("images/blue_ball_down.png"))
        ],
      ),
    );
  });
  }
}

