import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/components/rounded_button.dart';
import 'package:myapp/constants.dart';

class ResultDetection extends StatelessWidget {
  const ResultDetection({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Positioned(
        left: 0,
        right: 0,
        //top:(size.height/2.41)-30 ,
        bottom: 0,
        child: Container(
          height: 345,
          //margin: EdgeInsets.only(top: (size.height/2.41)-50 ),
          padding: EdgeInsets.only(left: 30, right: 30 , top: size.height*0.03,),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
              ),
            color: primaryColor,
          ),
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Resultados', style: GoogleFonts.francoisOne(color: Colors.white, fontSize: 30),),
              SizedBox(height: size.height*0.03,),
              Text('Se reconoció un residuo aprovechable de material plástico.', style: GoogleFonts.francoisOne(color: Colors.white, fontSize: 16),),
              SizedBox(height: size.height*0.03,),
              RoundedButton(text: 'Buscar caneca', color: secondColor, textColor: Colors.black, press: (){}, icon: BootstrapIcons.arrow_right , colorIcon: Colors.black),
              SizedBox(height: size.height*0.03,),
              RoundedButton(text: 'Aprende más de este residuo', color: secondColor, textColor: Colors.black, press: (){}, icon: BootstrapIcons.arrow_right , colorIcon: Colors.black),
              SizedBox(height: size.height*0.05,),
            ]
          ) ,
        ),
      );
  }
}