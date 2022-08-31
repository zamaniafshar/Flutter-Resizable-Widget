import 'package:flutter/material.dart';
import 'package:resizable_widget/src/drag_distance.dart';
import 'package:resizable_widget/src/resizable_widget_controller.dart';

import 'drag_details_types.dart';

class DragWidget extends StatelessWidget {
  final Alignment? alignment;
  final Widget child;
  final double height;
  final double width;
  final DragDetailsTypes onDragType;
  late DragDetails onDrag;

  DragWidget({
    Key? key,
    this.alignment,
    required this.child,
    required this.onDragType,
    required this.height,
    required this.width,
  }) : super(key: key) {
    print('new object');
  }

  void init(ResizableWidgetController controller) {
    onDrag = onDragType.getOnDragFunction(controller);
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment ?? onDragType.alignment,
      child: SizedBox(
        width: width,
        height: height,
        child: DragDistance(onDrag: onDrag, child: child),
      ),
    );
  }
}
