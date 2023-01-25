import 'package:flutter/material.dart';
import 'package:resizable_widget/resizable_widget.dart';

class Trigger {
  late final Alignment alignment;
  final Widget child;
  final double? height;
  final double? width;
  final DragTriggersEnum dragTriggerType;

  Trigger({
    Alignment? alignment,
    this.height,
    this.width,
    required this.child,
    required this.dragTriggerType,
  }) {
    alignment ??= dragTriggerType.alignment;
  }
}
