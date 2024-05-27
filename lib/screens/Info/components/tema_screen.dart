import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/constants.dart';
import 'package:myapp/screens/Info/components/background__tema.dart';
import 'package:myapp/screens/Info/components/detalle_card_tema.dart';
import 'package:myapp/screens/Info/components/bottom_nav_bar.dart';
import 'package:myapp/services/firebase_service.dart';

class TemaScreen extends StatefulWidget {
  static const String name = 'tema_screen';
  final String? id;

  const TemaScreen({super.key, this.id});

  @override
  State<TemaScreen> createState() => _TemaScreenState();
}

class _TemaScreenState extends State<TemaScreen> {
  String titulo='';
  String concepto='';
  String image='';
  String subconcepto='';
  List<Map<String, dynamic>> detalle = [];
  
  @override
  void initState() {
    super.initState();
    getTemaData(widget.id);
  }

  void getTemaData(String? id) async {
    Map<String, dynamic> tema = await getTemaWithId(id);
    print(id);
    print(tema);
    setState(() {
      titulo = tema['titulo'] ?? '';
      concepto = tema['concepto'] ?? '';
      image = tema['imagen'] ?? '';
      detalle = convertirDynamicList(tema['detalle']);
    });
  }

  List<Map<String, dynamic>> convertirDynamicList(List<dynamic> dynamicList) {
    return dynamicList.map((element) {
      return element as Map<String, dynamic>;
    }).toList();
  }
  
  
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: const BottomNavBar(),
        backgroundColor:  const Color(0xFFF0F0F0),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: threeColor,
          foregroundColor: Colors.black,
        ),
        body: Background(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                    width: size.width * 0.8,
                    height: 200,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: AspectRatio(
                        aspectRatio: 4 / 3,
                        child: Image.network(
                          image,
                          fit: BoxFit.fill,
                          loadingBuilder: (context, child, loadingProgress) {
                            if(loadingProgress == null) return child;
                            return Container(
                              width: size.width * 0.42,
                              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                              child: Center(child: CircularProgressIndicator(color: Colors.white,),)
                            );
                          },
                        ),
                      ),
                    ),
                ),
                Padding(
                  padding: const EdgeInsets.all(14),
                  child: SizedBox(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(titulo, textAlign: TextAlign.start, style: GoogleFonts.oswald(color: Colors.black, fontSize: 30),),
                        const SizedBox(height: 10,),
                        Text(concepto, textAlign: TextAlign.justify, style: GoogleFonts.roboto(color: Colors.black, fontSize: 18),),
                      ],
                    ),
                  ),
                ),
                detalle.isNotEmpty ?
                Container(
                  margin: EdgeInsets.only(left: 30),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0,10),
                        blurRadius: 30,
                        color: primaryColor.withOpacity(0.29)
                      )
                    ],
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(20), bottomLeft: Radius.circular(20))
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: SizedBox(
                          width: double.infinity,
                          child: Column(
                            children: [
                              for (var item in detalle)
                              DetalleCardTema(
                                subtitulo: item['subtitulo'] ?? '',
                                subconcepto: item['subconcepto'] ?? '',
                                subImagen: item['subimagen'] ?? '',
                              ),
                            ],
                          )
                        ),
                      ),
                    ],
                  ),
                )
                : Container(),
                SizedBox(height: 20,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

