import 'package:flutter/material.dart';
import 'package:social_mentes/src/view/components/BarraPesquisa_widget.dart';
import 'package:social_mentes/src/view/components/Protocolo_paciente_widget.dart';
import 'package:social_mentes/src/view/services/paciente_servico.dart';

import '../models/PacienteModelo.dart';

class PsicoPacientes extends StatefulWidget {
  PsicoPacientes({super.key});

  @override
  State<PsicoPacientes> createState() => _PsicoPacientesState();
}

class _PsicoPacientesState extends State<PsicoPacientes> {

  final PacienteServico servico = PacienteServico();

  List<PacienteModelo> listaPacientes = [];
  late List<PacienteModelo> paci_pesquisado = listaPacientes;

    void onQueryChanged(String query) {
    setState(() {
      paci_pesquisado = listaPacientes
          .where((item) => item.nome.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }



  @override
  Widget build(BuildContext context) {

    return Container(
      margin: EdgeInsets.only(bottom: 126),
      child: Column(
        children: [
          BarraPesquisa(onQueryChanged: onQueryChanged,),
          Expanded(
            child: StreamBuilder(stream: servico.conectarStreamPaciente(), builder: (context, snapshot) {
              if(snapshot.connectionState == ConnectionState.waiting){
                return Center(child: CircularProgressIndicator(),);
              } else {
                if(snapshot.hasData && snapshot.data != null && snapshot.data!.docs.isNotEmpty){
                  listaPacientes = [];

                  for(var doc in snapshot.data!.docs){
                    listaPacientes.add(PacienteModelo.fromMap(doc.data())); //Foto está fixa em PacienteModelo
                  }
            
                  return ListView.builder(
                    itemCount: paci_pesquisado.length,
                    itemBuilder: (context, index) {
                      paci_pesquisado.sort((a,b) => a.nome.compareTo(b.nome));
                      return ProtocoloPacienteWidget(nome: paci_pesquisado[index].nome, foto: paci_pesquisado[index].foto, testes: paci_pesquisado[index].testes,);
                    },
                  );
            
                } else {
                  return const Center(child: Text("Nenhum paciente Encontrado", textAlign: TextAlign.center,),);
                }
              }
            },)
          ),
        ],
      ),
    );
  }
}