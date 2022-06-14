import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ResizableWidgetController extends GetxController {
  ResizableWidgetController({
    required this.initialPosition,
    required this.areaHeight,
    required this.areaWidth,
    required this.height,
    required this.width,
    this.minWidth = 0.0,
    this.minHeight = 0.0,
    this.showDragWidgets = true,
  });

  @override
  void onInit() {
    final double newTop = initialPosition.dy - height / 2;
    final double newBottom = areaHeight - height - newTop;
    final double newLeft = initialPosition.dx - (width / 2);
    final double newRight = (areaWidth - width) - newLeft;

    // init top&bottom
    if (newTop < 0) {
      bottom = newBottom + newTop;
    } else if (newBottom < 0) {
      top = newTop + newBottom;
    } else {
      bottom = newBottom;
      top = newTop;
    }
    // init left&right
    if (newLeft < 0) {
      right = newRight + newLeft;
    } else if (newRight < 0) {
      left = newLeft + newRight;
    } else {
      right = newRight;
      left = newLeft;
    }

    super.onInit();
  }

  final Offset initialPosition;
  final double areaHeight;
  final double areaWidth;
  final double minWidth;
  final double minHeight;

  late double height;
  late double width;
  double top = 0.0;
  double left = 0.0;
  double bottom = 0.0;
  double right = 0.0;

  bool showDragWidgets;

  void toggleShowDragWigets() {
    showDragWidgets = !showDragWidgets;
    update();
  }

  void setSize({
    double? newTop,
    double? newLeft,
    double? newRight,
    double? newBottom,
  }) {
    newTop = newTop ?? top;
    newLeft = newLeft ?? left;
    newRight = newRight ?? right;
    newBottom = newBottom ?? bottom;
    quantify(
      newTop: newTop,
      newLeft: newLeft,
      newRight: newRight,
      newBottom: newBottom,
    );
  }

  void quantify({
    required final double newTop,
    required final double newLeft,
    required final double newRight,
    required final double newBottom,
  }) {
    calculateWidgetSize(
        top: newTop, left: newLeft, bottom: newBottom, right: newRight);
    if (checkTopBotMaxSize(newTop, newBottom)) {
      top = newTop;
      bottom = newBottom;
    }
    if (checkLeftRightMaxSize(newLeft, newRight)) {
      left = newLeft;
      right = newRight;
    }
    calculateWidgetSize(bottom: bottom, left: left, right: right, top: top);
    update();
  }

  bool checkTopBotMaxSize(final double newTop, final double newBottom) =>
      (newTop >= 0 && newBottom >= 0) && (height >= minHeight);
  bool checkLeftRightMaxSize(final double newLeft, final double newRight) =>
      (newLeft >= 0 && newRight >= 0) && (width >= minWidth);

  void calculateWidgetSize({
    required final double top,
    required final double left,
    required final double bottom,
    required final double right,
  }) {
    width = areaWidth - (left + right);
    height = areaHeight - (top + bottom);
  }

  void onTopLeftDrag(num dx, num dy) {
    final mid = (dx + dy) / 2;
    setSize(
      newTop: top + mid,
      newLeft: left + mid,
    );
  }

  void onTopCenterDrag(num dx, num dy) {
    setSize(newTop: top + dy);
  }

  void onTopRightDrag(num dx, num dy) {
    final mid = (dx + (dy * -1)) / 2;
    setSize(
      newTop: top - mid,
      newRight: right - mid,
    );
  }

  void onCenterLeftDrag(num dx, num dy) {
    setSize(newLeft: left + dx);
  }

  void onCenterDrag(num dx, num dy) {
    setSize(
      newTop: top + dy,
      newLeft: left + dx,
      newBottom: bottom - dy,
      newRight: right - dx,
    );
  }

  void onCenterRightDrag(num dx, num dy) {
    setSize(newRight: right - dx);
  }

  void onBottomLeftDrag(num dx, num dy) {
    final mid = ((dx * -1) + dy) / 2;
    setSize(newBottom: bottom - mid, newLeft: left - mid);
    update();
  }

  void onBottomCenterDrag(num dx, num dy) {
    setSize(newBottom: bottom - dy);
  }

  void onBottomRightDrag(num dx, num dy) {
    final mid = (dx + dy) / 2;

    setSize(
      newRight: right - mid,
      newBottom: bottom - mid,
    );
  }
}
