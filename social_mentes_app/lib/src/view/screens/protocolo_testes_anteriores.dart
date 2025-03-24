import 'package:flutter/material.dart';
import 'package:social_mentes/src/view/components/teste_anterior_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:social_mentes/src/view/models/TesteModelo.dart';
import 'package:social_mentes/src/view/services/testes_servico.dart';
import '../common/Cores.dart';

import 'package:social_mentes/src/view/screens/create_cheaklist.dart';



class ProtocoloTestesAnteriores extends StatefulWidget {
  //TESTES
  final String nome;
  final List<dynamic> testes;
  //--

  const ProtocoloTestesAnteriores({super.key, required this.nome, required this.testes});

  @override
  State<ProtocoloTestesAnteriores> createState() => _ProtocoloTestesAnterioresState();
}

class _ProtocoloTestesAnterioresState extends State<ProtocoloTestesAnteriores> {

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    final TestesServico servico = TestesServico();

    return Scaffold(
      body: Stack(
        children: [
          
          Positioned(
            right: 0,
            top: 0,
            child: Image.asset("../images/Balls_up.png"),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: Image.asset("../images/Balls_down.png"),
          ),

          Positioned(
            left: 30,
            top: 35,
            child: Row(
              children: [
                IconButton(
                  icon: Image.asset("../images/back_button.png"),
                  onPressed: () => Navigator.of(context).pop(),
                ), 
                Text("Voltar", style: GoogleFonts.firaSans(fontSize: 24, fontWeight: FontWeight.w400, color: Cores.cinza5),),
              ],
            )
          ),

          Container(
          alignment: Alignment.center,
          
          margin: EdgeInsets.fromLTRB((28/390)*screenWidth, (120/844)*screenHeight, (28/390)*screenWidth, (170/844)*screenHeight),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
        
            children: [
              Text(widget.nome, style: GoogleFonts.firaSans(fontSize: 16, fontWeight: FontWeight.w400, color: Cores.cinza4),),
              Text("testes", style: GoogleFonts.firaSans(fontSize: 24, fontWeight: FontWeight.w700, color: Cores.cinza5),),
              
              SizedBox(
                height: 2,
                width: 200,
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(colors: [Cores.azul0, Cores.azul1, Cores.azul0], )
                  ),
                ),
              ),
        
              const SizedBox(height: 40,),
        
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      //Lista de testes anteriores
                      SizedBox(
                        width: double.infinity,
                        child: StreamBuilder(stream: servico.conectarStreamTeste(), builder: (context, snapshot) {
                          if(snapshot.connectionState == ConnectionState.waiting){
                            return Center(child: CircularProgressIndicator(),);
                          } else {
                            if(snapshot.hasData && snapshot.data != null && snapshot.data!.docs.isNotEmpty){
                              List<TesteModelo> listaTestes = [];
                              
                              //ID dos testes
                              for(var doc in snapshot.data!.docs){
                                if (widget.testes.contains(doc.data()["id"]) /*&& doc.data()["patientName"] == widget.nome*/){
                                  listaTestes.add(TesteModelo.fromMap(doc.data()));
                                }
                              }
                              /*
                              for(int i = 0; i < widget.testes.length; i++){
                                listaTestes.add(TesteModelo.fromMap(snapshot.data!.docs[i].data()));
                              }*/
                              //-----------------------------------------------------------------------------------------------------------------------


                              return Wrap(
                                alignment: WrapAlignment.start,
                                
                                spacing: 10,
                                runSpacing: 15,
                                //COLOCADO COM A LISTA TESTE
                                children: List.generate(listaTestes.length, (index) {
                                  return TesteAnteriorWidget(id: listaTestes[index].id.toString().padLeft(4, '0'), data: listaTestes[index].data, finalizado: (listaTestes[index].situation == 0));
                                })
                              );
                        
                            } else {
                              return const Center(child: Text("Nenhum paciente Encontrado", textAlign: TextAlign.center,),);
                            }
                          }
                        },)

                      ),
        
                      const SizedBox(height: 40,),
        
                      //Botão                    
                      Container(
                        height: 44.0,
                        width: 190,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(colors: [Cores.azul1, Cores.azul2]),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: ElevatedButton(
                          //FUNÇÃO DE CRIAR TESTE
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => CreateProtocols2(),));
                          },
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.transparent, shadowColor: Colors.transparent),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text("CRIAR TESTE", style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600, color: const Color(0xFFEFF7FF)),),
                              const Icon(Icons.add_to_photos, color: Color(0xFFEFF7FF),),
                            ],
                          ),
                        ),
                      )
        
        
                  
                    ],
                  ),
                )
              ),
        
            ],
          ),
        ),]
      ),
    );
  }
}