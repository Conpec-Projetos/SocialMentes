import 'package:flutter/material.dart';
import 'package:social_mentes/src/view/colors/colors.dart';

void change_Icon_container(String type_competencia) {
    if (type_competencia != "") {
      var container_image = const AssetImage("images/check_image.png");
    }
  }

  void stateArrow(bool stateArrow) {
    if (stateArrow == true) {
      var arrow_conatiner = const Color.fromRGBO(125, 185, 240, 1);
    }
  }

  void stateButton(bool state1, bool state2, bool state3, bool state4) {
    if (state1 == true) {
      bordaButton1 = const Color.fromRGBO(125, 185, 240, 1);
    } else {
      bordaButton1 = bordaButton;
    }

    if (state2 == true) {
      bordaButton2 = const Color.fromRGBO(125, 185, 240, 1);
    } else {
      bordaButton2 = bordaButton;
    }

    if (state3 == true) {
      bordaButton3 = const Color.fromRGBO(125, 185, 240, 1);
    } else {
      bordaButton3 = bordaButton;
    }

    if (state4 == true) {
      bordaButton4 = const Color.fromRGBO(125, 185, 240, 1);
    } else {
      bordaButton4 = bordaButton;
    }
  }


  

  
  
