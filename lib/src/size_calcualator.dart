import 'model/common_sizes.dart';

class SizeCalculator {
  late final CommonSizes _size;

  late double height;
  late double width;
  late double top;
  late double left;
  late double bottom;
  late double right;

  void initFields(CommonSizes finalSize) {
    _size = finalSize;
    height = _size.height;
    width = _size.width;
    double newTop = _size.initialPosition.dy - height / 2;
    double newBottom = _size.areaHeight - height - newTop;
    double newLeft = _size.initialPosition.dx - (width / 2);
    double newRight = (_size.areaWidth - width) - newLeft;

    // init top & bottom
    if (newTop < 0) {
      bottom = newBottom + newTop;
    } else if (newBottom < 0) {
      top = newTop + newBottom;
    } else {
      bottom = newBottom;
      top = newTop;
    }
    // init left & right
    if (newLeft < 0) {
      right = newRight + newLeft;
    } else if (newRight < 0) {
      left = newLeft + newRight;
    } else {
      right = newRight;
      left = newLeft;
    }
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
    calculateWidgetSize(top: newTop, left: newLeft, bottom: newBottom, right: newRight);
    if (checkTopBotMaxSize(newTop, newBottom)) {
      top = newTop;
      bottom = newBottom;
    }
    if (checkLeftRightMaxSize(newLeft, newRight)) {
      left = newLeft;
      right = newRight;
    }
    calculateWidgetSize(bottom: bottom, left: left, right: right, top: top);
  }

  bool checkTopBotMaxSize(double newTop, double newBottom) =>
      (newTop >= 0 && newBottom >= 0) && (height >= _size.minHeight);
  bool checkLeftRightMaxSize(double newLeft, double newRight) =>
      (newLeft >= 0 && newRight >= 0) && (width >= _size.minWidth);

  void calculateWidgetSize({
    required double top,
    required double left,
    required double bottom,
    required double right,
  }) {
    width = _size.areaWidth - (left + right);
    height = _size.areaHeight - (top + bottom);
  }
}
