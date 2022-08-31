import 'package:flutter/material.dart';
import 'package:resizable_widget/src/drag_widget.dart';
import 'package:resizable_widget/src/final_size.dart';
import 'resizable_widget_controller.dart';

class ResizableWidget extends StatefulWidget {
  ResizableWidget({
    super.key,
    double? height,
    double? width,
    Offset? initialPosition,
    double minWidth = 0.0,
    double minHeight = 0.0,
    this.showDragWidgets,
    this.controller,
    required double areaHeight,
    required double areaWidth,
    required this.child,
    required this.dragWidgetsArea,
    required this.dragWidgetsList,
  }) {
    height ??= areaHeight;
    width ??= areaWidth;
    initialPosition ??= Offset(areaWidth / 2, areaHeight / 2);
    size = FinalSize(
      areaHeight: areaHeight,
      areaWidth: areaWidth,
      height: height,
      width: width,
      minHeight: minHeight,
      minWidth: minWidth,
      initialPosition: initialPosition,
    );
  }

  late final FinalSize size;
  final ResizableWidgetController? controller;
  final bool? showDragWidgets;
  final Widget child;
  final Size dragWidgetsArea;
  final List<DragWidget> dragWidgetsList;

  @override
  State<ResizableWidget> createState() => _ResizableWidgetState();
}

class _ResizableWidgetState extends State<ResizableWidget> {
  late final ResizableWidgetController controller;

  @override
  void initState() {
    print('im init state');
    controller = widget.controller ?? ResizableWidgetController();
    controller.init(finalSize: widget.size, showDragWidgets: widget.showDragWidgets);
    super.initState();
  }

  @override
  void dispose() {
    print('im dispose');
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.dragWidgetsList.length);
    for (var element in widget.dragWidgetsList) {
      print('call init');
      element.init(controller);
    }
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
              child: widget.child,
            ),
            Positioned(
              top: controller.top - widget.dragWidgetsArea.height,
              left: controller.left - widget.dragWidgetsArea.width,
              bottom: controller.bottom - widget.dragWidgetsArea.height,
              right: controller.right - widget.dragWidgetsArea.width,
              child: Visibility(
                visible: controller.showDragWidgets,
                child: Stack(
                  children: widget.dragWidgetsList,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
