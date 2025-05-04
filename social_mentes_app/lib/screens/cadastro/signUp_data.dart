import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';

import 'package:social_mentes/screens/cadastro/signUp_address.dart';
import 'package:social_mentes/components/positionDrawer.dart';
import 'package:social_mentes/components/signUpField.dart';
import 'package:social_mentes/components/forwardButton.dart';
import 'package:social_mentes/models/userPaciente.dart';
import 'package:social_mentes/models/userProfissional.dart';

class SignUpDataPage extends StatefulWidget {
  const SignUpDataPage({
    super.key,
    required this.paciente,
    required this.profissional,
  });

  final bool paciente;
  final bool profissional;

  @override
  State<SignUpDataPage> createState() => SignUpDataPageState();
}

class SignUpDataPageState extends State<SignUpDataPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _name2Controller = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _cepController = TextEditingController();
  final TextEditingController _cpfController = TextEditingController();
  final TextEditingController _celularController = TextEditingController();
  final TextEditingController _dataController = TextEditingController();
  final TextEditingController _ufController = TextEditingController();
  final TextEditingController _cidadeController = TextEditingController();
  
  bool p1 = false;
  bool p2 = false;
  bool p3 = false;
  bool p4 = false;

  XFile? _imageFile;
  final ImagePicker _picker = ImagePicker();

  Future<void> getImage(Size size) async {
    bool? isCamera = await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: Text(
                "Câmera",
                style: GoogleFonts.firaSans(
                  color: const Color.fromARGB(255, 80, 149, 213)
                ), 
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: Text(
                "Escolher da galeria",
                style: GoogleFonts.firaSans(
                  color: const Color.fromARGB(255, 80, 149, 213)
                ), 
              ),
            ),
          ],
        ),
      ),
    );

    if (isCamera == null) return;

    final pickedFile = await _picker.pickImage(source: isCamera ? ImageSource.camera : ImageSource.gallery);
    _imageFile = pickedFile;
    if (widget.paciente && _imageFile != null) {
      final userData = Provider.of<UserPaciente>(context, listen: false);
      userData.setFotoPath(_imageFile!.path);
    } else if (widget.profissional && _imageFile != null) {
      final userData = Provider.of<UserProfissional>(context, listen: false);
      userData.setFotoPath(_imageFile!.path);
    }
  }

  void nextData(bool paciente, bool profissional) {
    Navigator.push(
      context,
      CupertinoPageRoute(builder: (context) => SignUpAddress(
        paciente: paciente,
        profissional: profissional
      )),
    );
  }

  void returnTap() {
    Navigator.pop(context);
  }

  void mostrarCargos(Size size, context) async {
    final result = await showModalBottomSheet<Map<String, bool>>(
      context: context, 
      builder: (BuildContext bc){
        return PositionDrawer(size: size, 
        userType: 'Profissional',
        );
      }
    );

    if (result != null) {
      setState(() {
        p1 = result['p1']!;
        p2 = result['p2']!;
        p3 = result['p3']!;
        p4 = result['p4']!;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    bool cargo = (p1 || p2 || p3 || p4);
    return SafeArea(

      child: Container(
        color: Colors.white,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              right: 0,
              child: Image.asset('assets/images/defaultBG_up.png'),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Image.asset('assets/images/defaultBG_down.png'),
            ),
            Scaffold(
              resizeToAvoidBottomInset: true,
              backgroundColor: Colors.transparent,
              
              body: Consumer2<UserPaciente, UserProfissional>(
                builder: (context, userPaciente, userProfissional, child) {
                return Stack(
                  children: [
                    
                    Positioned(
                      top: size.height * 35/844,
                      left: size.width * 30/390,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            IconButton(
                              onPressed: () {
                                returnTap();
                              },
                              icon: const Image(image: AssetImage('assets/images/back_button.png'))
                            ),
                            Text('Voltar', style: GoogleFonts.firaSans(fontSize: size.width * 0.05, color: const Color.fromRGBO(69, 69, 69, 1)),)
                          ],
                        ),
                    ),
                    Positioned(
                      top: size.height * 95/844,
                      left: size.width * 58/390,
                      right: size.width * 58/390,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('cadastro', style: GoogleFonts.poppins(
                            fontWeight: FontWeight.bold,
                            color: const Color.fromRGBO(69, 69, 69, 1),
                            fontSize: size.width * 0.05
                          )),
                          SizedBox(height: size.height * 0.01),
                          Container(
                            height: 4,
                            width: size.width * 0.65,
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(colors: [
                                Color.fromRGBO(206, 231, 255, 0.53),
                                Color.fromRGBO(125, 185, 240, 1),
                                Color.fromRGBO(206, 231, 255, 1)
                              ])
                            ),
                          ),
                          SizedBox(height: size.height * 0.01),
                        ],
                      ),
                    ),
                    Positioned(
                      top: size.height * 141/844,
                      left: widget.paciente? size.width * 80/390 : size.width * 107/390,
                      right: widget.paciente? size.width * 76/390 : size.width * 100/390,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          LinearPercentIndicator(width: size.width * 0.15,
                            percent: 1,
                            progressColor: const Color.fromRGBO(206, 231, 255, 1),
                          ),
                          LinearPercentIndicator(
                            width: size.width * 0.15,
                            percent: 1,
                            progressColor: const Color.fromRGBO(206, 231, 255, 1),
                          ),
                          LinearPercentIndicator(width: size.width * 0.15,
                            percent: 0,
                            progressColor: const Color.fromRGBO(215, 215, 215, 1),
                          ),
                          if (widget.paciente)
                          LinearPercentIndicator(width: size.width * 0.15,
                            percent: 0,
                            progressColor: const Color.fromRGBO(215, 215, 215, 1),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: size.height * 156/844,
                      left: size.width * 145/390,
                      right: size.width * 145/390,
                      child: _imageFile == null
                      ? Image.asset('assets/images/imageAvatar.png')
                      : Container(
                          width: size.width * 100/390,
                          height: size.height * 100/844,
                          decoration: const ShapeDecoration(
                            color: Color(0xFFFCFCFC),
                            shape: OvalBorder(
                              side: BorderSide(width: 2, color: Color(0xFFD7D7D7)
                              ),
                            ),
                          ),
                          child: Image.file(File(_imageFile!.path))),
                    ),
                    Positioned(
                      top: size.height * 218/844,
                      left: size.width * 212/390,
                      right: size.width * 140/390,
                      child: IconButton(
                        icon: Image.asset('assets/images/chooseImage.png'),
                        onPressed:() => getImage(size),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: size.height * 285/844,
                        left: size.width * 20/390,
                        right: size.width * 20/390,
                      ),
                      
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          
                          children: [
                            SignUpField(
                              controller: _nameController,
                              width: 350,
                              height: 50,
                              size: size,
                              text: widget.profissional? 'Digite seu nome' : 'Digite o nome da criança',
                              identifierText: widget.profissional? 'Nome completo' : 'Nome da criança',
                              identifierWidth: widget.profissional? 140.33 : 152,
                              icon: true,
                              identifierIcon: widget.profissional? Icons.person : Icons.child_care,
                              userType: widget.profissional? 'Profissional' : 'Paciente',
                              index: 0,
                            ),
                            SizedBox(height: size.height * 20/844),
                            SignUpField(
                              controller: widget.profissional? _emailController : _name2Controller,
                              size: size,
                              text: widget.profissional? 'exemplo@email.com' : 'Digite o nome do responsável',
                              width: 350,
                              height: 50,
                              identifierText: widget.profissional? 'Email' : 'Nome do responsável',
                              identifierWidth: widget.profissional? 69 : 182.33,
                              icon: true,
                              identifierIcon: widget.profissional? Icons.email_sharp : Icons.person,
                              userType: widget.profissional? 'Profissional' : 'Resp1',
                              index: widget.profissional? 1 : 0
                            ),
                            SizedBox(height: size.height * 20/844),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SignUpField(
                                  controller: _cepController,
                                  width: 147,
                                  height: 50,
                                  size: size,
                                  text: 'NNNNN-NNN',
                                  identifierText: 'CEP',
                                  identifierWidth: 55.63,
                                  icon: true,
                                  identifierIcon: Icons.location_on_sharp,
                                  userType: widget.profissional? 'Profissional' : 'Paciente',
                                  index: widget.profissional? 2 : 1
                                ),
                                SizedBox(width: size.width * 15/390),
                                SignUpField(
                                  controller: _cpfController,
                                  width: 188, 
                                  height: 50, 
                                  size: size, 
                                  text: 'NNN.NNN.NNN-NN',
                                  identifierText: 'CPF',
                                  identifierWidth: 54.24,
                                  icon: true,
                                  identifierIcon: Icons.credit_card,
                                  userType: widget.profissional? 'Profissional' : 'Paciente',
                                  index: widget.profissional? 3 : 2
                                ),
                              ],
                            ),
                            SizedBox(height: size.height * 20/844),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SignUpField(
                                  controller: _celularController,
                                  width: 170, 
                                  height: 50, 
                                  size: size, 
                                  text: '(NN) NNNNN-NNNN',
                                  identifierText: 'Celular',
                                  identifierWidth: 78.02,
                                  icon: true,
                                  identifierIcon: Icons.local_phone,
                                  userType: widget.profissional? 'Profissional' : 'Paciente',
                                  index: widget.profissional? 4 : 3
                                ),
                                SizedBox(width: size.width * 15/390),
                                if (widget.paciente)
                                  SignUpField(
                                    controller: _dataController,
                                    width: 165, 
                                    height: 50, 
                                    size: size, 
                                    text: 'DD/MM/AAAA',
                                    identifierText: 'Nascimento',
                                    identifierWidth: 115.50,
                                    icon: true,
                                    identifierIcon: Icons.calendar_month,
                                    userType: 'Paciente',
                                    index: 4
                                  ),
                                if (widget.profissional)
                                  Container(
                                    width: size.width * 165/390,
                                    height: size.height * 50/844,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(
                                        color: cargo
                                        ? const Color.fromARGB(255, 80, 149, 213)
                                        : const Color.fromARGB(255, 114, 114, 114),
                                      ),
                                    ),
                                    child: Stack(
                                      clipBehavior: Clip.none,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                            left: p4 ? 6 : 15,
                                          ),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              if (p4)
                                                Text(
                                                  'Terapêuta Ocupacional',
                                                  style:  GoogleFonts.firaSans(
                                                    fontStyle: FontStyle.italic,
                                                    color: const Color.fromARGB(255, 171, 171, 171),
                                                    fontSize: 10,
                                                  ),
                                                ),
                                              if (!p4)
                                                Text(
                                                  p1
                                                  ? 'Fonoaudiólogo' : p2
                                                    ? 'Psicólogo' : p3
                                                      ? 'Pedagogo' : 'Selecione',
                                                  style:  GoogleFonts.firaSans(
                                                    fontStyle: FontStyle.italic,
                                                    color: const Color.fromARGB(255, 171, 171, 171),
                                                  ),
                                                ),
                                              IconButton(
                                                onPressed: (){
                                                  mostrarCargos(size, context);
                                                }, 
                                                icon: const Icon(
                                                  Icons.arrow_downward,
                                                  color:Color.fromARGB(255, 171, 171, 171), 
                                                  size: 15,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Positioned(
                                          top: -10,
                                          left: 20,
                                          child: Container(
                                            width:  size.width * 69.33/390,
                                            height: size.height * 19/844,
                                            decoration: const BoxDecoration(
                                              color: Colors.white,
                                            ),
                                            padding: EdgeInsets.only(
                                              left: size.width * 5/390,
                                              right: size.width * 5/390,
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                Icon(
                                                    Icons.cases_outlined,
                                                    color: cargo
                                                    ? const Color.fromARGB(255, 80, 149, 213)
                                                    : const Color.fromARGB(255, 114, 114, 114),
                                                    size: 15,
                                                ),
                                                SizedBox(width: size.width * 5/390),
                                                Text(
                                                  'Cargo',
                                                  style: GoogleFonts.firaSans(
                                                    color: cargo
                                                    ? const Color.fromARGB(255, 80, 149, 213)
                                                    : const Color.fromARGB(255, 114, 114, 114),
                                                  ), 
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                              ],
                            ),
                            SizedBox(height: size.height * 20/844),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SignUpField(
                                  controller: _ufController,
                                  width: 93, 
                                  height: 50, 
                                  size: size, 
                                  text: 'Estado',
                                  identifierText: 'UF',
                                  identifierWidth: 47,
                                  icon: true,
                                  identifierIcon: Icons.info,  
                                  userType: widget.profissional? 'Profissional' : 'Paciente',
                                  index: widget.profissional? 6 : 5
                                ),
                                SizedBox(width: size.width * 15/390),
                                SignUpField(
                                  controller: _cidadeController,
                                  width: 242, 
                                  height: 50, 
                                  size: size, 
                                  text: 'Cidade',
                                  identifierText: 'Cidade',
                                  identifierWidth: 77.62,
                                  icon: true,
                                  identifierIcon: Icons.location_city,
                                  userType: widget.profissional? 'Profissional' : 'Paciente',
                                  index: widget.profissional? 7 : 6
                                ),
                              ],
                            ),
                            SizedBox(height: size.height * 20/844),
                            InkWell(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: (widget.paciente || widget.profissional) 
                                ? () => nextData(widget.paciente, widget.profissional)
                                : () {},
                              child: ForwardButton(
                                continuar: true,
                                size: size,
                                width: 350,
                                height: 44,
                                text: 'CONTINUAR',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
                },
              ),
              
            ),
          ],
        ),
      ),
    );
  }
}