import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:social_mentes/models/userPaciente.dart';
import 'package:social_mentes/models/userProfissional.dart';
import 'package:social_mentes/src/view/components/forwardButton.dart';
import 'package:social_mentes/src/view/components/signUpField.dart';
import 'package:social_mentes/src/view/screens/signUp_profExt.dart';
import 'package:provider/provider.dart';
import 'package:logger/logger.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignUpAddress extends StatefulWidget {
  SignUpAddress({
    super.key,
    required this.paciente,
    required this.profissional,
  });

  final bool paciente;
  final bool profissional;

  @override
  State<SignUpAddress> createState() => SignUpAddressState();
}

class SignUpAddressState extends State<SignUpAddress> {
  final TextEditingController _bairroController = TextEditingController();
  final TextEditingController _logradouroController = TextEditingController();
  final TextEditingController _numeroController = TextEditingController();
  final TextEditingController _complController = TextEditingController();
  final TextEditingController _bancoController = TextEditingController();
  final TextEditingController _agenciaController = TextEditingController();
  final TextEditingController _contaController = TextEditingController();
  final TextEditingController _pixController = TextEditingController();

  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _parentController = TextEditingController();
  final TextEditingController _cpfController = TextEditingController();
  final TextEditingController _rgController = TextEditingController();
  final TextEditingController _celularController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _dataController = TextEditingController();

  final TextEditingController _nome2Controller = TextEditingController();
  final TextEditingController _parent2Controller = TextEditingController();
  final TextEditingController _cpf2Controller = TextEditingController();
  final TextEditingController _rg2Controller = TextEditingController();
  final TextEditingController _celular2Controller = TextEditingController();
  final TextEditingController _email2Controller = TextEditingController();
  final TextEditingController _data2Controller = TextEditingController();

