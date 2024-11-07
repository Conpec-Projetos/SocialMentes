import 'package:flutter/material.dart';

final stateButtonNotifer = ValueNotifier<bool>(false);

void outWidget(){
  stateButtonNotifer.value = !stateButtonNotifer.value;
}