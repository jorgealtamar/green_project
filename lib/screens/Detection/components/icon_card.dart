import 'package:flutter/material.dart';
import 'package:myapp/constants.dart';

class IconCard extends StatelessWidget {
  final IconData icon;
  final VoidCallback press;
  const IconCard({
    super.key, 
    required this.icon, 
    required this.press,
  });


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: size.height*0.03),
      padding: const EdgeInsets.all(20/2),
      height: 62,
      width: 62,
      decoration: BoxDecoration(
        color: const Color(0xFFF0F0F0),
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
          offset: const Offset(0,15),
          blurRadius: 22,
          color: primaryColor.withOpacity(0.22)
          ),
          const BoxShadow(
            offset: Offset(-15, -15),
            blurRadius: 20,
            color: Colors.white,
          )
        ]
      ),
      child: IconButton(
        onPressed: press, 
        icon: Icon(icon, color: primaryColor)
      )
    );
  }
}