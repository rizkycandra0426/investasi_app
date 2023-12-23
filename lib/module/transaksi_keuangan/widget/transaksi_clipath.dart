import 'package:flutter/material.dart';

class TransaksiClipPathClass extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(0, 70); // Mulai dari bagian atas kiri
    path.quadraticBezierTo(
      size.width / 2,
      0,
      size.width,
      70,
    );
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
