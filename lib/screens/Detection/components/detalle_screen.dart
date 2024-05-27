import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/constants.dart';
import 'package:myapp/screens/Detection/components/bottom_nav_bar.dart';
import 'package:myapp/services/firebase_service.dart';

class DetalleScreen extends StatefulWidget {
  static const String name = 'detalle_screen';
  final String? id;

  const DetalleScreen({super.key, required this.id});

  @override
  State<DetalleScreen> createState() => _DetalleScreenState();
}

class _DetalleScreenState extends State<DetalleScreen> {
  String nombre = '';
  String concepto ='';
  String imagen1 = '';
  String caneca = '';
  String imagen2 = '';
  bool isLoading= false;
  Widget? imageUrl1;
  Widget? imageUrl2;
  @override
  void initState() {
    
    super.initState();
    getResiduo(widget.id).then((data) {
        if (data != null) {
         
          setState(() {
            nombre = data['nombre'];
            concepto= data['concepto'];
            imagen1= data['imagen1'];
            caneca= data['caneca'];
            imagen2= data['imagen2'];
            isLoading= true;

          });
        }
    });
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
     List<String> conceptos = concepto.split('\n');
   
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: const BottomNavBar(),
        backgroundColor:  const Color(0xFFdee6dd),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
        body: isLoading ?
        SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: size.width,
                  height: size.height * 0.3,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.only( bottomRight: Radius.circular(20), bottomLeft: Radius.circular(20)),
                    boxShadow: [BoxShadow(
                      offset: const Offset(0, 10),
                      blurRadius: 20,
                      color: primaryColor.withOpacity(0.22)
                    )]
                  ),
                  child: Container(
                  margin: const EdgeInsets.all(15),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(25)),
                    child:  AspectRatio(
                        aspectRatio: 9/16,
                        child: Image.network(
                                imagen1,
                                fit: BoxFit.contain,
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
                ),
                const SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: SizedBox(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(nombre, textAlign: TextAlign.start, style: GoogleFonts.oswald(color: Colors.black, fontSize: 30),),
                        const SizedBox(height: 10,),
                        Text(concepto, textAlign: TextAlign.justify, style: GoogleFonts.roboto(color: Colors.black, fontSize: 18),),
                      ],
                    )
                  ),
                ),
                const SizedBox(height: 10,),
                Container(
                  margin: const EdgeInsets.only(left: 35),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(20), bottomLeft: Radius.circular(20))
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: SizedBox(
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text('Disposición', textAlign: TextAlign.start, style: GoogleFonts.oswald(color: primaryColor, fontSize: 28),),
                              const SizedBox(height: 10,),
                              Text(caneca, textAlign: TextAlign.justify, style: GoogleFonts.roboto(color: Colors.black, fontSize: 18),),
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
                                            imagen2,
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
                          )
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20,),
              ],
            ),
          )
          : const Center(child: CircularProgressIndicator(color: Colors.blue,),)
      )
    );
  }
}