  Future<void> fireBaseSetup(UserProfissional data) async {
    final Map<String, dynamic> userData = {
      'address': {
        'addressDetails': data.getComplemento(),
        'cep' : data.getCep(),
        'city': data.getCidade(),
        'neighborhood': data.getBairro(),
        'number': data.getNumero(),
        'state': data.getUf(),
        'street': data.getLogradouro() 
      },
      'bankData': {
        'account': data.getConta(),
        'bank': data.getBanco(),
        'branch': data.getAgencia(),
        'pix': data.getChavePix()
      },
      'cpf': data.getCpf(),
      'email': [data.getEmail()],
      'fullName': data.getNome(),
      'phone': data.getCelular(),
      'specialization': data.getCargo(),
    };

    try {
      await FirebaseFirestore.instance.collection('userProfiles').add(userData);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Dados enviados com sucesso!')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro ao enviar dados: $e')),
      );
    }
  }

  void nextData(bool paciente, bool profissional) {
    final _logger = Logger();
    if (paciente) {
      Navigator.push(
        context,
        CupertinoPageRoute(builder: (context) => SignupProfExt()),
      );
    }
    else if (profissional) {
      final userData = Provider.of<UserProfissional>(context, listen: false);
      fireBaseSetup(userData);
    }
  }

  void returnTap() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Consumer2<UserPaciente, UserProfissional>(
          builder: (context, userPaciente, userProfissional, child) {
            return Stack(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Image.asset('assets/images/appBarImage.png'),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Image.asset('assets/images/bottomPageImage.png'),
                ),
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
                          icon: const Image(image: AssetImage('assets/images/back_image.png'))
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
                        percent: 1,
                        progressColor: const Color.fromRGBO(206, 231, 255, 1),
                      ),
                      if (widget.paciente)
                      LinearPercentIndicator(width: size.width * 0.15,
                        percent: 0,
                        progressColor: const Color.fromRGBO(215, 215, 215, 1),
                      ),
                    ],
                  ),
                ),
                if (widget.paciente)
                  Positioned(
                    top: size.height * 156/844,
                    bottom: size.height * 158/844,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              left: size.width * 145/390,
                              right: size.width * 145/390,
                            ),
                            child: Image.asset('assets/images/imageAvatar.png')//Image.file(File(widget.profissional? userProfissional.dadosProfissional[16] : userPaciente.dados['Paciente']![11]))
                          ),
                          SizedBox(height: size.height * 20/844),
                          SignUpField(
                            controller: _bairroController,
                            width: 350, 
                            height: 50, 
                            size: size, 
                            text: 'Digite seu bairro',
                            identifierText: 'Bairro',
                            identifierWidth: 72,
                            icon: true,
                            identifierIcon: Icons.info,
                            userType: widget.profissional? 'Profissional' : 'Paciente',
                            index: widget.profissional? 8 : 7
                          ),
                          SizedBox(height: size.height * 20/844),
                          SignUpField(
                            controller: _logradouroController,
                            width: 350, 
                            height: 50, 
                            size: size, 
                            text: 'Digite seu logradouro',
                            identifierText: 'Logradouro',
                            identifierWidth: 110,
                            icon: true,
                            identifierIcon: Icons.info,
                            userType: widget.profissional? 'Profissional' : 'Paciente',
                            index: widget.profissional? 9 : 8
                          ),
                          SizedBox(height: size.height * 20/844),
                          Row(
                            children: [
                              SignUpField(
                                controller: _numeroController,
                                width: 128, 
                                height: 50, 
                                size: size, 
                                text: 'NNNN',
                                identifierText: 'Número',
                                identifierWidth: 95,
                                icon: true,
                                identifierIcon: Icons.onetwothree,
                                userType: widget.profissional? 'Profissional' : 'Paciente',
                                index: widget.profissional? 10 : 9                         
                              ),
                              SizedBox(width: size.width * 15/390),
                              SignUpField(
                                controller: _complController,
                                width: 207,
                                height: 50, 
                                size: size, 
                                text: 'Adicione complemento',
                                identifierText: 'Complemento',
                                identifierWidth: 128,
                                icon: true,
                                identifierIcon: Icons.credit_card,
                                userType: widget.profissional? 'Profissional' : 'Paciente',
                                index: widget.profissional? 11 : 10                            
                              ),
                            ],
                          ),
                          SizedBox(height: size.height * 10/844),
                          Padding(
                            padding: EdgeInsets.only(
                              left: size.width * 10/390,
                              right: size.width * 219/390,
                            ),
                            child: Text(
                              'responsáveis',
                              style: GoogleFonts.poppins(
                                color: const Color.fromARGB(255, 114, 114, 114),
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(height: size.height * 10/844),
                          SignUpField(
                            controller: _nomeController,
                            width: 350, 
                            height: 50, 
                            size: size, 
                            text: 'Digite o nome do responsável',
                            identifierText: 'Nome 1',
                            identifierWidth: 79,
                            icon: true,
                            identifierIcon: Icons.person,
                            userType: 'Resp1',
                            index: 0                         
                          ),
                          SizedBox(height: size.height * 20/844),
                          Row(
                            children: [
                              SignUpField(
                                controller: _parentController,
                                width: 165, 
                                height: 50, 
                                size: size, 
                                text: 'Grau de parentesco',
                                identifierText: 'Parentesco',
                                identifierWidth: 107,
                                icon: true,
                                identifierIcon: Icons.family_restroom_rounded,
                                userType: 'Resp1',
                                index: 12
                              ),
                              SizedBox(width: size.width * 15/390),
                              SignUpField(
                                controller: _cpfController,
                                width: 170, 
                                height: 50, 
                                size: size, 
                                text: 'NNN.NNN.NNN-NN',
                                identifierText: 'CPF',
                                identifierWidth: 54.24,
                                icon: true,
                                identifierIcon: Icons.credit_card,
                                userType: 'Resp1',
                                index: 2                                 
                              ),
                            ],
                          ),
                          SizedBox(height: size.height * 20/844),
                          Row(
                            children: [
                              SignUpField(
                                controller: _rgController,
                                width: 165, 
                                height: 50, 
                                size: size, 
                                text: 'NN.NNN.NNN-N',
                                identifierText: 'RG',
                                identifierWidth: 48,
                                icon: true,
                                identifierIcon: Icons.credit_card,
                                userType: 'Resp1',
                                index: 14                              
                              ),
                              SizedBox(width: size.width * 15/390),
                              SignUpField(
                                controller: _celularController,
                                width: 170, 
                                height: 50, 
                                size: size, 
                                text: '(NN) NNNNN-NNNN',
                                identifierText: 'Celular',
                                identifierWidth: 90,
                                icon: true,
                                identifierIcon: Icons.local_phone,
                                userType: 'Resp1',
                                index: 3                               
                              ),
                            ],
                          ),
                          SizedBox(height: size.height * 20/844),
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
                            userType: 'Resp1',
                            index: 13                         
                          ),
                          SizedBox(height: size.height * 20/844),
                          Padding(
                            padding: EdgeInsets.only(
                              right: size.width * 184/390,
                            ),
                            child: SignUpField(
                              controller: _dataController,
                              width: 165, 
                              height: 50, 
                              size: size, 
                              text: 'DD/MM/AAAA',
                              identifierText: 'Nascimento',
                              identifierWidth: 115.50,
                              icon: true,
                              identifierIcon: Icons.calendar_month,
                              userType: 'Resp1',
                              index: 4                           
                            ),
                          ),
                          // Responsável 2
                          SizedBox(height: size.height * 25/844),
                          SignUpField(
                            controller: _nome2Controller,
                            width: 350, 
                            height: 50, 
                            size: size, 
                            text: 'Digite o nome do responsável',
                            identifierText: 'Nome 2',
                            identifierWidth: 80,
                            icon: true,
                            identifierIcon: Icons.person,
                            userType: 'Resp2',
                            index: 0                        
                          ),
                          SizedBox(height: size.height * 20/844),
                          Row(
                            children: [
                              SignUpField(
                                controller: _parent2Controller,
                                width: 165, 
                                height: 50, 
                                size: size, 
                                text: 'Grau de parentesco',
                                identifierText: 'Parentesco',
                                identifierWidth: 107,
                                icon: true,
                                identifierIcon: Icons.family_restroom_rounded,
                                userType: 'Resp2',
                                index: 12
                              ),
                              SizedBox(width: size.width * 15/390),
                              SignUpField(
                                controller: _cpf2Controller,
                                width: 170, 
                                height: 50, 
                                size: size, 
                                text: 'NNN.NNN.NNN-NN',
                                identifierText: 'CPF',
                                identifierWidth: 54.24,
                                icon: true,
                                identifierIcon: Icons.credit_card,
                                userType: 'Resp2',
                                index: 2                                 
                              ),
                            ],
                          ),
                          SizedBox(height: size.height * 20/844),
                          Row(
                            children: [
                              SignUpField(
                                controller: _rg2Controller,
                                width: 165, 
                                height: 50, 
                                size: size, 
                                text: 'NN.NNN.NNN-N',
                                identifierText: 'RG',
                                identifierWidth: 48,
                                icon: true,
                                identifierIcon: Icons.credit_card,
                                userType: 'Resp2',
                                index: 14                               
                              ),
                              SizedBox(width: size.width * 15/390),
                              SignUpField(
                                controller: _celular2Controller,
                                width: 170, 
                                height: 50, 
                                size: size, 
                                text: '(NN) NNNNN-NNNN',
                                identifierText: 'Celular',
                                identifierWidth: 90,
                                icon: true,
                                identifierIcon: Icons.local_phone,
                                userType: 'Resp2',
                                index: 3                               
                              ),
                            ],
                          ),
                          SizedBox(height: size.height * 20/844),
                          SignUpField(
                            controller: _email2Controller,
                            width: 350,
                            height: 50, 
                            size: size, 
                            text: 'exemplo@email.com',
                            identifierText: 'Email',
                            identifierWidth: 69,
                            icon: true,
                            identifierIcon: Icons.email_sharp,
                            userType: 'Resp2',
                            index: 13                         
                          ),
                          SizedBox(height: size.height * 20/844),
                          Padding(
                            padding: EdgeInsets.only(
                              right: size.width * 184/390,
                            ),
                            child: SignUpField(
                              controller: _data2Controller,
                              width: 165, 
                              height: 50, 
                              size: size, 
                              text: 'DD/MM/AAAA',
                              identifierText: 'Nascimento',
                              identifierWidth: 115.50,
                              icon: true,
                              identifierIcon: Icons.calendar_month,
                              userType: 'Resp2',
                              index: 4                           
                            ),
                          ),
                          SizedBox(height: size.height * 30/844),
                          InkWell(
                            onTap: () => nextData(widget.paciente, widget.profissional),
                            child: ForwardButton(
                              size: size, 
                              width: 350, 
                              height: 44, 
                              text: 'CONTINUAR',
                              continuar: true,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                if (widget.profissional)
                  Positioned(
                    top: size.height * 156/844,
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: size.width * 20/390,
                        right: size.width * 20/390,
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              left: size.width * 125/390,
                              right: size.width * 125/390,
                            ),
                            child: Image.asset('assets/images/imageAvatar.png')
                          ),
                          SizedBox(height: size.height * 20/844),
                          SignUpField(
                            controller: _bairroController,
                            width: 350, 
                            height: 50, 
                            size: size, 
                            text: 'Digite seu bairro',
                            identifierText: 'Bairro',
                            identifierWidth: 72,
                            icon: true,
                            identifierIcon: Icons.info,
                            userType: 'Profissional',
                            index: 8
                          ),
                          SizedBox(height: size.height * 20/844),
                          SignUpField(
                            controller: _logradouroController,
                            width: 350, 
                            height: 50, 
                            size: size, 
                            text: 'Digite seu logradouro',
                            identifierText: 'Logradouro',
                            identifierWidth: 110,
                            icon: true,
                            identifierIcon: Icons.info,
                            userType: 'Profissional',
                            index: 9        
                          ),
                          SizedBox(height: size.height * 20/844),
                          Row(
                            children: [
                              SignUpField(
                                controller: _numeroController,
                                width: 128, 
                                height: 50, 
                                size: size, 
                                text: 'NNNN',
                                identifierText: 'Número',
                                identifierWidth: 95,
                                icon: true,
                                identifierIcon: Icons.onetwothree,
                                userType: 'Profissional',
                                index: 10                          
                              ),
                              SizedBox(width: size.width * 15/390),
                              SignUpField(
                                controller: _complController,
                                width: 207,
                                height: 50, 
                                size: size, 
                                text: 'Adicione complemento',
                                identifierText: 'Complemento',
                                identifierWidth: 128,
                                icon: true,
                                identifierIcon: Icons.credit_card,
                                userType: 'Profissional',
                                index: 11                           
                              ),
                            ],
                          ),
                          SizedBox(height: size.height * 20/844),
                          Row(
                            children: [
                              SignUpField(
                                controller: _bancoController,
                                width: 165, 
                                height: 50, 
                                size: size, 
                                text: 'Banco',
                                identifierText: 'Banco',
                                identifierWidth: 72.86,
                                icon: false,
                                identifierImage: 'assets/images/bank.png',
                                userType: 'Profissional',
                                index: 12                          
                              ),
                              SizedBox(width: size.width * 15/390),
                              SignUpField(
                                controller: _agenciaController,
                                width: 170, 
                                height: 50, 
                                size: size, 
                                text: 'NNNN-N',
                                identifierText: 'Agência',
                                identifierWidth: 84,
                                icon: true,
                                identifierIcon: Icons.info,
                                userType: 'Profissional',
                                index: 13                          
                              ),
                            ],
                          ),
                          SizedBox(height: size.height * 20/844),
                          Row(
                            children: [
                              SignUpField(
                                controller: _contaController,
                                width: 165, 
                                height: 50, 
                                size: size, 
                                text: 'Conta bancária',
                                identifierText: 'Conta',
                                identifierWidth: 69,
                                icon: true,
                                identifierIcon: Icons.info,
                                userType: 'Profissional',
                                index: 14                          
                              ),
                              SizedBox(width: size.width * 15/390),
                              SignUpField(
                                controller: _pixController,
                                width: 170, 
                                height: 50, 
                                size: size, 
                                text: 'Chave-Pix',
                                identifierText: 'Chave-Pix',
                                identifierWidth: 99,
                                icon: true,
                                identifierIcon: Icons.info,
                                userType: 'Profissional',
                                index: 15                          
                              ),
                            ],
                          ),
                          SizedBox(height: size.height * 25/844),
                          InkWell(
                            onTap: () => nextData(widget.paciente, widget.profissional),
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
          }
        ),
      ),
    );
  }
}