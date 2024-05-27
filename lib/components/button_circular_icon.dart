import 'package:flutter/material.dart';

class ButtomCircularIcon extends StatelessWidget {
  final IconData icon;
  final Color iconcolor;
  final Color backgroundcolor;
  final double sizebutton;
  final VoidCallback press;
  const ButtomCircularIcon({
    super.key, 
    required this.icon, 
    required this.iconcolor, 
    required this.backgroundcolor, 
    required this.sizebutton,
    required this.press,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: sizebutton,
      height: sizebutton,
      child: ElevatedButton(
        onPressed: press, 
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(0),
          backgroundColor: backgroundcolor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ),
        child: Icon(icon, color: iconcolor,)
      ),
    );
  }
}