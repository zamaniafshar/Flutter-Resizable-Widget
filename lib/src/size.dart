import 'package:flutter/material.dart';

class Size {
  Size({
    required this.areaHeight,
    required this.areaWidth,
    this.minWidth = 0.0,
    this.minHeight = 0.0,
    Offset? initialPosition,
    double? height,
    double? width,
  })  : height = height ?? areaHeight,
        width = width ?? areaWidth {
    initialPosition = initialPosition ?? Offset(width! / 2, height! / 2);
  }

  final double areaHeight;
  final double areaWidth;
  final double height;
  final double width;
  final double minWidth;
  final double minHeight;
  late Offset initialPosition;
}
