import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ForwardButton extends StatefulWidget {
  final Size size;
  final double width;
  final double height;
  final String text;
  bool continuar = false;
  bool add = false;

  ForwardButton({
    super.key,
    required this.size,
    required this.width,
    required this.height,
    required this.text,
    this.continuar = false,
    this.add = false,
    });

  @override
  State<ForwardButton> createState() => _ForwardButtonState();
}

class _ForwardButtonState extends State<ForwardButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(
          left: widget.size.width * 20/390,
          right: widget.size.width * 20/390,
          top: widget.size.height * 10/844,
          bottom: widget.size.height * 10/844,
        ),
        width: widget.size.width * widget.width/390,
        height: widget.size.height * widget.height/844,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color.fromARGB(255, 139, 199, 255),Color.fromARGB(206, 80, 149, 213)],
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.text,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ), 
            SizedBox(width: widget.size.width * 10/390),
            
            if (widget.continuar)
              Image.asset('assets/images/forward.png'),
            
            if (widget.add)
              const Icon(
                Icons.add,
                color: Colors.white,
                size: 15,
              ),
            
            if ((!widget.add) && (!widget.continuar))
              const Icon(
                Icons.check,
                color: Colors.white,
                size: 15,
              ),                  
          ],
        ),
      );
  }
}