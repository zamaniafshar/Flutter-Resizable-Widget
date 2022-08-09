import 'package:flutter/material.dart';
import 'package:resizable_widget/src/drag_widget.dart';
import 'package:resizable_widget/src/final_size.dart';
import 'resizable_widget_controller.dart';

class ResizableWidget extends StatelessWidget {
  ResizableWidget({
    super.key,
    ResizableWidgetController? controller,
    bool? showDragWidgets,
    double? height,
    double? width,
    Offset? initialPosition,
    double minWidth = 0.0,
    double minHeight = 0.0,
    required double areaHeight,
    required double areaWidth,
    required this.child,
    required this.dragWidgetsArea,
    required this.dragWidgetsList,
  }) {
    height ??= areaHeight;
    width ??= areaWidth;
    initialPosition ??= Offset(width / 2, height / 2);
    FinalSize finalSize = FinalSize(
      areaHeight: areaHeight,
      areaWidth: areaWidth,
      height: height,
      width: width,
      minHeight: minHeight,
      minWidth: minWidth,
      initialPosition: initialPosition,
    );
    this.controller = controller ?? ResizableWidgetController();
    this.controller.init(finalSize: finalSize, showDragWidgets: showDragWidgets);
    for (var element in dragWidgetsList) {
      element.init(this.controller);
    }
  }

  late final ResizableWidgetController controller;
  final Widget child;
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
