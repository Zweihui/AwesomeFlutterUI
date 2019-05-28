import 'package:flutter/material.dart';

class TriangleClipper extends CustomClipper<Path> {

  final triangleDirection;
  final beginPercent; //起始便宜量

  TriangleClipper(this.triangleDirection,{this.beginPercent = 0.0});


  @override
  Path getClip(Size size) {
    final path = Path();
    switch(triangleDirection){
      case TriangleDirection.up:
        path.moveTo(0, size.height);
        path.lineTo(size.width, size.height);
        path.lineTo(size.width / 2, 0);
        path.close();
        break;
      case TriangleDirection.down:
        path.lineTo(size.width, 0);
        path.lineTo(size.width / 2, size.height);
        path.close();
        break;
      case TriangleDirection.left:
        path.moveTo(size.width, 0);
        path.lineTo(size.width, size.height);
        path.lineTo(0, size.height / 2);
        path.close();
        break;
      case TriangleDirection.right:
        path.moveTo(beginPercent*size.width, 0);
        path.lineTo(beginPercent*size.width, size.height);
        path.lineTo(size.width, size.height / 2);
        path.close();
        break;
      default:
        path.moveTo(0, size.height);
        path.lineTo(size.width, size.height);
        path.lineTo(size.width / 2, 0);
        path.close();
        break;
    }
    return path;
  }

  @override
  bool shouldReclip(TriangleClipper oldClipper) => false;
}

enum TriangleDirection {
  up,
  down,
  left,
  right
}