import 'package:flutter/material.dart';
import 'package:myapp/screens/Detection/components/body.dart';
import 'package:myapp/screens/Detection/components/bottom_nav_bar.dart';

class DetectionScreen extends StatelessWidget {
  static const String name = 'detection_screen';
  
  const DetectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavBar(),
        backgroundColor:  Color(0xFFdee6dd),
        body: Body(),
      ),
    );
  }
}

