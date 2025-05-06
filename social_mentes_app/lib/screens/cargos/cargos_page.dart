import 'package:flutter/material.dart';

import 'package:social_mentes/components/widget_paciente.dart';
import 'package:social_mentes/screens/cargos/information_page.dart';
import 'package:social_mentes/services/user_quantity.dart';


class CargosPage extends StatefulWidget {
  String userId;
  CargosPage({super.key, required this.userId});

  @override
  State<CargosPage> createState() => _CargosPageState();
}

class _CargosPageState extends State<CargosPage> {
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return Container(
      color: Colors.transparent,
      margin: EdgeInsets.only(bottom: 126),
      child: Stack(
        children: [
          Column(
            children: [
            FutureBuilder<List<Map<String, dynamic>>>(
            future: dataUser(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Expanded(child: Center(child: CircularProgressIndicator()));
              } else if (snapshot.hasError) {
                return Center(child: Text('Erro ao carregar dados'));
              } else {
                List<Map<String, dynamic>> users = snapshot.data ?? [];
                users.removeWhere((map) => map['id'] == widget.userId); //remove o próprio usuário da lista, não pode alterar a si mesmo

                return Expanded(
                  child: GridView.builder(
                    padding: EdgeInsets.only(left: 16, right: 16), 
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 2,
                      mainAxisSpacing: 2,
                      childAspectRatio: 1,
                    ),
                    itemCount: users.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          print(users[index]['photoUrl']);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => InformationPage(
                                name: users[index]['fullName'] ?? 'sem nome',
                                cargo: users[index]['position'] ?? 'sem cargo',
                                foto: users[index]['photoUrl'] ?? 'https://cdn-icons-png.flaticon.com/512/4519/4519678.png',
                                id: users[index]['id'],
                              ),
                            ),
                          ).then((value) => setState(() {}));
                        },
                        child: Column(
                          children: [
                            SizedBox(height: 20 * screenHeight / 844),
                            WidgetPaciente(
                              name: users[index]['fullName'] ?? 'Sem Nome',
                              cargo: users[index]['position'] ?? 'Sem Cargo',
                              foto: users[index]['photoUrl'] ?? 'https://cdn-icons-png.flaticon.com/512/4519/4519678.png',
                              
                            ),
                            SizedBox(height: 20 * screenHeight / 844),
                          ],
                        ),
                      );
                    },
                  ),
                );
              }
            },
          )
            ],
          ),
        ],
      ),
    );
  }
}