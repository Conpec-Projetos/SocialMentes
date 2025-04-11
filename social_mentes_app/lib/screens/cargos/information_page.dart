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
    LinearGradient ? _containerColorPaciente;
    LinearGradient ? _containerColorAdministrador;
    LinearGradient ? _containerColorPsicologo;
    LinearGradient ? _containerColorResponsavel;
    
    
    String selectedButton = "";
    String ? pastState;
    String ? presentState;
    bool appearImage = true;
    bool ? isChangeConfirmded;

    bool gradient_Paciente = false;
    bool gradient_Responsavel = false;
    bool gradient_Administrador = false;
    bool gradient_Psicologo = false;




     void _onButtonPressed(String buttonName){ //vê qual estado ("profissão") está selecionado
      setState(() {
        selectedButton = buttonName;
        print("Butão selecionado: $selectedButton");
      });
  }

      void changeColorPaciente(){ //função que altera background quando a tela o botão de paciente foi pressionado
        setState(() {
          if (gradient_Paciente == false){
          _containerColorPaciente = null;
        }else{
          _containerColorPaciente = LinearGradient(colors:<Color>[Color.fromRGBO(175, 214, 250, 1), Color.fromRGBO(125, 185, 240, 1)] );
        }
        });
      }


      void changeColorResponsavel(){ //função que altera background quando a tela o botão de responsável foi pressionado
        setState(() {
          if (gradient_Responsavel == false){
          _containerColorResponsavel = null;
        }else{
          _containerColorResponsavel = LinearGradient(colors:<Color>[Color.fromRGBO(175, 214, 250, 1), Color.fromRGBO(125, 185, 240, 1)] );
        }
        });
        
      }

      void changeColorAdmnistrador(){ //função que altera background quando a tela o botão de administrador foi pressionado
        setState(() {
          if (gradient_Administrador == false){
          _containerColorAdministrador = null;
        }else{
          _containerColorAdministrador = LinearGradient(colors:<Color>[Color.fromRGBO(175, 214, 250, 1), Color.fromRGBO(125, 185, 240, 1)] );
        }
        });
        
      }

      void changeColorPsicologo(){ //função que altera background quando a tela o botão de psicólogo foi pressionado
        setState(() {
          if (gradient_Psicologo == false){
          _containerColorPsicologo = null;
        }else{
          _containerColorPsicologo = LinearGradient(colors:<Color>[Color.fromRGBO(175, 214, 250, 1), Color.fromRGBO(125, 185, 240, 1)] );
        }
        });
      }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height; //pega o tamanho vertical da tela
    double screenWidth = MediaQuery.of(context).size.width; //pega o tamanho horizontal da tela

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: screenHeight*35/844,
            left: 30*screenWidth/390,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  if (pastState == presentState){
                  isChangeConfirmded = true;
                }
                });
                setState(() {
                  if (isChangeConfirmded == false){
                  print("Estou na primeira rota");
                  showDialog(context: context, builder: (BuildContext context) {
                  return AlertDialog( //card de anúncio quando usuário sai da tela sem salvar as alterações
                    content: Stack(
                      children: [
                        Container(
                        height: screenWidth*300/390,
                        width: screenWidth*300/390,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2.5),
                        ),
                    ),
                    Positioned(
                      top: screenWidth*18/390,
                      left: screenWidth*87/390,
                      child: Image.asset("assets/images/LogoSociaMentes2.png"),
                    ),
                    Positioned(
                      top: screenWidth*31/390,
                      left: screenWidth*130/390,
                      child: Image.asset("assets/images/Vector.png"),
                    ),
                    Positioned(
                      top: screenWidth*30/390,
                      left: screenWidth*240/390,
                      child:GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Image.asset("assets/images/X.png"),
                      )
                    ),
                    Positioned(
                      top: screenWidth*75/390,
                      child: Container(
                        width: screenWidth*239/390 ,
                        alignment: Alignment.center,
                        child: Padding(
                          padding: EdgeInsets.only(left:31),
                          child: Text("Você tem certeza que deseja sair?", 
                          textAlign: TextAlign.center,
                          style: GoogleFonts.firaSans(
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                            color: Color.fromRGBO(69, 69, 69, 1)
                          ),
                        ),
                      ),
                    )
                    ),
                    Positioned(
                      top: screenWidth*143/390 ,
                      child: SizedBox(
                        width: screenWidth*249/390,
                        child: Padding(
                          padding: EdgeInsets.only(left:26),
                          child: Text("As mudanças que você deseja fazer ainda não foram salvas!",
                          textAlign: TextAlign.center ,
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Color.fromRGBO(114, 114, 114, 1)
                          ),),
                        ),
                      ),
                    ),
                    Positioned(
                      top: screenWidth*216/390,
                      left:screenWidth*90/390 ,
                      child:Container(
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
                      onTap: () => Navigator.of(context).pop(),
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
                  ),
                    )
                      ],
                    )      
                  );
                });
                }else{
                  print("Estou na segunda rota");
                   setState(() {
                     Navigator.of(context).pop();
                   });
                };
                });
                
              },
              child: Image.asset("assets/images/back_button_information_page.png")
            )
          )
            ,
            Positioned(
              top: 0,
              right: 0,
              child: Image.asset("assets/images/up_image.png")),
            Positioned(
              top: screenHeight*41/844,
              left: screenWidth*80/390,
              child:Container(
                width: screenWidth*70/390,
                height: 35*screenHeight/844,
                child: Text("Voltar",
                style: GoogleFonts.firaSans(
                  fontSize:24*screenWidth/390,//pensar em forma de deixar responsivo
                  color: Color.fromRGBO(69,69,69,1),
                  fontWeight: FontWeight.w400),
                  ),
              ) ),
            Positioned(
              top: 205*screenHeight/844,
              left: 50*screenWidth/390,
              child: Column(
                children: [
                  Image.network(widget.foto, height:100*screenHeight/844, width: 100*screenWidth/390,), //pensar na responsiidade do tamanho das imagens
                  Padding(
                    padding: EdgeInsets.only(left: 17*screenWidth/390),
                    child: SizedBox(
                      width: 170*screenWidth/390,
                      child: Center(
                        child: Text(widget.name,
                            style: GoogleFonts.firaSans(
                            fontSize: 22*screenWidth/390,
                            color: const Color.fromRGBO(69, 69, 69, 1),
                            fontWeight:FontWeight.w500),
                            maxLines: 2,
                            )),),
                  ),
                  Row(
                    children: [
                        Image.asset("assets/images/maleta_icon.png"),
                        const SizedBox(width: 5,),
                        Text(widget.cargo,
                          style: GoogleFonts.firaSans(
                            fontSize: 16,
                            color: Color.fromRGBO(69, 69, 69, 1),
                            fontWeight: FontWeight.w400)
                            ),],),
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
                fontWeight: FontWeight.w500,)),
                SizedBox(
                  height: 10*screenHeight/844,
                ),
                //first buttons row
                SizedBox(
                  //color: Colors.black,
                  width: 300*screenWidth/390 ,
                  child: Row(
                    children: [
                      GestureDetector(
                              onTap: () => setState(() {
                                _onButtonPressed("Paciente");
                                gradient_Paciente = true;
                                gradient_Administrador = false;
                                gradient_Psicologo = false;
                                gradient_Responsavel = false;
                  
                                // Verifica corretamente o valor de 'gradient_Paciente'
                                if (gradient_Paciente == true) {
                  changeColorAdmnistrador();
                  changeColorPaciente();
                  changeColorPsicologo();
                  changeColorResponsavel();
                                }
                                pastState = presentState;
                                presentState = selectedButton;
                                print(presentState);
                                print(pastState);
                                if (pastState != presentState){
                  appearImage = true;
                  isChangeConfirmded = false;
                                }
                                print(isChangeConfirmded);
                              }),
                              child:Container(
                              height: 42*screenHeight/844,
                              width: 110*screenWidth/390,
                              padding: EdgeInsets.symmetric(horizontal:  10*screenWidth/390, vertical:5*screenHeight/844 ), //deixar responsivo
                              decoration: ShapeDecoration(
                                gradient:  _containerColorPaciente,
                                shape: RoundedRectangleBorder(
                                side: BorderSide(width: 2, color: Color.fromRGBO(114, 114, 114, 1)), //deixar responsivo
                                borderRadius: BorderRadius.circular(5)),
                              ),
                              child: 
                              Align(
                                alignment: Alignment.center,
                                child:Text("Paciente", 
                              style: GoogleFonts.firaSans(
                                fontSize: screenHeight/844 * 18 ,
                                fontWeight: FontWeight.w400,
                                color: Color.fromRGBO(114, 114, 114, 1)
                              )),
                              ) 
                              ),
                            ),
                            SizedBox(width: 15*screenWidth/390,),
                            GestureDetector(
                              onTap: () => setState(() {
                                _onButtonPressed("Responsável");
                                gradient_Responsavel = true;
                                gradient_Administrador = false;
                                gradient_Paciente = false;
                                gradient_Psicologo = false;
                                if (gradient_Responsavel == true){
                  changeColorAdmnistrador();
                  changeColorPaciente();
                  changeColorPsicologo();
                  changeColorResponsavel();
                                }
                                pastState = presentState;
                                presentState = selectedButton;
                                print(presentState);
                                print(pastState);
                                if (pastState != presentState){
                  appearImage = true;
                  isChangeConfirmded = false;
                                }
                                print(isChangeConfirmded);
                              }),
                              child:Container(
                              height: 42*screenHeight/844,
                              width: 143*screenWidth/390,
                              padding: EdgeInsets.symmetric(horizontal: 10*screenWidth/390, vertical:5*screenHeight/844 ), //deixar responsivo
                              decoration: ShapeDecoration(
                                gradient: _containerColorResponsavel,
                                shape: RoundedRectangleBorder(
                                side: BorderSide(width: 2, color:Color.fromRGBO(114, 114, 114, 1)), //deixar responsivo
                                borderRadius: BorderRadius.circular(5)),
                              ),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text("Responsável",
                              style: GoogleFonts.firaSans(
                                fontSize: screenHeight/844 * 18 ,
                                fontWeight: FontWeight.w400,
                                color: Color.fromRGBO(114, 114, 114, 1)
                              )),),),)
                    ],
                  ),
                ),
                SizedBox(height: 10*screenHeight/844,),
              //second buttons row
            Container(
              width:320*screenWidth/390,
              child: Row(
                children: [
                  GestureDetector(
              onTap: () => setState(() {
                 _onButtonPressed("Administrador");
                gradient_Administrador = true;
                gradient_Paciente =  false;
                gradient_Psicologo = false;
                gradient_Responsavel = false;
                if (gradient_Administrador = true){
                  changeColorAdmnistrador();
                  changeColorPaciente();
                  changeColorPsicologo();
                  changeColorResponsavel();
                }
                pastState = presentState;
                presentState = selectedButton;
                print(presentState);
                print(pastState);
                if (pastState != presentState){
                  appearImage = true;
                  isChangeConfirmded = false;
                }
              }),
              child:Container(
              height: 42*screenHeight/844,
              width: 157*screenWidth/390,
              padding: EdgeInsets.symmetric(horizontal:  10*screenWidth/390, vertical:5*screenHeight/844 ), //deixar responsivo
              decoration: ShapeDecoration(
                gradient: _containerColorAdministrador,
                shape: RoundedRectangleBorder(
                side: BorderSide(width: 2, color: Color.fromRGBO(114, 114, 114, 1)), //deixar responsivo
                borderRadius: BorderRadius.circular(5)),
              ),
              child: Align(
                alignment: Alignment.center,
                child: Text("Administrador",
              style: GoogleFonts.firaSans(
                fontSize: screenHeight/844 * 18 ,
                fontWeight: FontWeight.w400,
                color: Color.fromRGBO(114, 114, 114, 1)
              )),),),),
              SizedBox(width: 15*screenWidth/390),
              GestureDetector(
              onTap: () => setState(() {
                _onButtonPressed("Psicólogo");
                gradient_Psicologo = true;
                gradient_Administrador = false;
                gradient_Paciente = false;
                gradient_Responsavel = false;
                if (gradient_Psicologo = true){
                  changeColorAdmnistrador();
                  changeColorPaciente();
                  changeColorPsicologo();
                  changeColorResponsavel();
                }
                pastState = presentState;
                presentState = selectedButton;
                print(presentState);
                print(pastState);
                if (pastState != presentState){
                  appearImage = true;
                  isChangeConfirmded = false;
                }
              }),
              child: Container(
              height: 42*screenHeight/844,
              width: 119*screenWidth/390,
              padding: EdgeInsets.symmetric(horizontal:  10*screenWidth/390, vertical:5*screenHeight/844 ), //deixar responsivo
              decoration: ShapeDecoration(
                gradient: _containerColorPsicologo,
                shape: RoundedRectangleBorder(
                side: BorderSide(width: 2, color: Color.fromRGBO(114, 114, 114, 1)), //deixar responsivo
                borderRadius: BorderRadius.circular(5)),
              ),
              child: Align(
                alignment: Alignment.center,
                child: Text("Psicólogo",
              style: GoogleFonts.firaSans(
                fontSize: screenHeight/844 * 18 ,
                fontWeight: FontWeight.w400,
                color: Color.fromRGBO(114, 114, 114, 1)
              ))),),)
              
                ],
              ),
            ),
            
                ],)),
                 
          if(pastState != presentState && appearImage == true)
            Positioned(
              top: screenHeight*606/844,
              left: screenWidth*20/390,
              child:GestureDetector(
                onTap: () => setState(() {
                  appearImage = false;
                  isChangeConfirmded = true;
                  print(isChangeConfirmded);
                  updatePosition(widget.id,selectedButton);
                  
                }),
                child:Image.asset("assets/images/confirm_change.png", height: screenHeight*44/844, width: screenWidth*350/390,) ,
              )
              ),

          Positioned(
              bottom: 0,
              right: 0,
              child: Image.asset("assets/images/down_image_information_page.png")),
        ],
      ),
    );
  }
}