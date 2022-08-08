import 'package:flutter/material.dart';
import 'package:resizable_widget/src/drag_distance.dart';
import 'package:resizable_widget/src/resizable_widget_controller.dart';

import 'drag_details_types.dart';

class DragWidget extends StatelessWidget {
  final Widget child;
  final double height;
  final double width;
  final DragDetailsTypes onDragType;
  late final Alignment? alignment;
  late final DragDetails onDrag;

  DragWidget({
    Key? key,
    this.alignment,
    required this.child,
    required this.onDragType,
    required this.height,
    required this.width,
  }) : super(key: key);

  void init(ResizableWidgetController controller) {
    onDrag = onDragType.getOnDragFunction(controller);
    alignment ??= onDragType.alignment;
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment!,
      child: SizedBox(
        width: width,
        height: height,
        child: DragDistance(onDrag: onDrag, child: child),
      ),
    );
  }
}
