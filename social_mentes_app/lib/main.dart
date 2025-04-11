import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:social_mentes/firebase_options.dart';
import 'package:provider/provider.dart';
import 'package:social_mentes/models/userPaciente.dart';
import 'package:social_mentes/models/userProfissional.dart';

import 'package:social_mentes/screens/admin_navegation_page.dart';
import 'package:social_mentes/screens/login/login_page.dart';
import 'package:social_mentes/screens/psico_navegation_page.dart';
import 'package:social_mentes/services/autenticacao_servico.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp( 
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserPaciente()),
        ChangeNotifierProvider(create: (context) => UserProfissional()),
      ],
      child: MaterialApp(
        title: 'SocialMentes',
        home: RoteadorTela(),
      ),
    );
    
  }
}

class RoteadorTela extends StatefulWidget {
  const RoteadorTela({super.key});

  @override
  State<RoteadorTela> createState() => _RoteadorTelaState();
}


class _RoteadorTelaState extends State<RoteadorTela> {

  @override
  Widget build(BuildContext context) {
    AutenticacaoServico auth = AutenticacaoServico();
    

    return StreamBuilder<User?>(stream: FirebaseAuth.instance.userChanges(), builder: (context, snapshot) {
      if(snapshot.hasData){
        //user logado
        return FutureBuilder<Map<String, dynamic>>(
            future: auth.getUserInfo(user: snapshot.data!),
            builder: (context, userInfoSnapshot) {
              if (userInfoSnapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (userInfoSnapshot.hasData) {
                String cargo = userInfoSnapshot.data!['position'];

                if (cargo == "Administrador") {
                  return AdmNavegacao(user: snapshot.data!, userInfo: userInfoSnapshot.data!,);
                } else if (cargo == "Psicólogo") {
                  return PsicoNavegacao(user: snapshot.data!, userInfo: userInfoSnapshot.data!);
                } else {
                  return Scaffold(
                    body: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(cargo),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              textStyle: const TextStyle(fontSize: 20, color: Colors.white),
                              backgroundColor: Colors.blue[100],
                              ),

                            onPressed: () => auth.deslogar(),
                            child: Text("Deslogar"),
                          ),
                        ],
                      ),
                    ),
                  );
                }
              } else {
                return Scaffold(
                    body: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Erro ao carregar o usuário"),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              textStyle: const TextStyle(fontSize: 20, color: Colors.white),
                              backgroundColor: Colors.blue[100],
                              ),

                            onPressed: () => auth.deslogar(),
                            child: Text("Deslogar"),
                          ),
                        ],
                      ),
                    ),
                  );
              }
            },
          );
        
      } else {
        //user deslogado
        return LoginPage();
        
      }
    },);
  }
}
