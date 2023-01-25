import 'package:flutter/material.dart';
import 'package:resizable_widget/resizable_widget.dart';

@immutable
class Trigger {
  late final Alignment alignment;
  final Widget child;
  final double? height;
  final double? width;
  final DragTriggersEnum dragTriggerType;

  Trigger({
    this.height,
    this.width,
    Alignment? alignment,
    required this.child,
    required this.dragTriggerType,
  }) {
    alignment = alignment ?? dragTriggerType.alignment;
  }
}
