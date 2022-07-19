import 'size.dart';

class SizeCalculator {
  SizeCalculator(this._size)height=_size. {
    initFields();
  }
  final Size _size;
  double height;
  double width;
  late double top;
  late double left;
  late double bottom;
  late double right;

  void initFields() {
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
}
