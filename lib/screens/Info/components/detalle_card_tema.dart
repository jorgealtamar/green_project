import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/constants.dart';

class DetalleCardTema extends StatelessWidget {
  final String subtitulo;
  final String subImagen;
  final String subconcepto;
  const DetalleCardTema({
    super.key,
    required this.subconcepto,
    required this.subtitulo, 
    required this.subImagen,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(subtitulo, textAlign: TextAlign.start, style: GoogleFonts.oswald(color: primaryColor, fontSize: 28),),
          const SizedBox(height: 10,),
          Text(subconcepto, textAlign: TextAlign.justify, style: GoogleFonts.roboto(color: Colors.black, fontSize: 18),),
          const SizedBox(height: 10,),
            Container(
            width: size.width*0.5,
            margin: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child:  AspectRatio(
                aspectRatio: 9/16,
                child: Image.network(
                        subImagen,
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, loadingProgress) {
                          if(loadingProgress == null) return child;
                          return Container(
                            width: size.width *0.5,
                            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                            child: const Center(child: CircularProgressIndicator(color: Colors.blue),)
                          );
                        },
                              ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

