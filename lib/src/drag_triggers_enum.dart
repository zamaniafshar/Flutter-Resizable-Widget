import 'package:flutter/material.dart';
import 'package:resizable_widget/src/resizable_widget_controller.dart';

typedef DragDetailsCallback = void Function(double dx, double dy);

enum DragTriggersEnum {
  topLeft(Alignment.topLeft),
  topCenter(Alignment.topCenter),
  topRight(Alignment.topRight),
  centerLeft(Alignment.centerLeft),
  center(Alignment.center),
  centerRight(Alignment.centerRight),
  bottomLeft(Alignment.bottomLeft),
  bottomCenter(Alignment.bottomCenter),
  bottomRight(Alignment.bottomRight);

  const DragTriggersEnum(this.alignment);
  final Alignment alignment;

  DragDetailsCallback getOnDragFunction(ResizableWidgetController controller) {
    switch (this) {
      case topLeft:
        return controller.onTopLeftDrag;
      case topCenter:
        return controller.onTopCenterDrag;
      case topRight:
        return controller.onTopRightDrag;
      case centerLeft:
        return controller.onCenterLeftDrag;
      case center:
        return controller.onCenterDrag;
      case centerRight:
        return controller.onCenterRightDrag;
      case bottomLeft:
        return controller.onBottomLeftDrag;
      case bottomCenter:
        return controller.onBottomCenterDrag;
      case bottomRight:
        return controller.onBottomRightDrag;
      default:
        return controller.onCenterDrag;
    }
  }
}
