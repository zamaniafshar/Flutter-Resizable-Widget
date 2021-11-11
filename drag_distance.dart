import 'package:flutter/material.dart';

class DragDistance extends StatefulWidget {
  const DragDistance({
    Key? key,
    required this.onDrag,
    required this.child,
  }) : super(key: key);

  final Function(double dx, double dy) onDrag;
  final Widget child;

  @override
  State<DragDistance> createState() => _DragDistanceState();
}

class _DragDistanceState extends State<DragDistance> {
  double initX = 0;

  double initY = 0;

  void _handleDrag(DragStartDetails details) {
    initX = details.globalPosition.dx;
    initY = details.globalPosition.dy;
  }

  void _handleUpdate(DragUpdateDetails details) {
    double dx = details.globalPosition.dx - initX;
    double dy = details.globalPosition.dy - initY;
    initX = details.globalPosition.dx;
    initY = details.globalPosition.dy;

    widget.onDrag(dx, dy);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onPanStart: _handleDrag,
      onPanUpdate: _handleUpdate,
      child: widget.child,
    );
  }
}
