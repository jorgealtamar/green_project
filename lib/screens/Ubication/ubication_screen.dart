import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/components/rounded_button.dart';
import 'package:myapp/screens/Ubication/components/background.dart';
import 'package:myapp/screens/Ubication/components/header_card.dart';
import 'package:myapp/screens/Ubication/components/bottom_nav_bar.dart';

class UbicationScreen extends StatefulWidget {
  static const String name = 'ubication_screen';
  
  const UbicationScreen({super.key});

  @override
  State<UbicationScreen> createState() => _UbicationScreenState();
}

class _UbicationScreenState extends State<UbicationScreen> {
  String _dropdownValue = 'Blanco';
  String _dropdownValue2 = 'No Peligrosos';
  String _dropdownValue3 = 'Plástico';
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: const BottomNavBar(),
        body: Background(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: size.height*0.03,),
                Container(
                  alignment: Alignment.center,
                  child: Text('Reciclaje', style: GoogleFonts.oswald(fontSize: 40, color: Colors.black, fontWeight: FontWeight.w500)),
                ),
                SizedBox(height: size.height*0.03,),
                Container(
                  height: 250,
                  width: size.width*0.9,
                  padding: EdgeInsets.symmetric(horizontal:size.width*0.05, vertical: 20),
                 decoration: BoxDecoration(
                    color: const Color(0xFFE2E8E4),
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: Column(
                    children: [
                      const HeaderCard(
                        path: 'assets/images/colorcaneca.png',
                        tittle: 'Color de la caneca',
                      ),
                      SizedBox(height: size.height*0.03,),
                      Container(
                        width: size.width*0.8,
                        height: 50,
                        padding: EdgeInsets.symmetric(horizontal:size.width*0.05),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          ),
                        child: DropdownButton<String>(
                          items: const [
                            DropdownMenuItem(value: 'Blanco',child: Text('Blanco'),),
                            DropdownMenuItem(value: 'Negro',child: Text('Negro'),),
                            DropdownMenuItem(value: 'Verde',child: Text('Verde'),),
                            DropdownMenuItem(value: 'Rojo',child: Text('Rojo'),),
                          ], 
                          onChanged: dropdownCallBack,
                          value: _dropdownValue,
                          dropdownColor: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          isExpanded: true,
                          underline: Container(),
                        ),
                      ),
                      SizedBox(height: size.height*0.02,),
                      RoundedButton(
                        text: 'Buscar', 
                        color: const Color(0xFFEFAF4C), 
                        textColor: Colors.white, 
                        press: (){}, 
                        icon: Icons.search, 
                        colorIcon: Colors.white,
                      )
                    ]
                    ),
                ),
                SizedBox(height: size.height*0.03,),
                Container(
                  height: 320,
                  width: size.width*0.9,
                  padding: EdgeInsets.symmetric(horizontal:size.width*0.05, vertical: 20),
                 decoration: BoxDecoration(
                    color: const Color(0xFFE2E8E4),
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: Column(
                    children: [
                      const HeaderCard(
                        path: 'assets/images/plastico.png',
                        tittle: 'Residuo Sólido',
                      ),
                      SizedBox(height: size.height*0.03,),
                      Container(
                        width: size.width*0.8,
                        height: 50,
                        padding: EdgeInsets.symmetric(horizontal:size.width*0.05),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          ),
                        child: DropdownButton<String>(
                          items: const [
                            DropdownMenuItem(value: 'Peligrosos',child: Text('Peligrosos'),),
                            DropdownMenuItem(value: 'No Peligrosos',child: Text('No Peligrosos'),),
                            DropdownMenuItem(value: 'Especiales',child: Text('Especiales'),),
                          ], 
                          onChanged: dropdownCallBack2,
                          value: _dropdownValue2,
                          dropdownColor: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          isExpanded: true,
                          underline: Container(),
                        ),
                      ),
                      SizedBox(height: size.height*0.02,),
                      Container(
                        width: size.width*0.8,
                        height: 50,
                        padding: EdgeInsets.symmetric(horizontal:size.width*0.05),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          ),
                        child: DropdownButton<String>(
                          items: const [
                            DropdownMenuItem(value: 'Plástico',child: Text('Plástico'),),
                            DropdownMenuItem(value: 'Papel',child: Text('Papel'),),
                            DropdownMenuItem(value: 'Cartón',child: Text('Cartón'),),
                          ], 
                          onChanged: dropdownCallBack3,
                          value: _dropdownValue3,
                          dropdownColor: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          isExpanded: true,
                          underline: Container(),
                        ),
                      ),
                      SizedBox(height: size.height*0.02,),
                      RoundedButton(
                        text: 'Buscar', 
                        color: const Color(0xFFEFAF4C), 
                        textColor: Colors.white, 
                        press: (){}, 
                        icon: Icons.search, 
                        colorIcon: Colors.white,
                      ),
                     
                    ]
                    ),
                ),
                  SizedBox(height: size.height*0.02,),
              ],
            )
          ) ,
        ),
      ),
    );
  }

  void dropdownCallBack(String? selectedValue){
    if(selectedValue is String){
      setState((){
        _dropdownValue = selectedValue;
      });
    }

  }

  void dropdownCallBack2(String? selectedValue){
    if(selectedValue is String){
      setState((){
        _dropdownValue2 = selectedValue;
      });
    }

  }

  void dropdownCallBack3(String? selectedValue){
    if(selectedValue is String){
      setState((){
        _dropdownValue3 = selectedValue;
      });
    }

  }
}



