import 'package:flutter/material.dart';
import 'package:green_project/constants.dart';
import 'package:green_project/screens/Detection/components/body.dart';

class DetectionScreen extends StatelessWidget {
  const DetectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: secondColor,
      body: Body(),
    );
  }
}

