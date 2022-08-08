import 'package:flutter/material.dart';
import 'package:resizable_widget/src/resizable_widget_controller.dart';

typedef DragDetails = void Function(double dx, double dy);

enum DragDetailsType {
  topLeft(Alignment.topLeft),
  topCenter(Alignment.topCenter),
  topRight(Alignment.topRight),
  centerLeft(Alignment.centerLeft),
  center(Alignment.center),
  centerRight(Alignment.centerRight),
  bottomLeft(Alignment.bottomLeft),
  bottomCenter(Alignment.bottomCenter),
  bottomRight(Alignment.bottomRight);

  const DragDetailsType(this.alignment);
  final Alignment alignment;
  static const List<DragDetailsType> types = [
    topLeft,
    topCenter,
    topRight,
    centerLeft,
    center,
    centerRight,
    bottomLeft,
    bottomCenter,
    bottomRight,
  ];

  DragDetails getOnDragFunction(ResizableWidgetController controller) {
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
    }
  }
}
