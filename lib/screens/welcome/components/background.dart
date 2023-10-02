import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:green_project/constants.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size; // this size provide us total height and width of our screen
    return Container(
      height: size.height,
      width: double.infinity,
      color: secondColor,
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            child: SvgPicture.asset(
              "assets/images/top_welcome.svg",
              width: size.width,
              
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: SvgPicture.asset(
              "assets/images/down_welcome.svg",
              width: size.width,
              height: size.height*0.35,
            ),
          ),
          child,
        ],
        ),
      );
  }
}