import 'package:flutter/material.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
        color: Colors.red,
        alignment: Alignment.center,
        child: const Text('Page 1'),
    );
  }
}