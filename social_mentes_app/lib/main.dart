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





import 'package:social_mentes/teste/cargos2.dart';

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
  bool click = false;
  int index = 0;

  @override
  Widget build(BuildContext context) {
    

    return StreamBuilder<User?>(stream: FirebaseAuth.instance.userChanges(), builder: (context, snapshot) {
      if(snapshot.hasData){
        //user logado
        if(!click){
          return Scaffold(
            appBar: AppBar(
              
              backgroundColor: Theme.of(context).colorScheme.inversePrimary,
              title: Text('Social Mentes'),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: (){
                      setState(() {
                        click = true;
                        index = 0;
                      });
                    },
                    child: Text("ADMINISTRAÇÃO")),
                  TextButton(
                    onPressed: (){
                      setState(() {
                        click = true;
                        index = 1;
                      });
                    },
                    child: Text("PSICÓLOGO")
                  ),
                ],
              ),
            )
          );
        } else{
          if(index == 0){
            //return CargosPage2();
            return AdmNavegacao(user: snapshot.data!);
          } else {
            return PsicoNavegacao(user: snapshot.data!);
          }
        }
      } else {
        //user deslogado
        click = false;
        return LoginPage();
        
      }
    },);
  }
}
