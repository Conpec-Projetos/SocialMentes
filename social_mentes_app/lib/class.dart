import 'package:flutter/material.dart';
//arquivo que inicializa o estado do botão "selecionar" quando o widget sobe
final stateButtonNotifer = ValueNotifier<bool>(false);

void outWidget(){
  stateButtonNotifer.value = !stateButtonNotifer.value;
}


