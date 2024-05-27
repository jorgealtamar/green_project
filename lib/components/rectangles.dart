import 'dart:ui' as ui;
import 'package:flutter/material.dart';

class MultiRectanglesPainter extends CustomPainter {
  final List<RectanglePainter> rectangles;

  MultiRectanglesPainter(this.rectangles);

  @override
  void paint(Canvas canvas, Size size) {
    for (var rectangle in rectangles) {
      rectangle.paint(canvas, size);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // Puedes personalizar la lógica de shouldRepaint según tus necesidades.
    // Siempre puedes devolver true para forzar una actualización.
    return false;
  }
}


class RectanglePainter extends CustomPainter{
    double left =0;
    double top = 0;
    double width = 0;
    double height =0;

    RectanglePainter( this.left,  this.top,  this.width,   this.height);
  @override
  void paint(Canvas canvas , Size size){
    final paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;
    


    final double right = left + width;  // Calcula la coordenada X del borde derecho.
    final double bottom = top + height;  // Calcula la coordenada Y del borde inferior.

    final a = Offset(size.width * left, size.height * top);       // Punto superior izquierdo.
    final b = Offset(size.width * right, size.height * bottom);  // Punto inferior derecho.

    final rect = Rect.fromPoints(a,b);

    canvas.drawRect(rect, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class ImagePainter extends CustomPainter {
  final ui.Image image;

  const ImagePainter(this.image);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    final srcRect = Rect.fromPoints(
        const Offset(0, 0), Offset(image.width.toDouble(), image.height.toDouble()));
    final dstRect = Rect.fromPoints(const Offset(0, 0), Offset(size.width, size.height));

    canvas.drawImageRect(image, srcRect, dstRect, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
