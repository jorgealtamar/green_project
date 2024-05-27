import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Color color, textColor, colorIcon;
  final VoidCallback press;
  final IconData icon;
  const RoundedButton({
    super.key, 
    required this.text, 
    required this.color, 
    required this.textColor,
    required this.press, 
    required this.icon, 
    required this.colorIcon,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width*0.8,
      child: ClipRRect(
        child: ElevatedButton.icon(
          onPressed: press,
          icon: Icon(icon, color: colorIcon,),
          style:  ElevatedButton.styleFrom(
            backgroundColor: color,
            padding: const EdgeInsets.all(15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
              
            )
          ), 
          
          label: Text(text, textAlign: TextAlign.center, style: GoogleFonts.francoisOne(fontSize: 16, color: textColor),),
        ),
      ),
    );
  }
}

