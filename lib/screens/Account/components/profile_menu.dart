import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/constants.dart';

class ProfileMenu extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback press;
  const ProfileMenu({
    super.key, required this.text, required this.icon, required this.press,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextButton(
        onPressed: press,
        style: ButtonStyle(
                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(const EdgeInsets.all(20)),
                backgroundColor: const MaterialStatePropertyAll(primaryColor),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  )
                )
              ),
        child: Row(
          children: [
            Icon(icon, color: Colors.white, size: 30,),
            const SizedBox(width: 20,),
            Expanded(child: Text(text, style: GoogleFonts.francoisOne(color: Colors.white, fontSize: 20),)),
            const Icon(BootstrapIcons.chevron_right, color: Colors.white,)
          ],
          ),
      
      ),
    );
  }
}

