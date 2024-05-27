import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/constants.dart';

class TittleWithBtn extends StatelessWidget {
  final String tittle;
  final VoidCallback press;
  const TittleWithBtn({
    super.key, required this.tittle, required this.press,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          TittleWithCustomUnderline( text: tittle,),
          const Spacer(),
          TextButton(
            style: ButtonStyle(
              backgroundColor: const MaterialStatePropertyAll(primaryColor),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                )
            )
            ),
          
            onPressed: press,
            child: Text('Más', style: GoogleFonts.roboto(fontSize: 18,color: Colors.white),)
          )
        ],
      ),
    );
  }
}

class TittleWithCustomUnderline extends StatelessWidget {
  final String text;
  const TittleWithCustomUnderline({
    super.key, required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 24,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20/4),
            child: Text(text, style: GoogleFonts.roboto(fontSize: 20, fontWeight: FontWeight.bold),),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              margin: const EdgeInsets.only(right: 20/4),
              height: 7,
              color: primaryColor.withOpacity(0.2),
            ),
          )
        ],
      ),
    );
  }
}



