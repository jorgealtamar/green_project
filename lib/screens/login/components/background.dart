import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myapp/constants.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({
    super.key,
    required this.child,
  });



  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height,
      color: secondColor,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top:0,
            right: 0,
            child: SvgPicture.asset(
            'assets/images/top_login.svg',
             width: size.width,
            )
          ),
          child,
        ],
      ),
    );
  }
}