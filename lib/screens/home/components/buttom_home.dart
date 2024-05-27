import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtomHome extends StatelessWidget {
  final Color colorButtom;
  final String path;
  final String  msg;
  final VoidCallback press;

  const ButtomHome({
    super.key,
    required this.colorButtom, 
    required this.path, 
    required this.msg,
    required this.press
  });


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
     width: size.width*0.9,
      child: ElevatedButton(
         onPressed: press,
         style: ElevatedButton.styleFrom(
           backgroundColor: colorButtom,
           shape: RoundedRectangleBorder(
             borderRadius: BorderRadius.circular(20),
           ),
           padding: EdgeInsets.symmetric(horizontal: size.width * 0.05, vertical: 20),
         ),
         child: Row(
           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
           children: [
            Image.asset(path, width: size.width*0.2,),
             Expanded(
               child: Text(
                 msg,
                 textAlign: TextAlign.center,
                 style: GoogleFonts.oswald(fontSize: 25, fontWeight: FontWeight.w300, color: Colors.black),
               ),
             ),
           ],
         ),
       ),
    );
  }
}
