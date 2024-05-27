import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/constants.dart';

class CardNews extends StatelessWidget {
  final String urlImage;
  final String headerNews;
  final VoidCallback press;
  const CardNews({
    super.key, 
    required this.urlImage, 
    required this.headerNews, 
    required this.press,
  });


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(
        top: 20/2,
        left: 20*2.5,
        right: 0,
        bottom: 20/2
      ),
      height: 165,
      decoration: BoxDecoration(
        color: threeColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          bottomLeft: Radius.circular(10),
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
          Container(
            width: size.width*0.3,
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
                        urlImage,
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, loadingProgress) {
                          if(loadingProgress == null) return child;
                          return Container(
                            width: size.width *0.3,
                            height: 165,
                            color: primaryColor,
                            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                            child: Center(child: CircularProgressIndicator(color: Colors.white,),)
                          );
                        },
                              ),
              ),
            ),
          ),
          Container(
            width: size.width*0.5,
            margin: const EdgeInsets.only(top:10, bottom: 10, ),
            child: Column(
              children: [
                Text(
                  headerNews, 
                  style: GoogleFonts.francoisOne(color: Colors.black, fontSize: 18),
                  maxLines: 3, // Establece el número máximo de líneas
                  overflow: TextOverflow.ellipsis, 
                ),
                const SizedBox(height: 10,),
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
          )
        ]
      ),
    );
  }
}

