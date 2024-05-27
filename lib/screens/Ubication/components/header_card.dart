import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeaderCard extends StatelessWidget {
  final String path;
  final String tittle;

  const HeaderCard({
    super.key, required this.path, required this.tittle,
  });


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(path, width: size.width*0.1,),
        SizedBox(width: size.width*0.03,),
        Text(
            tittle,
            textAlign: TextAlign.center,
            style: GoogleFonts.oswald(fontSize: 25, fontWeight: FontWeight.w400, color: Colors.black),
        ),
        
      ],
    );
  }
}