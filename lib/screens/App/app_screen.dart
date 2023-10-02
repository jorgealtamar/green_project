import 'package:flutter/material.dart';
import 'package:green_project/components/bottom_navigator_bar.dart';

class AppScreen extends StatelessWidget {
  const AppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea( 
      child: Scaffold(
        body:  NavigationBarApp()
      )
    );
  }
}