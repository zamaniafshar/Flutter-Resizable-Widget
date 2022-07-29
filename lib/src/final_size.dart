import 'package:flutter/material.dart';

class FinalSize {
  FinalSize({
    required this.areaHeight,
    required this.areaWidth,
    this.minWidth = 0.0,
    this.minHeight = 0.0,
    Offset? initialPosition,
    double? height,
    double? width,
  })  : height = height ?? areaHeight,
        width = width ?? areaWidth {
    this.initialPosition = initialPosition ?? Offset(this.width / 2, this.height / 2);
  }

  final double areaHeight;
  final double areaWidth;
  final double height;
  final double width;
  final double minWidth;
  final double minHeight;
  late final Offset initialPosition;
}
