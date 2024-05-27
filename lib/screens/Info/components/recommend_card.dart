import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/constants.dart';

class RecommendGreenCard extends StatelessWidget {
  final String tittle;
  final VoidCallback press;
  final String urlImage;
  
  const RecommendGreenCard({
    super.key,
    required this.tittle,
    required this.press,
    required this.urlImage, 
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.42,
      margin: const EdgeInsets.only(left: 20, top: 20 / 2, bottom: 20 * 2.5),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10.0),
              topRight: Radius.circular(10.0),
            ),
            child: AspectRatio(
              aspectRatio: 4 / 3,
              child: Image.network(
                urlImage,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if(loadingProgress == null) return child;
                  return Container(
                    width: size.width *0.42,
                    //height: 150,
                    color: primaryColor,
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    child: Center(child: CircularProgressIndicator(color: Colors.white,),)
                  );
                },
              ),
            ),
          ),
          GestureDetector(
            onTap: press,
            child: Container(
              padding: const EdgeInsets.all(20 / 2),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 10),
                    blurRadius: 50,
                    color: primaryColor.withOpacity(0.23),
                  )
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(tittle, textAlign: TextAlign.center, style: GoogleFonts.roboto(color: Colors.black, fontSize: 16),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
