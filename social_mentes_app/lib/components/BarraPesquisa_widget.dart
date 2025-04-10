import 'package:flutter/material.dart';

import '../common/colors.dart';

class BarraPesquisa extends StatefulWidget {
  final Function(String query) onQueryChanged;

  BarraPesquisa({required this.onQueryChanged});

  @override
  _BarraPesquisaState createState() => _BarraPesquisaState();
}


class _BarraPesquisaState extends State<BarraPesquisa> {

  @override

  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.fromLTRB((5/390) * screenWidth, (5/844) * screenHeight, (5/390) * screenWidth, 0),
      child: TextField(

        onChanged: widget.onQueryChanged,
        
        decoration: const InputDecoration(
          hintText: 'Quem você procura?',
          hintStyle: TextStyle(color: Colours.cinza2),

          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            borderSide: BorderSide(color: Colours.cinza2, width: 2),
          ),
          
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            borderSide: BorderSide(color: Colours.cinza2),
          ),

          prefixIcon: Icon(Icons.search, color: Colours.cinza2,),
        ),
      ),
    );

  }

}