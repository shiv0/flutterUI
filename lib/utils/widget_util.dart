import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:luxury_flavor_app/res/app_color.dart';

WidgetUtil widgetUtil = WidgetUtil();

class WidgetUtil {
  static final WidgetUtil _widgetUtil = WidgetUtil._i();

  factory WidgetUtil() {
    return _widgetUtil;
  }

  WidgetUtil._i();

  static Widget spaceHorizontal(double width) {
    return SizedBox(width: width);
  }

  static Widget spaceHorizontal2(double width) {
    return SizedBox(width: ScreenUtil().setWidth(width));
  }

  static Widget spaceVertical(double height) {
    return SizedBox(height: height);
  }

  static Widget spaceVertical2(double height) {
    return SizedBox(height: ScreenUtil().setHeight(height));
  }

  static Widget circleContainer(Color color, double size) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(390)),
        color: color,
      ),
    );
  }

  static Widget horizontalLine1() {
    return Container(color: Colors.black.withOpacity(0.2), height: 0.5);
  }

  static Widget horizontalLine2() {
    return Container(height: 1, color: appColor.grey_light);
  }

  static Widget verticalLine1() {
    return Container(color: Colors.black.withOpacity(0.2), width: 0.5);
  }

  static Widget verticalGreyLine1() {
    return Container(color: Colors.grey, width: 0.5);
  }

  static Widget hLightGreyLineBySize(double height) {
    return Container(color: appColor.notWhite, height: height);
  }

  BoxDecoration customBoxDecoration({
    Color color,
    Color shadowColor,
    double radius = 5,
    double blurRadius = 1.0,
    Offset offset = Offset.zero,
  }) {
    //
    return BoxDecoration(
      color: color ?? appColor.bgColor,
      borderRadius: BorderRadius.circular(radius),
      boxShadow: <BoxShadow>[
        BoxShadow(
            color: shadowColor ?? appColor.grey.withOpacity(0.5),
            offset: offset,
            blurRadius: blurRadius)
      ],
    );
  }
}
