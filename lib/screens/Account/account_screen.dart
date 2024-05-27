import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/screens/Account/components/body.dart';
import 'package:myapp/screens/Account/components/bottom_nav_bar.dart';

class AccountScreen extends StatelessWidget {
  static const String name = 'account_screen';
  
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFdee6dd),
        bottomNavigationBar: const BottomNavBar(),
        appBar: AppBar(
          title: const Text('Perfil'),
          centerTitle: true,
          backgroundColor: const Color(0xFFdee6dd),
          elevation: 0,
          titleTextStyle: GoogleFonts.francoisOne(color: Colors.black, fontSize: 23),
        ),
        body: const Body(),
      ),
    );
  }
}

