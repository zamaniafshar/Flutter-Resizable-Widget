import 'package:flutter/material.dart';
import 'package:resizable_widget/resizable_widget.dart';

class Trigger {
  Alignment? alignment;
  final Widget child;
  final double? height;
  final double? width;
  final DragTriggersEnum onDragType;

  Trigger(
      {this.alignment,
      this.height,
      this.width,
      required this.child,
      required this.onDragType}) {
    alignment ??= onDragType.alignment;
  }
}
