import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'drag_distance.dart';
import 'resizable_widget_controller.dart';

class ResizableWidget extends StatelessWidget {
  const ResizableWidget({
    super.key,
    required this.child,
    required this.controller,
    required this.dragWidget,
    required this.dragWidgetHeight,
    required this.dragWidgetWidth,
  });

  final ResizableWidgetController controller;
  final Widget child;
  final Widget dragWidget;
  final double dragWidgetHeight;
  final double dragWidgetWidth;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ResizableWidgetController>(
      global: false,
      init: controller,
      builder: (controller) {
        return Stack(
          children: <Widget>[
            Positioned(
              top: controller.top,
              left: controller.left,
              bottom: controller.bottom,
              right: controller.right,
              child: child,
            ),
            Positioned(
              top: controller.top - dragWidgetHeight / 2,
              left: controller.left - dragWidgetWidth / 2,
              bottom: controller.bottom - dragWidgetHeight / 2,
              right: controller.right - dragWidgetWidth / 2,
              child: Visibility(
                visible: controller.showDragWidgets,
                child: Stack(
                  children: [
                    // top left
                    Align(
                      alignment: Alignment.topLeft,
                      child: DragDistance(
                        onDrag: controller.onTopLeftDrag,
                        child: dragWidget,
                      ),
                    ),
                    // top center
                    Align(
                      alignment: Alignment.topCenter,
                      child: DragDistance(
                        onDrag: controller.onTopCenterDrag,
                        child: dragWidget,
                      ),
                    ),
                    // top right
                    Align(
                      alignment: Alignment.topRight,
                      child: DragDistance(
                        onDrag: controller.onTopRightDrag,
                        child: dragWidget,
                      ),
                    ),
                    // center left
                    Align(
                      alignment: Alignment.centerLeft,
                      child: DragDistance(
                        onDrag: controller.onCenterLeftDrag,
                        child: dragWidget,
                      ),
                    ),
                    // center
                    Align(
                      alignment: Alignment.center,
                      child: DragDistance(
                        onDrag: controller.onCenterDrag,
                        child: dragWidget,
                      ),
                    ),
                    // center right
                    Align(
                      alignment: Alignment.centerRight,
                      child: DragDistance(
                        onDrag: controller.onCenterRightDrag,
                        child: dragWidget,
                      ),
                    ),
                    // bottom left
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: DragDistance(
                        onDrag: controller.onBottomLeftDrag,
                        child: dragWidget,
                      ),
                    ),
                    // bottom center
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: DragDistance(
                        onDrag: controller.onBottomCenterDrag,
                        child: dragWidget,
                      ),
                    ),
                    // bottom right
                    Align(
                      alignment: Alignment.bottomRight,
                      child: DragDistance(
                        onDrag: controller.onBottomRightDrag,
                        child: dragWidget,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
