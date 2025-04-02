import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'package:social_mentes/models/userProfissional.dart';
import 'package:social_mentes/screens/cadastro/sign_up_page.dart';
import 'package:social_mentes/components/forwardButton.dart';

class PositionDrawer extends StatefulWidget {
  final Size size;
  final String userType;

  
  PositionDrawer({super.key, 
  required this.size,    
  required this.userType  
  });

  @override
  State<PositionDrawer> createState() => _PositionDrawerState();
}

class _PositionDrawerState extends State<PositionDrawer> {
  
  bool p1 = false;
  bool p2 = false;
  bool p3 = false;
  bool p4 = false;
  
  void done(bool a, bool b, bool c, bool d) {
    if (widget.userType == 'Profissional') {
      String value = '';
      if (a) {
        value = 'Fonoaudiólogo';
      } else if (b) {
        value = 'Psicólogo';
      } else if (c) {
        value = 'Pedagogo';
      } else if (d) {
        value = 'Terapêuta Ocupacional';
      }
      final userData = Provider.of<UserProfissional>(context, listen: false);
      userData.updateProfissional(5, value);
    }
    Navigator.pop(context, {
    'p1': a,
    'p2': b,
    'p3': c,
    'p4': d
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
          child: Wrap(
            children: <Widget> [
              ListTile(
                title: Center(
                  child: Text(
                    'Escolha a competência',
                    style: GoogleFonts.poppins(
                      color: const Color.fromARGB(255, 69, 69, 69),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ), 
                  ),
                ),
              ),
              ListTile(
                title: TextButton(
                  onPressed: () {
                    setState(() {
                      p1 = true;
                      p2 = false;
                      p3 = false;
                      p4 = false;
                    }); 
                  },
                  child: p1
                  ? GradientText(
                    text: 'Fonoaudiólogo',
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Color.fromARGB(206, 80, 149, 213), Color.fromARGB(255, 139, 199, 255)],
                    ),
                    style: GoogleFonts.firaSans(
                      fontSize: 20,
                    ),
                  )
                  : Text(
                    'Fonoaudiólogo',
                    style: GoogleFonts.firaSans(
                      color: const Color.fromARGB(255, 171, 171, 171),
                      fontSize: 20
                    ),
                  )
                ),
              ),
              ListTile(
                title: TextButton(
                  onPressed: () {
                    setState(() {
                      p1 = false;
                      p2 = true;
                      p3 = false;
                      p4 = false;
                    }); 
                  },
                  child: p2
                  ? GradientText(
                    text: 'Psicólogo',
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Color.fromARGB(206, 80, 149, 213), Color.fromARGB(255, 139, 199, 255)],
                    ),
                    style: GoogleFonts.firaSans(
                      fontSize: 20,
                    ),
                  )
                  : Text(
                    'Psicólogo',
                    style: GoogleFonts.firaSans(
                      color: const Color.fromARGB(255, 171, 171, 171),
                      fontSize: 20
                    ),
                  )
                ),
              ),
              ListTile(
                title: TextButton(
                  onPressed: () {
                    setState(() {
                      p1 = false;
                      p2 = false;
                      p3 = true;
                      p4 = false;
                    }); 
                  },
                  child: p3
                  ? GradientText(
                    text: 'Pedagogo',
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Color.fromARGB(206, 80, 149, 213), Color.fromARGB(255, 139, 199, 255)],
                    ),
                    style: GoogleFonts.firaSans(
                      fontSize: 20,
                    ),
                  )
                  : Text(
                    'Pedagogo',
                    style: GoogleFonts.firaSans(
                      color: const Color.fromARGB(255, 171, 171, 171),
                      fontSize: 20
                    ),
                  )
                ),
              ),
              ListTile(
                title: TextButton(
                  onPressed: () {
                    setState(() {
                      p1 = false;
                      p2 = false;
                      p3 = false;
                      p4 = true;
                    }); 
                  },
                  child: p4
                  ? GradientText(
                    text: 'Terapêuta Ocupacional',
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Color.fromARGB(206, 80, 149, 213), Color.fromARGB(255, 139, 199, 255)],
                    ),
                    style: GoogleFonts.firaSans(
                      fontSize: 20,
                    ),
                  )
                  : Text(
                    'Terapêuta Ocupacional',
                    style: GoogleFonts.firaSans(
                      color: const Color.fromARGB(255, 171, 171, 171),
                      fontSize: widget.size.width * 0.05
                    ),
                  )
                ),
              ),
              ListTile(
                title: InkWell(
                  onTap: () => done(p1, p2, p3, p4),
                  child: ForwardButton(
                    size: widget.size,
                    continuar: false,
                    text: 'SELECIONAR',
                    width: 350,
                    height: 44,
                  ),
                ),
              ),
            ],
          ),
        );
  }
}