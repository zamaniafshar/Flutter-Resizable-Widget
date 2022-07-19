import 'size.dart';

class SizeCalculator {
  SizeCalculator(this._size) {
    initFields();
  }
  final Size _size;

  late double height;
  late double width;
  late double top;
  late double left;
  late double bottom;
  late double right;

  void initFields() {
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
}
