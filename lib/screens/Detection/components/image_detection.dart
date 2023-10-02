import 'package:flutter/material.dart';

class ImageDetection extends StatelessWidget {
  final ImageProvider image;
  const ImageDetection({
    super.key, 
    required this.image
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Positioned(
        left: 0,
        top: 0,
        right: 0,
        child: Container(
          width: double.maxFinite,
          //double hm = screenHeight/2.41
          height: size.height/2.2,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: image,
            ),
          ),
        )
    );
  }
}