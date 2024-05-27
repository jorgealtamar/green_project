import 'package:flutter/material.dart';
import 'package:myapp/screens/welcome/components/body.dart';

class WelcomeScreen extends StatelessWidget {
  static const String name = 'welcome_screen';
  
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(child: Scaffold(body: Body()));
  }
}