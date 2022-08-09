import 'package:flutter/material.dart';
import 'package:resizable_widget/src/drag_widget.dart';
import 'resizable_widget_controller.dart';

class ResizableWidget extends StatelessWidget {
  ResizableWidget({
    Key? key,
    required this.child,
    required this.controller,
    required this.dragWidgetsArea,
    required this.dragWidgetsList,
  }) {
    for (var element in dragWidgetsList) {
      element.init(controller);
    }
  }

  final Widget child;
  final ResizableWidgetController controller;
  final Size dragWidgetsArea;
  final List<DragWidget> dragWidgetsList;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: controller,
      builder: (_, __, ___) {
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
              top: controller.top - dragWidgetsArea.height / 2,
              left: controller.left - dragWidgetsArea.width / 2,
              bottom: controller.bottom - dragWidgetsArea.height / 2,
              right: controller.right - dragWidgetsArea.width / 2,
              child: Visibility(
                visible: controller.showDragWidgets,
                child: Stack(
                  children: dragWidgetsList,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
