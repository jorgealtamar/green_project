import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:myapp/constants.dart';
import 'package:myapp/screens/Info/components/body.dart';
import 'package:myapp/screens/Info/components/bottom_nav_bar.dart';

class InfoScreen extends StatelessWidget {
  static const String name = 'info_screen';
  
  const InfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar:const BottomNavBar(),
        backgroundColor: const Color(0xFFf8f6fe),
        appBar: AppBar(
          backgroundColor: primaryColor,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(BootstrapIcons.filter_left, size: 28,),
            onPressed: (){},
            ),
        ),
        body: const Body(),
        ),
      );
  }
}