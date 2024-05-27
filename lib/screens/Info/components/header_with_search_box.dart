import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/constants.dart';

class HeaderWithSearchBox extends StatelessWidget {
  const HeaderWithSearchBox({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(bottom: 20*2.5),
      height: size.height*0.2,
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 56),
            height: size.height*0.2 -27,
            decoration: const BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(36),
                bottomRight: Radius.circular(36),
                )
            ),
            child: Row(
              children: [
                Text('GREEN TECH', style: GoogleFonts.roboto(fontSize: 28, color: Colors.white, fontWeight: FontWeight.w300)),
                const Spacer(),
                Image.asset("assets/icons/logo_white.png", width: size.width*0.13,),
            ]
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0, 
            left: 0,
            child: Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              height: 54,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 10),
                    blurRadius: 50,
                    color: primaryColor.withOpacity(0.23),
                  )
                ]
              ),
              child: TextField(
                onChanged: (value){},
                decoration: InputDecoration(
                  hintText: "Buscar",
                  hintStyle: GoogleFonts.francoisOne(color: primaryColor.withOpacity(0.5), fontSize: 18),
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  suffixIcon: const Icon(BootstrapIcons.search, color: primaryColor,)
                ),
              ),
            ),
            
          ),
        ],
      ),
    );
  }
}