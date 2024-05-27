import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class ContainerFecha extends StatelessWidget {
  const ContainerFecha({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
     margin: EdgeInsets.symmetric(horizontal: size.width*0.05),
     padding: EdgeInsets.symmetric(horizontal:size.width*0.05, vertical: 20),
     width: double.infinity,
     height: 80,
     decoration: BoxDecoration(
       color: const Color(0xFFDFF2FF),
       borderRadius: BorderRadius.circular(20)
     ),
     child: Text.rich(
       TextSpan(
         text: fecha() ,
         style: GoogleFonts.oswald(fontSize: 22, color: Colors.black, )
         )
         ),
    );
  }

  String fecha(){
    initializeDateFormatting('es'); 
    var now = DateTime.now();
    var formatter = DateFormat('MMMM d, y', 'es'); 
    String formattedDate = formatter.format(now);
    return formattedDate;
  }
}