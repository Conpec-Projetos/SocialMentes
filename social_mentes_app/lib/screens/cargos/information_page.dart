import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:social_mentes/services/update_user.dart';

class InformationPage extends StatefulWidget {
  final String name;
  final String cargo;
  final String foto;
  final String id;
  InformationPage({super.key, required this.name, required this.cargo, required this.foto, required this.id});

  @override
  _InformationPageState createState() => _InformationPageState();
}
  class _InformationPageState extends State<InformationPage> {
    
    String selectedButton = "";
    bool appearImage = false;
    bool isChangeConfirmded = true;

    /// 1 => Paciente </p>
    /// 2 => Responsavel </p>
    /// 3 => Administrador </p>
    /// 4 => Psicologo 
    int gradientButtonIndex = 0;

    LinearGradient selectedButtonColor = LinearGradient(colors:<Color>[Color.fromRGBO(175, 214, 250, 1), Color.fromRGBO(125, 185, 240, 1)] );


  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height; //pega o tamanho vertical da tela
    double screenWidth = MediaQuery.of(context).size.width; //pega o tamanho horizontal da tela

    return Container(
      color: Color(0xFFF4F4F4),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            child: Image.asset(
              "assets/images/defaultBG_up.png",
              scale: 150/((150/844)*screenHeight),
            )
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset(
              "assets/images/defaultBG_down.png",
              scale: 214/((214/844)*screenHeight),
            )
          ),

          Scaffold(
            backgroundColor: Colors.transparent,
            body: Stack(
              children: [
                
                //BOTAO VOLTAR
                Positioned(
                  top: screenHeight*35/844,
                  left: 30*screenWidth/390,
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            //Não confirmou a mudança
                            if (isChangeConfirmded == false){
                            print("Estou na primeira rota");
                            showDialog(context: context, builder: (BuildContext context) {
                            return AlertDialog( //card de anúncio quando usuário sai da tela sem salvar as alterações
                              content: SizedBox(
                                height: screenWidth*300/390,
                                width: screenWidth*300/390,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Image.asset("assets/images/logo_pequeno.png"),
                                        Image.asset("assets/images/logo_texto.png"),

                                        SizedBox(width: (screenWidth)* (58/390),),

                                        GestureDetector(
                                        onTap: () => Navigator.pop(context),
                                        child: Image.asset("assets/images/X_icon.png"),
                                      )

                                      ],
                                    ),

                                    Container(
                                      width: screenWidth*239/390 ,
                                      alignment: Alignment.center,
                                      child: Text("Você tem certeza que deseja sair?", 
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.firaSans(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 20,
                                          color: Color.fromRGBO(69, 69, 69, 1)
                                        ),
                                      ),
                                    ),

                                    SizedBox(height: screenHeight * 20 / 844,),

                                    SizedBox(
                                      width: screenWidth*249/390,
                                      child: Text("As mudanças que você deseja fazer ainda não foram salvas!",
                                        textAlign: TextAlign.center ,
                                        style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16,
                                          color: Color.fromRGBO(114, 114, 114, 1)
                                        ),
                                      ),
                                    ),

                                    SizedBox(height: screenHeight * 25 / 844,),

                                    Container(
                                      width: 105,
                                      height: 44,
                                      padding: const EdgeInsets.all(10),
                                      decoration: ShapeDecoration(
                                        shape: RoundedRectangleBorder(
                                          side: const BorderSide(width: 2, color: Color(0xFF4F94D4)),
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                      ),
                                      child: GestureDetector(
                                        onTap: () {
                                          //Remove o AlertDialog e sai da tela
                                          Navigator.of(context).pop();
                                          Navigator.of(context).pop();
                                        },
                                        child:const Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              'SAIR',
                                              style: TextStyle(
                                                color: Color(0xFF4F94D4),
                                                fontSize: 16,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w500,
                                                height: 0,
                                              ),
                                            ),
                                      
                                          ],
                                        ), 
                                      ) 
                                    )
                                  ],
                                ),
                              )      
                            );
                            });
                            }else{
                              //Confirmado a mudança
                              print("Estou na segunda rota");
                              setState(() {
                                Navigator.of(context).pop();
                              });
                            }
                          });
                        },
                      
                        child: Image.asset("assets/images/back_button.png")
                      ),
                      SizedBox(width: screenWidth*10/390,),

                      Text("Voltar",
                      style: GoogleFonts.firaSans(
                        fontSize:24*screenWidth/390,//pensar em forma de deixar responsivo
                        color: Color.fromRGBO(69,69,69,1),
                        fontWeight: FontWeight.w400),
                        ),
                    ],
                  )
                ),

                Container(
                  margin: EdgeInsets.fromLTRB(45*screenWidth/390, 205*screenHeight/844, 45*screenWidth/390, 0),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.network(widget.foto, height:100*screenHeight/844, width: 100*screenWidth/390,),
                      SizedBox(
                        width: 170*screenWidth/390,
                        child: Text(
                          widget.name,
                          style: GoogleFonts.firaSans(
                            fontSize: 22*screenWidth/390,
                            color: const Color.fromRGBO(69, 69, 69, 1),
                            fontWeight:FontWeight.w500),
                          maxLines: 2,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/images/maleta_icon.png"),
                          const SizedBox(width: 5,),
                          Text(widget.cargo,
                            style: GoogleFonts.firaSans(
                              fontSize: 16,
                              color: Color.fromRGBO(69, 69, 69, 1),
                              fontWeight: FontWeight.w400)
                          ),
                        ],
                      ),
                      Container(
                        width: 274*screenWidth/390,
                        height: 0.8*screenHeight/844,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromRGBO(206, 231, 255,0.53),
                              Color.fromRGBO(125,185 ,240 ,1 ),
                              Color.fromRGBO(206, 231,255 ,1)
                            ]
                          )
                        ),
                      ),
                      Text("CARGOS", 
                        style: GoogleFonts.firaSans(
                          fontSize: 18,
                          color: Color.fromRGBO(69, 69, 69, 1),
                          fontWeight: FontWeight.w500,
                        )
                      ),
                      SizedBox(
                        height: 10*screenHeight/844,
                      ),

                      //first buttons row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () => setState(() {
                              //Não selecionado
                              if (gradientButtonIndex != 1){
                                appearImage = true;
                                isChangeConfirmded = false;
                                gradientButtonIndex = 1;

                                selectedButton = "Paciente";
                                
                              } else {
                                //Selecionado
                                appearImage = false;
                                gradientButtonIndex = 0;

                                selectedButton = "";
                              }
                            }),
                            child:Container(
                              height: 42*screenHeight/844,
                              width: 110*screenWidth/390,
                              padding: EdgeInsets.symmetric(horizontal:  10*screenWidth/390, vertical:5*screenHeight/844 ), //deixar responsivo
                              decoration: ShapeDecoration(
                                gradient:  (gradientButtonIndex == 1)? selectedButtonColor : null,
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(width: 2, color: Color.fromRGBO(114, 114, 114, 1)), //deixar responsivo
                                  borderRadius: BorderRadius.circular(5)
                                ),
                              ),
                              child: Align(
                                alignment: Alignment.center,
                                child:Text("Paciente", 
                                  style: GoogleFonts.firaSans(
                                    fontSize: screenHeight/844 * 18 ,
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromRGBO(114, 114, 114, 1)
                                  )
                                ),
                              ) 
                            ),
                          ),
                      
                          SizedBox(width: 15*screenWidth/390,),
                        
                          GestureDetector(
                            onTap: () => setState(() {
                              //Não selecionado
                              if (gradientButtonIndex != 2){
                                appearImage = true;
                                isChangeConfirmded = false;
                                gradientButtonIndex = 2;

                                selectedButton = "Responsável";
                                
                              } else {
                                //Selecionado
                                appearImage = false;
                                gradientButtonIndex = 0;

                                selectedButton = "";
                              }
                            }),
                            child:Container(
                              height: 42*screenHeight/844,
                              width: 143*screenWidth/390,
                              padding: EdgeInsets.symmetric(horizontal: 10*screenWidth/390, vertical:5*screenHeight/844 ), //deixar responsivo
                              decoration: ShapeDecoration(
                                gradient: (gradientButtonIndex == 2)? selectedButtonColor : null,
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(width: 2, color:Color.fromRGBO(114, 114, 114, 1)), //deixar responsivo
                                  borderRadius: BorderRadius.circular(5)
                                ),
                              ),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text("Responsável",
                                  style: GoogleFonts.firaSans(
                                    fontSize: screenHeight/844 * 18 ,
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromRGBO(114, 114, 114, 1)
                                  )
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      
                      SizedBox(height: 10*screenHeight/844,),

                      //second buttons row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () => setState(() {
                              //Não selecionado
                              if (gradientButtonIndex != 3){
                                appearImage = true;
                                isChangeConfirmded = false;
                                gradientButtonIndex = 3;

                                selectedButton = "Administrador";
                                
                              } else {
                                //Selecionado
                                appearImage = false;
                                gradientButtonIndex = 0;

                                selectedButton = "";
                              }
                            }),
                            child:Container(
                              height: 42*screenHeight/844,
                              width: 157*screenWidth/390,
                              padding: EdgeInsets.symmetric(horizontal:  10*screenWidth/390, vertical:5*screenHeight/844 ), //deixar responsivo
                              decoration: ShapeDecoration(
                                gradient: (gradientButtonIndex == 3)? selectedButtonColor : null,
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(width: 2, color: Color.fromRGBO(114, 114, 114, 1)), //deixar responsivo
                                  borderRadius: BorderRadius.circular(5)
                                ),
                              ),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text("Administrador",
                                  style: GoogleFonts.firaSans(
                                    fontSize: screenHeight/844 * 18 ,
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromRGBO(114, 114, 114, 1)
                                  )
                                ),
                              ),
                            ),
                          ),
                          
                          SizedBox(width: 15*screenWidth/390),
                      
                          GestureDetector(
                            onTap: () => setState(() {
                              //Não selecionado
                              if (gradientButtonIndex != 4){
                                appearImage = true;
                                isChangeConfirmded = false;
                                gradientButtonIndex = 4;

                                selectedButton = "Psicólogo";
                                
                              } else {
                                //Selecionado
                                appearImage = false;
                                gradientButtonIndex = 0;

                                selectedButton = "";
                              }
                            }),
                            child: Container(
                              height: 42*screenHeight/844,
                              width: 119*screenWidth/390,
                              padding: EdgeInsets.symmetric(horizontal:  10*screenWidth/390, vertical:5*screenHeight/844 ), //deixar responsivo
                              decoration: ShapeDecoration(
                                gradient: (gradientButtonIndex == 4)? selectedButtonColor : null,
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(width: 2, color: Color.fromRGBO(114, 114, 114, 1)), //deixar responsivo
                                  borderRadius: BorderRadius.circular(5)
                                ),
                              ),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text("Psicólogo",
                                  style: GoogleFonts.firaSans(
                                    fontSize: screenHeight/844 * 18 ,
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromRGBO(114, 114, 114, 1)
                                  )
                                )
                              ),
                            ),
                          )
                      
                        ],
                      ),

                      //voltar
                
                    ],
                  )
                ),
                       
                if(appearImage == true)
                  Positioned(
                    top: screenHeight*606/844,
                    left: screenWidth*20/390,
                    child:GestureDetector(
                      onTap: () => setState(() {
                        isChangeConfirmded = true;
                        updatePosition(widget.id,selectedButton);

                        Navigator.pop(context);
                        
                      }),
                      child:Image.asset("assets/images/confirm_change.png", height: screenHeight*44/844, width: screenWidth*350/390,) ,
                    )
                  ),
          
              ],
            ),
          ),
        ],
      ),
    );
  }
}