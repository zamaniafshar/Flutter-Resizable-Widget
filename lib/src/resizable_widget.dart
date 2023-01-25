import 'package:flutter/material.dart';
import 'package:resizable_widget/src/model/common_sizes.dart';
import 'package:resizable_widget/src/model/trigger.dart';
import 'resizable_widget_controller.dart';
import 'trigger_widget.dart';

class ResizableWidget extends StatefulWidget {
  ResizableWidget({
    super.key,
    double? height,
    double? width,
    Offset? initialPosition,
    double minWidth = 0.0,
    double minHeight = 0.0,
    this.showDragWidgets,
    required double areaHeight,
    required double areaWidth,
    required this.child,
    required this.dragWidgetsArea,
    required this.triggersList,
  }) {
    height ??= areaHeight;
    width ??= areaWidth;
    initialPosition ??= Offset(areaWidth / 2, areaHeight / 2);
    size = CommonSizes(
      areaHeight: areaHeight,
      areaWidth: areaWidth,
      height: height,
      width: width,
      minHeight: minHeight,
      minWidth: minWidth,
      initialPosition: initialPosition,
    );
  }

  late final CommonSizes size;
  final bool? showDragWidgets;
  final Widget child;
  final Size dragWidgetsArea;
  final List<Trigger> triggersList;

  @override
  State<ResizableWidget> createState() => _ResizableWidgetState();
}

class _ResizableWidgetState extends State<ResizableWidget> {
  late final ResizableWidgetController controller;

  @override
  void initState() {
    controller = ResizableWidgetController();
    controller.init(finalSize: widget.size, showDragWidgets: widget.showDragWidgets);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      child: Stack(
        children: widget.triggersList.map(
          (trigger) {
            return TriggerWidget(
              onDrag: trigger.dragTriggerType.getOnDragFunction(controller),
              trigger: trigger,
            );
          },
        ).toList(),
      ),
      builder: (_, triggersStack) {
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
                child: triggersStack!,
              ),
            ),
          ],
        );
      },
    );
  }
}
