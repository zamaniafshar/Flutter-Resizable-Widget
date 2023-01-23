import 'package:flutter/material.dart';
import 'package:resizable_widget/src/model/trigger.dart';
import 'package:resizable_widget/src/resizable_widget_controller.dart';

import 'drag_triggers_enum.dart';

class TriggerWidget extends StatefulWidget {
  late DragDetailsCallback onDrag;
  late Trigger trigger;

  TriggerWidget({
    Key? key,
    required this.onDrag,
    required this.trigger,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _TriggerWidgetState();
  }
}

class _TriggerWidgetState extends State<TriggerWidget> {
  double initX = 0;
  double initY = 0;

  void _handleDrag(DragStartDetails details) {
    initX = details.globalPosition.dx;
    initY = details.globalPosition.dy;
  }

  void _handleUpdate(DragUpdateDetails details) {
    final double dx = details.globalPosition.dx - initX;
    final double dy = details.globalPosition.dy - initY;
    initX = details.globalPosition.dx;
    initY = details.globalPosition.dy;

    widget.onDrag(dx, dy);
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: widget.trigger.alignment ?? widget.trigger.onDragType.alignment,
      child: SizedBox(
        width: widget.trigger.width,
        height: widget.trigger.height,
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onPanStart: _handleDrag,
          onPanUpdate: _handleUpdate,
          child: widget.trigger.child,
        ),
      ),
    );
  }
}
