import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({
    super.key,
    this.back
  });

  final Function()? back;

  @override
  State<StatefulWidget> createState() {
    return SignUpPageState();
  }
  
}

class SignUpPageState extends State<SignUpPage> {
  
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);

    void back() {
      Navigator.pop(context);
    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: size.height * 0.2,
          leadingWidth: size.width,
          backgroundColor: const Color.fromRGBO(243, 243, 243, 1),
          leading: Padding(
            padding: EdgeInsets.only(left: size.width * 0.08),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {
                    // back();
                  },
                  icon: const Image(image: AssetImage('assets/images/back_image.png'))
                ),
                Text('Voltar', style: GoogleFonts.firaSans(fontSize: size.width * 0.05, color: const Color.fromRGBO(69, 69, 69, 1)),)
              ],
            ),
          ),
        ),
        body: Container(
          height: size.height,
          width: size.width,
          decoration: const BoxDecoration(
            color: Color.fromRGBO(243, 243, 243, 1),
          ),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: size.width * 0.2),
                    child: LinearPercentIndicator(width: size.width * 0.15,
                      percent: 1,
                      progressColor: const Color.fromRGBO(206, 231, 255, 1),
                    ),
                  ),
                  LinearPercentIndicator(width: size.width * 0.15,
                    percent: 1,
                    progressColor: const Color.fromRGBO(206, 231, 255, 1),
                  ),
                  LinearPercentIndicator(width: size.width * 0.15,
                    percent: 1,
                    progressColor: const Color.fromRGBO(215, 215, 215, 1),
                  ),
                  LinearPercentIndicator(width: size.width * 0.15,
                    percent: 1,
                    progressColor: const Color.fromRGBO(215, 215, 215, 1),
                  ),
                ],
              ),
            ],),
        ),
      ),
    );
  }
}