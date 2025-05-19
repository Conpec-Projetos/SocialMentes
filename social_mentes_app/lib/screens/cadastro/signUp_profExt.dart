import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:logger/logger.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
// import 'package:firebase_storage/firebase_storage.dart';

import 'package:social_mentes/components/forwardButton.dart';
import 'package:social_mentes/components/signUpField.dart';
import 'package:social_mentes/components/positionDrawer.dart';
import 'package:social_mentes/components/profissionalDrawer.dart';
import 'package:social_mentes/components/profissionalListTile.dart';
import 'package:social_mentes/models/userPaciente.dart';
import 'package:social_mentes/models/userProfissional.dart';

class SignupProfExt extends StatefulWidget {
  const SignupProfExt({
    super.key,
  });

  @override
  State<SignupProfExt> createState() => SignUpProfExtState();
}

class SignUpProfExtState extends State<SignupProfExt> {
  final Logger _logger = Logger();
  bool p1 = false;
  bool p2 = false;
  bool p3 = false;
  bool p4 = false;
  List<List<String>> dadosIntervencao = [];

  String? _imagePath;

  Future<void> setUpFirebase() async {
    final data = Provider.of<UserPaciente>(context, listen: false);

    // String? photoUrl;
    // if (data.getFotoPath().isNotEmpty) {
    //   try {
    //     final file = File(data.getFotoPath());
    //     final fileName = file.path.split('/').last;
    //     final storageRef = FirebaseStorage.instance.ref().child('profile_photos/$fileName');
    //     final uploadTask = await storageRef.putFile(file);
    //     photoUrl = await storageRef.getDownloadURL();
    //   } catch (e) {
    //     photoUrl = null;
    //     ScaffoldMessenger.of(context).showSnackBar(
    //       SnackBar(content: Text('Erro ao enviar foto: $e')),
    //     );
    //   }
    // }

    List<Map<String, String>> profissionais = data.profissionais.map((prof) {
      return {
        'nome': prof[0],
        'email': prof[1],
        'celular': prof[2],
        'cargo': prof[3],
      };
    }).toList();

    List<Map<String, String>> intervencao = data.intervencao.map((item) {
      return {
        'nome': item[0],
        'email': item[1],
        'celular': item[2],
        'cargo': item[3],
        'uid': item.length > 4 ? item[4] : '',
      };
    }).toList();

    Map<String, dynamic> userData = {
      'address': {
        'addressDetails': data.getComplemento(),
        'cep': data.getCep(),
        'city': data.getCidade(),
        'neighborhood': data.getBairro(),
        'number': data.getNumero(),
        'state': data.getUf(),
        'street': data.getLogradouro(),
      },
      'caregivers': {
        'caregiver1': {
          'cpf': data.getCpf('Resp1'),
          'dateBirth': data.getNascimento('Resp1'),
          'email': data.getEmail('Resp1'),
          'kinship': data.getParentesco('Resp1'),
          'name': data.getNome('Resp1'),
          'phone': data.getCelular('Resp1'),
          'rg': data.getRg('Resp1'),
        },
        'caregiver2': {
          'cpf': data.getCpf('Resp2'),
          'dateBirth': data.getNascimento('Resp2'),
          'email': data.getEmail('Resp2'),
          'kinship': data.getParentesco('Resp2'),
          'name': data.getNome('Resp2'),
          'phone': data.getCelular('Resp2'),
          'rg': data.getRg('Resp2'),
        },
      },
      'children': {
        'cpf': data.getCpf('Paciente'),
        'dateBirth': data.getNascimento('Paciente'),
        'name': data.getNome('Paciente'),
      },
      'externalMonitoring': profissionais,
      'financialResponsible': data.getNome('Resp1'),
      'interventionTeams': intervencao,
      // 'photoUrl': photoUrl ?? '',
    };

    try {
      await FirebaseFirestore.instance.collection('patients').add(userData);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Dados enviados com sucesso!')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro ao enviar dados: $e')),
      );
    }
  }

  void mostrarProfissionais(Size size) async {
    await showModalBottomSheet<List<List<String>>>(
        context: context,
        builder: (BuildContext bc) {
          return ProfissionalDrawer(
            size: size,
          );
        });
  }

  void mostrarCargos(Size size, context) async {
    final result = await showModalBottomSheet<Map<String, bool>>(
        context: context,
        builder: (BuildContext bc) {
          return PositionDrawer(size: size, userType: '');
        });

    if (result != null) {
      setState(() {
        p1 = result['p1']!;
        p2 = result['p2']!;
        p3 = result['p3']!;
        p4 = result['p4']!;
      });
    }
  }

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _celularController = TextEditingController();

  void _addProExt() {
    String value = '';
    if (p1) {
      value = 'Fonoaudiólogo';
    } else if (p2) {
      value = 'Psicólogo';
    } else if (p3) {
      value = 'Pedagogo';
    } else if (p4) {
      value = 'Terapêuta Ocupacional';
    }
    List<String> proExt = [
      _nameController.text,
      _emailController.text,
      _celularController.text,
      value
    ];
    final userData = Provider.of<UserPaciente>(context, listen: false);
    userData.addProfissional(proExt);
  }

  void concluirCadastro() {
    _logger.i(Provider.of<UserPaciente>(context, listen: false).toString());
    setUpFirebase();
  }

  void returnTap() {
    Navigator.pop(context);
  }

  @override
  void initState() {
    super.initState();

    final userData = Provider.of<UserPaciente>(context, listen: false);
    _imagePath = userData.getFotoPath();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;
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
          Padding(
            padding: EdgeInsets.only(
              bottom: bottomInset > 0
                  ? 0 //Teclado aberto
                  : size.height * 158 / 844, //Teclado fechado
            ),
            child: Scaffold(
              resizeToAvoidBottomInset: true,
              backgroundColor: Colors.transparent,
              body: Consumer2<UserPaciente, UserProfissional>(
                  builder: (context, userPaciente, userProfissional, child) {
                return Stack(
                  children: [
                    Positioned(
                      top: size.height * 35 / 844,
                      left: size.width * 30 / 390,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          IconButton(
                              onPressed: () {
                                returnTap();
                              },
                              icon: const Image(
                                  image: AssetImage(
                                      'assets/images/back_button.png'))),
                          Text(
                            'Voltar',
                            style: GoogleFonts.firaSans(
                                fontSize: size.width * 0.05,
                                color: const Color.fromRGBO(69, 69, 69, 1)),
                          )
                        ],
                      ),
                    ),
                    Positioned(
                      top: size.height * 95 / 844,
                      left: size.width * 58 / 390,
                      right: size.width * 58 / 390,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('cadastro',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.bold,
                                  color: const Color.fromRGBO(69, 69, 69, 1),
                                  fontSize: size.width * 0.05)),
                          SizedBox(height: size.height * 0.01),
                          Container(
                            height: 4,
                            width: size.width * 0.65,
                            decoration: const BoxDecoration(
                                gradient: LinearGradient(colors: [
                              Color.fromRGBO(206, 231, 255, 0.53),
                              Color.fromRGBO(125, 185, 240, 1),
                              Color.fromRGBO(206, 231, 255, 1)
                            ])),
                          ),
                          SizedBox(height: size.height * 0.01),
                        ],
                      ),
                    ),
                    Positioned(
                      top: size.height * 141 / 844,
                      left: size.width * 80 / 390,
                      right: size.width * 76 / 390,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          LinearPercentIndicator(
                            width: size.width * 0.15,
                            percent: 1,
                            progressColor:
                                const Color.fromRGBO(206, 231, 255, 1),
                          ),
                          LinearPercentIndicator(
                            width: size.width * 0.15,
                            percent: 1,
                            progressColor:
                                const Color.fromRGBO(206, 231, 255, 1),
                          ),
                          LinearPercentIndicator(
                            width: size.width * 0.15,
                            percent: 1,
                            progressColor:
                                const Color.fromRGBO(206, 231, 255, 1),
                          ),
                          LinearPercentIndicator(
                            width: size.width * 0.15,
                            percent: 1,
                            progressColor:
                                const Color.fromRGBO(206, 231, 255, 1),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: size.height * 156 / 844,
                      ),
                      //bottom: size.height * 158/844,
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                left: size.width * 145 / 390,
                                right: size.width * 145 / 390,
                              ),
                              child: _imagePath == ''
                                  ? Image.asset('assets/images/imageAvatar.png')
                                  : Container(
                                      width: size.height * 100 / 844,
                                      height: size.height * 100 / 844,
                                      decoration: const ShapeDecoration(
                                        color: Color(0xFFFCFCFC),
                                        shape: OvalBorder(
                                          side: BorderSide(
                                              width: 2,
                                              color: Color(0xFFD7D7D7)),
                                        ),
                                      ),
                                      child: CircleAvatar(
                                        radius: size.height * 99 / 844,
                                        backgroundImage:
                                            Image.file(File(_imagePath!)).image,
                                      ),
                                    ),
                            ),
                            SizedBox(height: size.height * 20 / 844),
                            Container(
                              width: size.width * 350 / 390,
                              height: size.height * 50 / 844,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                  color: cargo
                                      ? const Color.fromARGB(255, 80, 149, 213)
                                      : const Color.fromARGB(
                                          255, 114, 114, 114),
                                ),
                              ),
                              child: Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 15,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          p1
                                              ? 'Fonoaudiólogo'
                                              : p2
                                                  ? 'Psicólogo'
                                                  : p3
                                                      ? 'Pedagogo'
                                                      : p4
                                                          ? 'Terapêuta Ocupacional'
                                                          : 'Selecione o acompanhamento',
                                          style: GoogleFonts.firaSans(
                                            fontStyle: FontStyle.italic,
                                            color: const Color.fromARGB(
                                                255, 171, 171, 171),
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            mostrarCargos(size, context);
                                          },
                                          icon: const Icon(
                                            Icons.arrow_downward,
                                            color: Color.fromARGB(
                                                255, 171, 171, 171),
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
                                      width: size.width * 219 / 390,
                                      height: size.height * 19 / 844,
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                      ),
                                      padding: EdgeInsets.only(
                                        left: size.width * 5 / 390,
                                        right: size.width * 5 / 390,
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Icon(
                                            Icons.person,
                                            color: cargo
                                                ? const Color.fromARGB(
                                                    255, 80, 149, 213)
                                                : const Color.fromARGB(
                                                    255, 114, 114, 114),
                                            size: 15,
                                          ),
                                          SizedBox(width: size.width * 5 / 390),
                                          Text(
                                            'Acompanhamento externo',
                                            style: GoogleFonts.firaSans(
                                              color: cargo
                                                  ? const Color.fromARGB(
                                                      255, 80, 149, 213)
                                                  : const Color.fromARGB(
                                                      255, 114, 114, 114),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: size.height * 20 / 844),
                            SignUpField(
                              controller: _nameController,
                              width: 350,
                              height: 50,
                              size: size,
                              text: 'Digite o nome do profissional',
                              identifierText: 'Nome do profissional',
                              identifierWidth: 180.33,
                              icon: true,
                              identifierIcon: Icons.person,
                            ),
                            SizedBox(height: size.height * 20 / 844),
                            SignUpField(
                              controller: _emailController,
                              width: 350,
                              height: 50,
                              size: size,
                              text: 'exemplo@email.com',
                              identifierText: 'Email',
                              identifierWidth: 69,
                              icon: true,
                              identifierIcon: Icons.email_sharp,
                            ),
                            SizedBox(height: size.height * 20 / 844),
                            Container(
                              width: size.width * 350 / 390,
                              height: size.height * 59 / 844,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SignUpField(
                                    controller: _celularController,
                                    width: 180,
                                    height: 50,
                                    size: size,
                                    text: '(NN) NNNNN-NNNN',
                                    identifierText: 'Celular',
                                    identifierWidth: 78.82,
                                    icon: true,
                                    identifierIcon: Icons.local_phone,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                      //top: 2,
                                      left: (15 / 390) * size.width,
                                    ),
                                    child: InkWell(
                                      onTap: () => _addProExt(),
                                      splashColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      child: ForwardButton(
                                          size: size,
                                          width: 155,
                                          height: 44,
                                          text: 'ADICIONAR',
                                          add: true),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(height: size.height * 10 / 844),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: size.width * 1 / 390),
                                  child: Text(
                                    'nome do profissional externo',
                                    style: GoogleFonts.poppins(
                                      color: const Color.fromARGB(
                                          255, 114, 114, 114),
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                SizedBox(width: size.width * 5 / 390),
                                Container(
                                  width: size.width * 37 / 390,
                                  height: size.height * 3 / 844,
                                  decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                        255, 114, 114, 114),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: size.height * 5 / 844),
                            SizedBox(
                              width: size.width * 350 / 390,
                              height: size.height * 56 / 844,
                              child: ListView.separated(
                                  separatorBuilder:
                                      (BuildContext context, int index) =>
                                          SizedBox(
                                            height: size.height * 13 / 844,
                                          ),
                                  itemCount: userPaciente.profissionais.length,
                                  itemBuilder: (context, index) {
                                    return ProfListTile(
                                      size: size,
                                      list: userPaciente.profissionais[index],
                                      index: index,
                                      type: 'Profissional',
                                    );
                                  }),
                            ),
                            SizedBox(height: size.height * 30 / 844),
                            Container(
                              width: size.width * 350 / 390,
                              height: size.height * 50 / 844,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                  color:
                                      const Color.fromARGB(255, 114, 114, 114),
                                ),
                              ),
                              child: Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 15,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          'Selecione os profissionais',
                                          style: GoogleFonts.firaSans(
                                            fontStyle: FontStyle.italic,
                                            color: const Color.fromARGB(
                                                255, 171, 171, 171),
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: () =>
                                              mostrarProfissionais(size),
                                          icon: const Icon(
                                            Icons.arrow_downward,
                                            color: Color.fromARGB(
                                                255, 171, 171, 171),
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
                                      width: size.width * 219 / 390,
                                      height: size.height * 19 / 844,
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                      ),
                                      padding: EdgeInsets.only(
                                        left: size.width * 5 / 390,
                                        right: size.width * 5 / 390,
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          const Icon(
                                            Icons.person,
                                            color: Color.fromARGB(
                                                255, 114, 114, 114),
                                            size: 15,
                                          ),
                                          SizedBox(width: size.width * 5 / 390),
                                          Text(
                                            'Equipe de intervenção',
                                            style: GoogleFonts.firaSans(
                                              color: const Color.fromARGB(
                                                  255, 114, 114, 114),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: size.height * 10 / 844),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: size.width * 1 / 390),
                                  child: Text(
                                    'equipe de intervenção',
                                    style: GoogleFonts.poppins(
                                      color: const Color.fromARGB(
                                          255, 114, 114, 114),
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                SizedBox(width: size.width * 5 / 390),
                                Container(
                                  width: size.width * 111 / 390,
                                  height: size.height * 3 / 844,
                                  decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                        255, 114, 114, 114),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: size.height * 5 / 844),
                            SizedBox(
                              width: size.width * 351 / 390,
                              height: size.height * 56 / 844,
                              child: ListView.separated(
                                  separatorBuilder:
                                      (BuildContext context, int index) =>
                                          SizedBox(
                                            height: size.height * 12 / 844,
                                          ),
                                  itemCount: userPaciente.intervencao.length,
                                  itemBuilder: (context, index) {
                                    return ProfListTile(
                                      size: size,
                                      list: userPaciente.intervencao[index],
                                      index: index,
                                      type: 'Intervenção',
                                    );
                                  }),
                            ),
                            SizedBox(height: size.height * 25 / 844),
                            InkWell(
                              onTap: () => concluirCadastro(),
                              child: ForwardButton(
                                size: size,
                                width: 350,
                                height: 44,
                                text: 'CONFIRMAR',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              }),
            ),
          ),
        ],
      ),
    ));
  }
}
