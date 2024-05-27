import 'package:flutter/material.dart';

class TextFieldContainer extends StatelessWidget {
  final Widget child;
  const TextFieldContainer({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    Size  size = MediaQuery.of(context).size;
    return Container(
      margin:const  EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 1),
      width: size.width*0.8,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        ),
        child: child,
    );
  }
}

