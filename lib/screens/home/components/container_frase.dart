import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ContainerFrase extends StatelessWidget {
  const ContainerFrase({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
     margin: EdgeInsets.symmetric(horizontal: size.width*0.05),
     padding: EdgeInsets.symmetric(horizontal:size.width*0.05, vertical: 20),
     width: double.infinity,
     height: size.height*0.32,
     decoration: BoxDecoration(
       color: const Color(0xFF8EC9EA),
       borderRadius: BorderRadius.circular(20)
     ),
     child: Text.rich(
         TextSpan(
           text: '“Enseñar a cuidar el medio ambiente es enseñar a valorar la vida”.\n' ,
           style: GoogleFonts.francoisOne(fontSize: 30, color: const Color(0xFF03053D), ),
           children: [
             TextSpan(
               text: "- Anónimo",
               style: GoogleFonts.francoisOne(fontSize: 22, color: const Color(0xFF03053D), ),
             )
           ]
         ),
       ),
    );
  }
}