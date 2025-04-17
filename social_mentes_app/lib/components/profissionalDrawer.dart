import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:social_mentes/models/userPaciente.dart';
import 'package:social_mentes/components/forwardButton.dart';



class ProfissionalDrawer extends StatefulWidget {
  final Size size;

  ProfissionalDrawer({super.key, 
  required this.size,     
  });

  @override
  State<ProfissionalDrawer> createState() => _ProfissionalDrawerState();
}

class _ProfissionalDrawerState extends State<ProfissionalDrawer> {
  String? _addEquipeAtual;
  int indexSelecionado = -1;

  void _addEquipe(String value) {
    setState(() {
      _addEquipeAtual = value;      
    });
  }

  void done() async {
    await fetchIntervencaoData();
    Navigator.pop(context);
  }

  Future<void> fetchIntervencaoData() async {
    final userData = Provider.of<UserPaciente>(context, listen: false);

    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference userRef = firestore.collection('userProfiles');

    DocumentSnapshot userDoc = await userRef.doc(_addEquipeAtual).get(); 

    if(userDoc.exists){
      userData.addIntervencao([
        userDoc['fullName'], 
        userDoc['email'][0], 
        (userDoc['phone'] ?? "Telefone não disponível"), 
        userDoc['specialization'],
        _addEquipeAtual!
      ]);
    }
  }

  Future<List<List<dynamic>>> fetchProfissionais() async {
    // list = [nome, cargo, uid]
    try {
      final QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('userProfiles').get();
      final List<List<dynamic>> profissionais = snapshot.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        return [
          data['fullName'] ?? 'Nome não disponível',
          data['specialization'] ?? 'Especialização não disponível',
          doc.id,
        ];
      }).toList();
      return profissionais;
    } catch (e) {
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<List<dynamic>>>(
      future: fetchProfissionais(),
      builder: (context, snapshot) {
        if(snapshot.data != null){
          final profissional = snapshot.data!;
          return SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: widget.size.height * 300/844,
                  child: ListView.separated(
                    separatorBuilder: (BuildContext context, int index) => SizedBox(
                      height: widget.size.height * 13/844,
                    ),
                    itemCount: profissional.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: TextButton(
                          onPressed: () {
                            setState(() {
                              indexSelecionado=index;  
                            });
                            
                            _addEquipe(profissional[index][2]);
                          },
                          child: Center(
                            child: Text(
                              '${profissional[index][0]}(${profissional[index][1]})',
                              style: GoogleFonts.firaSans(
                                color: (index == indexSelecionado)?const Color.fromARGB(206, 80, 149, 213):const Color.fromARGB(255, 171, 171, 171),
                              ),
                            ),
                          )
                        ),
                      );
                    }
                  ),
                ),
                InkWell(
                  onTap: () => done(),
                  child: ForwardButton(
                    size: widget.size,
                    continuar: false,
                    text: 'SELECIONAR',
                    width: 350,
                    height: 44,
                  ),
                )
              ],
            ),
          );
        }else{
          return SizedBox(height: widget.size.height * 300/844,);
        }
        
        
        
      }
    );
  }
}