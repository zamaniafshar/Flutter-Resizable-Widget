import 'package:flutter/material.dart';
import 'package:resizable_widget/src/model/common_sizes.dart';
import 'package:resizable_widget/src/size_calcualator.dart';

class ResizableWidgetController extends SizeCalculator with ChangeNotifier {
  late bool _showDragWidgets;
  bool get showDragWidgets => _showDragWidgets;

  void init({required CommonSizes finalSize, bool? showDragWidgets}) {
    super.initFields(finalSize);
    _showDragWidgets = showDragWidgets ?? true;
  }

  @override
  void setSize({double? newTop, double? newLeft, double? newRight, double? newBottom}) {
    super.setSize(newBottom: newBottom, newTop: newTop, newLeft: newLeft, newRight: newRight);
    notifyListeners();
  }

  void toggleShowDragWidgets() {
    _showDragWidgets = !_showDragWidgets;
    notifyListeners();
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
