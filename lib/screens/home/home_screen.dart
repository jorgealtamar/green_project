import 'package:flutter/material.dart';
import 'package:myapp/screens/home/components/body.dart';
import 'package:myapp/screens/home/components/bottom_nav_bar.dart';


class HomeScreen extends StatelessWidget {
  static const String name = 'home_screen';
  
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavBar(),
        body: Body(),
      ),
    );
  }
}

