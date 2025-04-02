import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:social_mentes/models/userPaciente.dart';
import 'package:social_mentes/models/userProfissional.dart';
import 'package:social_mentes/src/view/models/validacao.dart';
import 'package:provider/provider.dart';

class SignUpField extends StatefulWidget {
  final double width;
  final double height;
  final double identifierWidth;
  final Size size;
  final String text;
  final String identifierText;
  IconData identifierIcon;
  String identifierImage;
  bool icon;
  final TextEditingController controller;
  final String userType;
  final int index;

  SignUpField({
    super.key,
    required this.width,        
    required this.height,        
    required this.identifierWidth,    
    required this.size,    
    required this.text,    
    required this.identifierText,    
    this.icon = false,    
    this.identifierIcon = Icons.skateboarding,    
    this.identifierImage = '',    
    required this.controller,    
    this.userType = '',    
    this.index = 0,    
    });

  @override
  State<SignUpField> createState() => _SignUpFieldState();
}

class _SignUpFieldState extends State<SignUpField> {
  bool typing = false;
  bool done = false;
  bool isEmpty = true;
  String? _logradouro;
  String? _cidade;
  String? _uf;
  String? _bairro;

  @override
  void initState() {
    super.initState();
    widget.controller.text = _getInitialValue();
    widget.controller.addListener(_updateData);
  }

  Future<void> validarInfos() async {
    final String info = widget.controller.text;
    if (widget.identifierText == 'CPF') {
      if (!Validacao.validarCpf(info)) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('CPF inválido')),
        );
      }
    } else if (widget.identifierText == 'Nome completo' || widget.identifierText == 'Nome da criança' || 
      widget.identifierText == 'Nome do responsável' || widget.identifierText == 'Nome 1' || widget.identifierText == 'Nome 2') {
        if (!Validacao.validarNome(info)) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Nome inválido')),
          );
        }
    } else if (widget.identifierText == 'Chave-pix') {
        if (!Validacao.validarChavePix(info)) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Chave-pix inválida')),
          );
        }
    } else if (widget.identifierText == 'Celular') {
        if (!Validacao.validarCelular(info)) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Celular inválido')),
          );
        }
    } else if (widget.identifierText == 'Email') {
        if (!Validacao.validarEmail(info)) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Email inválido')),
          );
        }
    }
  }

  Future<void> _buscarCep() async {
    final String cep = widget.controller.text;
    final userData = Provider.of<UserPaciente>(context, listen: false);
    final profiData = Provider.of<UserProfissional>(context, listen: false);
    if (Validacao.validarCep(cep)) {
      final Map<String, dynamic>? dadosCep = await Validacao.verificarCepExistente(cep);
      if (dadosCep != null) {
        setState(() {
          if (widget.userType == 'Paciente') {
          // Salvando os dados para o paciente
          userData.setLogradouro(dadosCep['logradouro']);
          userData.setBairro(dadosCep['bairro']); 
          userData.setCidade(dadosCep['localidade']);
          userData.setUf(dadosCep['uf']);
          } else if (widget.userType == 'Profissional') {
          // Salvando os dados para o profissional
          profiData.setCidade(dadosCep['localidade']);
          profiData.setLogradouro(dadosCep['logradouro']); 
          profiData.setUf(dadosCep['uf']);
          profiData.setBairro(dadosCep['bairro']);
          }
        });
      } else {
        setState(() {
          if (widget.userType == 'Paciente') {
          // Salvando os dados para o paciente
          userData.setLogradouro('nome');
          userData.setBairro('nome'); 
          userData.setCidade('nome');
          userData.setUf('nome'); 
          } else if (widget.userType == 'Profissional') {
          // Salvando os dados para o profissional
          profiData.setCidade('nome');
          profiData.setLogradouro('nome'); 
          profiData.setUf('nome');
          profiData.setBairro('nome');
          }
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('CEP não encontrado')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('CEP inválido')),
      );
    }
  }

  String _getInitialValue() {
    final userData = Provider.of<UserPaciente>(context, listen: false);
    final userProf = Provider.of<UserProfissional>(context, listen: false);
    if (widget.userType == 'Paciente' || widget.userType == 'Resp1' || widget.userType == 'Resp2') {
      return userData.fetchValue(widget.userType, widget.index) == 'nome' ? '' : userData.fetchValue(widget.userType, widget.index);
    } else if (widget.userType == 'Profissional') {
      return userProf.fetchValue(widget.index) == 'nome' ? '' : userProf.fetchValue(widget.index);
    }
    return '';
  }

  void _updateData() {
    if (widget.userType == 'Paciente' || widget.userType == 'Resp1' || widget.userType == 'Resp2') {
      final userData = Provider.of<UserPaciente>(context, listen: false);
      userData.updatePaciente(widget.userType, widget.index, widget.controller.text);
    } else if (widget.userType == 'Profissional') {
      final userData = Provider.of<UserProfissional>(context, listen: false);
      userData.updateProfissional(widget.index, widget.controller.text);
    } 
  }

  void _checkIfEmpty() {
    setState(() {
      isEmpty = widget.controller.text.isEmpty;
    });
  }

  @override
  void dispose() {
    widget.controller.removeListener(_updateData);
    widget.controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: 59,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: widget.size.width * widget.width/390,
            height: widget.size.height * widget.height/844,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: typing
                ? Border.all(
                    color:const Color.fromARGB(255, 125, 185, 240),
                    strokeAlign: BorderSide.strokeAlignOutside,
                )
                : Border.all(
                    color: (done || (_getInitialValue() != ''))
                    ? const Color.fromARGB(255, 80, 149, 213)
                    : const Color.fromARGB(255, 114, 114, 114),
                )
              ),
            child: TextField(
              controller: widget.controller,
              onChanged: (value) {
                setState(() {
                  typing = true;
                  done = false;
                  isEmpty = value.isEmpty;
                });
              },
              onSubmitted: (value) {
                setState(() {
                  done = !isEmpty;
                  typing = false;
                  if (widget.identifierText == 'CEP') {
                    _buscarCep();
                  } else {
                    validarInfos();
                  }
                });
              },
              style: GoogleFonts.firaSans(
                  color: const Color.fromARGB(255, 171, 171, 171),
              ),
              decoration: InputDecoration(
                hintText: widget.text,
                hintStyle: GoogleFonts.firaSans(
                  fontStyle: FontStyle.italic,
                  color: const Color.fromARGB(255, 171, 171, 171),
                ),
                contentPadding: const EdgeInsets.only(left: 15),
                border: InputBorder.none,
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                ),
              ),
            ),
          ),
          Positioned(
            top: -10,
            left: 20,
            child: Container(
              width:  widget.size.width * widget.identifierWidth/390,
              height: widget.size.height * 19/844,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              padding: EdgeInsets.only(
                left: widget.size.width * 5/390,
                right: widget.size.width * 5/390,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  (widget.icon) 
                  ? Icon(
                      widget.identifierIcon,
                      color: (typing || done || (_getInitialValue() != ''))
                      ? const Color.fromARGB(255, 80, 149, 213)
                      : const Color.fromARGB(255, 114, 114, 114),
                      size: 15,
                  )
                  : (typing || done || (_getInitialValue() != ''))
                  ? Image.asset(widget.identifierImage, color: const Color.fromARGB(255, 80, 149, 213))
                  : Image.asset(widget.identifierImage),
                  SizedBox(width: widget.size.width * 5/390),
                  Text(
                    widget.identifierText,
                    style: GoogleFonts.firaSans(
                      color: (typing || done || (_getInitialValue() != '')) 
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
    );
  }
}