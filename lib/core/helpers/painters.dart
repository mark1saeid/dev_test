import 'package:dev_test/core/helpers/colors.dart';
import 'package:flutter/material.dart';

class WavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = mainColor.withOpacity(0.1);
    final path = Path()
      ..moveTo(0, size.height * 1.2)
      ..quadraticBezierTo(
          size.width * 0.6, size.height * 1, size.width, size.height * 1.2)
      ..lineTo(size.width, 0)
      ..lineTo(0, 0)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class WaveBackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = mainColor.withOpacity(0.05);
    final path = Path()
      ..moveTo(0, size.height * 1.5)
      ..quadraticBezierTo(
          size.width * 0.6, size.height * 1.1, size.width, size.height * 1.5)
      ..lineTo(size.width, 0)
      ..lineTo(0, 0)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
