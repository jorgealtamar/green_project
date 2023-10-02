import 'package:flutter/material.dart';
import 'package:green_project/screens/welcome/components/body.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(child: Scaffold(body: Body()));
  }
}