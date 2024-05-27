import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({
    super.key, required this.child,
  });



  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Positioned(
        top: 0,
        left: 0,
        child: SvgPicture.asset(
          "assets/images/top_info.svg",
          width: size.width,
          ),
        ),
        child,
      ],
    );
  }
}