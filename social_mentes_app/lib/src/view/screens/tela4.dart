import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateProtocols extends StatefulWidget {
  const CreateProtocols({super.key});

  @override
  State<CreateProtocols> createState() => _CreateProtocolsState();
}

class _CreateProtocolsState extends State<CreateProtocols> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidht = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        child: Stack(
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
                          color: Color.fromRGBO(114, 114, 114, 1),
                          width: 1.5
                        ) ,
                        borderRadius: BorderRadius.circular(6),
                        
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            top: screenHeight*5/844,
                            left: screenWidht*8/390,
                            child: Image.asset("images/icon_tabela.png", height: 11*screenHeight/844,width: 11*screenHeight/844,)),
                          Positioned(
                            top: screenHeight*2.5/844,
                            right: screenHeight*3/390,
                            child: Text("Tabela", style: GoogleFonts.firaSans(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(114, 114, 114, 1)
                            ),)),
                        ],
                      ),
                    ),
                    SizedBox(width: 10*screenWidht/390,),
                    Container(
                      width: 63*screenWidht/390,
                      height: 24*screenHeight/844,
                      decoration: BoxDecoration(
                        border:Border.all(
                          color: Color.fromRGBO(114, 114, 114, 1),
                          width: 1.5
                        ) ,
                        borderRadius: BorderRadius.circular(6),
                        
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            top: screenHeight*5/844,
                            left: screenWidht*8/390,
                            child: Image.asset("images/grafico_icon.png", height: 11*screenHeight/844,width: 11*screenHeight/844,)),
                          Positioned(
                            top: screenHeight*2.5/844,
                            right: screenHeight*2/390,
                            child: Text("Gráfico", style: GoogleFonts.firaSans(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(114, 114, 114, 1)
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
                          color: Color.fromRGBO(114, 114, 114, 1),
                          width: 1.5
                        ) ,
                        borderRadius: BorderRadius.circular(6),
                        
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            top: screenHeight*5/844,
                            left: screenWidht*8/390,
                            child: Image.asset("images/relatorio_icon.png", height: 11*screenHeight/844,width: 11*screenHeight/844,)),
                          Positioned(
                            top: screenHeight*2.5/844,
                            right: screenHeight*4/390,
                            child: Text("Relatório", style: GoogleFonts.firaSans(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(114, 114, 114, 1)
                            ),)),
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
                  decoration: BoxDecoration(
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
                    color: Color.fromRGBO(114, 114, 114, 1)
                  ),)),

                  Positioned(
                    top: screenHeight*260/844, left: 21*screenWidht/390,
                    child: Row(
                    children: [
                      Container(
                        height: 80*screenWidht/844,
                        width: 80*screenWidht/844,
                        decoration: BoxDecoration(
                          border: Border.all(color: Color.fromRGBO(171, 171, 171, 1),
                          width: 4),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Center(child: Text("1", style: GoogleFonts.firaSans(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(171, 171, 171, 1)
                        ),),),
                      ),
                      SizedBox(width: 17.5*screenWidht/390),
                      Container(
                        height: 80*screenWidht/844,
                        width: 80*screenWidht/844,
                        decoration: BoxDecoration(
                          border: Border.all(color: Color.fromRGBO(171, 171, 171, 1),
                          width: 4),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Center(child: Text("2", style: GoogleFonts.firaSans(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(171, 171, 171, 1)
                        ),),),
                      ),
                      SizedBox(width: 17.5*screenWidht/390),
                      Container(
                        height: 80*screenWidht/844,
                        width: 80*screenWidht/844,
                        decoration: BoxDecoration(
                          border: Border.all(color: Color.fromRGBO(171, 171, 171, 1),
                          width: 4),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Center(child: Text("3", style: GoogleFonts.firaSans(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(171, 171, 171, 1)
                        ),),),
                      ),
                      SizedBox(width: 17.5*screenWidht/390),
                      Container(
                        height: 80*screenWidht/844,
                        width: 80*screenWidht/844,
                        decoration: BoxDecoration(
                          border: Border.all(color: Color.fromRGBO(171, 171, 171, 1),
                          width: 4),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Center(child: Text("4", style: GoogleFonts.firaSans(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(171, 171, 171, 1)
                        ),),),
                      ),
                    ],
                  )),

                  Positioned(
                  top: 316*screenHeight/844,
                  left: 21*screenWidht/390,
                  child: Container(
                  height: 20*screenHeight/844,
                  width: 3*screenWidht/390,
                  decoration: BoxDecoration(
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
                  color: Color.fromRGBO(114, 114, 114, 1),
                  fontSize: 24, 
                  fontWeight: FontWeight.w700), 
                )),
                Positioned( //mudar para icon de seta certo
                  top: 354*screenHeight/844,
                  left: 21*screenWidht/390,
                  child: Container(
                    height: 50*screenHeight/844,
                    width: 314*screenWidht/390,
                  decoration: BoxDecoration(
                    border:Border.all(color: Color.fromRGBO(171, 171, 171, 1,), width: 3 ), 
                    borderRadius: BorderRadius.circular(15)),
                    child: DropdownButton<String>(
                      isExpanded: true,
                      hint: Padding(padding: EdgeInsets.only(right: 15*screenWidht/390)),
                      items: <String>['Opção 1', 'Opção 2', 'Opção 3', 'Opção 4'].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(value),
                            ),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {}
                  )),
                ),

                Positioned(top: 416*screenHeight/844,
                  left: 21*screenWidht/390,
                  child: Container(
                  height: 20*screenHeight/844,
                  width: 3*screenWidht/390,
                  decoration: BoxDecoration(
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
                    color: Color.fromRGBO(114, 114, 114, 1),
                    fontSize: 24,
                    fontWeight: FontWeight.w700
                  ),)),
                
                Positioned(
                  top: 454*screenHeight/844,
                  left: 21*screenWidht/390,
                  child: Container(
                    height: screenHeight*24/844,
                    width: screenWidht*326/390,
                    child: Center(
                      child:Text("Não há testes ainda",style: GoogleFonts.inter(
                  fontStyle: FontStyle.italic,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Color.fromRGBO(171, 171, 171, 1)
                ),) ,
                    ),
                  )
                  ),

                Positioned(top: 490*screenHeight/844,
                  left: 21*screenWidht/390,
                  child: Container(
                  height: 20*screenHeight/844,
                  width: 3*screenWidht/390,
                  decoration: BoxDecoration(
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
                    color: Color.fromRGBO(114, 114, 114, 1),
                    fontSize: 24,
                    fontWeight: FontWeight.w700
                  ),)),
                Positioned(
                  top: 528*screenHeight/844,
                  left: 21*screenWidht/390,
                  child: Container(
                    height: screenHeight*24/844,
                    width: screenWidht*326/390,
                    child: Center(
                      child:Text("Não há planos ainda",style: GoogleFonts.inter(
                  fontStyle: FontStyle.italic,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Color.fromRGBO(171, 171, 171, 1)
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
                      border: Border.all(color: Color.fromRGBO(248, 61, 112, 1),width: 2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          top: 10*screenHeight/844,
                          left: 10*screenWidht/390,
                          child: Text("CRIAR INTERVENÇÃO", style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Color.fromRGBO(248, 61, 112, 1)
                          ),)),
                          Positioned(
                            right: screenWidht*10/390,
                            top: screenHeight*15/844,
                            child: Center(child: Image.asset("images/red_icon.png") ,)
                           )
                      ],
                    ) ,
                )),

                Positioned(
                  top: 582*screenHeight/844,
                  right: 21*screenWidht/390,
                  child: Image.asset("images/save_button.png")),
                  
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
      ),
    );
  }
}