import 'package:flutter/material.dart';

class ResizableWidgetController extends ValueNotifier {
  ResizableWidgetController({
    required this.initialPosition,
    required this.areaHeight,
    required this.areaWidth,
    required this.height,
    required this.width,
    this.minWidth = 0.0,
    this.minHeight = 0.0,
    this.showDragWidgets = true,
  }) : super(null) {
    init();
  }

  void init() {
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
  }

  final Offset initialPosition;
  final double areaHeight;
  final double areaWidth;
  final double minWidth;
  final double minHeight;

  double height;
  double width;
  double top = 0.0;
  double left = 0.0;
  double bottom = 0.0;
  double right = 0.0;

  bool showDragWidgets;

  void toggleShowDragWidgets() {
    showDragWidgets = !showDragWidgets;
    notifyListeners();
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
    notifyListeners();
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

  void onTopLeftDrag(double dx, double dy) {
    double mid = (dx + dy) / 2;
    setSize(
      newTop: top + mid,
      newLeft: left + mid,
    );
  }

  void onTopCenterDrag(double dx, double dy) {
    setSize(newTop: top + dy);
  }

  void onTopRightDrag(double dx, double dy) {
    double mid = (dx + (dy * -1)) / 2;
    setSize(
      newTop: top - mid,
      newRight: right - mid,
    );
  }

  void onCenterLeftDrag(double dx, double dy) {
    setSize(newLeft: left + dx);
  }

  void onCenterDrag(double dx, double dy) {
    setSize(
      newTop: top + dy,
      newLeft: left + dx,
      newBottom: bottom - dy,
      newRight: right - dx,
    );
  }

  void onCenterRightDrag(double dx, double dy) {
    setSize(newRight: right - dx);
  }

  void onBottomLeftDrag(double dx, double dy) {
    double mid = ((dx * -1) + dy) / 2;
    setSize(newBottom: bottom - mid, newLeft: left - mid);
    notifyListeners();
  }

  void onBottomCenterDrag(double dx, double dy) {
    setSize(newBottom: bottom - dy);
  }

  void onBottomRightDrag(double dx, double dy) {
    double mid = (dx + dy) / 2;

    setSize(
      newRight: right - mid,
      newBottom: bottom - mid,
    );
  }
}
