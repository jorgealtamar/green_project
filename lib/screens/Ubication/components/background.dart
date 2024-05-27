import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myapp/constants.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({
    super.key, required this.child,
  });


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        height: size.height,
        width: double.infinity,
        color: primaryColor,
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 0,
              left: 0,
              child: SvgPicture.asset(
                "assets/images/top_ubication.svg",
                width: size.width,
              ),
            ),
            child,
          ],
        ),
      );
  }
}