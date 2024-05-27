import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/constants.dart';
import 'package:myapp/screens/welcome/components/background.dart';


class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: size.height*0.08,),
            SizedBox( width: size.width*0.2, height: size.height*0.2, child: Image.asset("assets/icons/logo_white.png")),
            Container(
              alignment: Alignment.center,
              child: Text('GREEN TECH', style: GoogleFonts.roboto(fontSize: 35, color: Colors.white, fontWeight: FontWeight.w300)),
            ),
            SizedBox(height: size.height*0.090,),
            Padding(
              padding: const EdgeInsets.all(30),
              child: Text('"Sé el cambio que quieres ver en el mundo."', textAlign: TextAlign.center, style: GoogleFonts.oswald(fontSize: 30, color: Colors.black, fontWeight: FontWeight.w400)), 
            ),
            Text('- Mahatma Gandhi', textAlign: TextAlign.center, style: GoogleFonts.oswald(fontSize: 22, color: Colors.black, fontWeight: FontWeight.w400)),
            SizedBox(height: size.height*0.04,),
            ElevatedButton(
              onPressed: (){context.push('/login');},
              style:  ElevatedButton.styleFrom(
                backgroundColor: fourColor,
                padding: const EdgeInsets.all(15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)
                )
              ),
              child: const Icon(Icons.arrow_forward, size: 25,) 
            ),
          ]
        ),
      ),
      );
  }
}

