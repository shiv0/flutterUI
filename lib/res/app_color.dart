import 'dart:math';

import 'package:flutter/material.dart';

AppColor appColor = AppColor();

class AppColor {
  static final AppColor _appColor = AppColor._i();

  factory AppColor() {
    return _appColor;
  }

  AppColor._i();

  final Color main = Colors.white;
  final Color primaryColor = Color(0xFFFF9CAD);
  final Color primaryDarkColor = Color(0xFFFF9CAD);
  final Color primaryLight = Color(0xFFFF9CAD);
  final Color accentColor = Colors.black;

  final Color bgColor = Color(0xFFF4F4FD);
  final Color bgColor2 = Color(0xFFF7F7FF);
  final Color bgColor3 = Color(0xFFD6D6F3);

  final Color white = Colors.white;
  final Color black = Colors.black;
  final Color transparent = Colors.transparent;

  final Color blackTransparent = Color(0x95000000);

  final Color black2 = Colors.black.withOpacity(0.7);
  final Color black3 = Colors.black.withOpacity(0.8);

  final Color blueDef = Colors.blue;
  final Color blue = Color(0xff2C86D5);
  final Color blue2 = Color(0xff29ABE2);

  final Color cyan = Colors.cyan;
  final Color cyan2 = Colors.cyan.withOpacity(0.2);
  final Color lightCyan = Color(0xffDBEFFB);

  final Color green = Color(0xff39B54A);
  final Color green1 = Color(0xff22B573);
  final Color green2 = Color(0xff00A99D);

  final Color teal = Colors.teal;
  final Color teal2 = Color(0xff26a69a);
  final Color teal3 = Color(0xff80cbc4);

  final Color red = Colors.red;
  final Color red2 = Color(0xFFFF0000);

  final Color orange = Color(0xffEF8318);
  final Color orange2 = Color(0xffF15A24);

  final Color amberLight = Colors.amber[300].withOpacity(0.5);

  final Color greyDef = Colors.grey;
  final Color grey = Color(0xff999999);
  final Color grey2 = Color(0xff757575);
  final Color darkGrey = Color(0xFF4E515A);

  final Color greyLight = Color(0xffBCBCBC);
  final Color grey_light = Color(0xffAEB4BB);
  final Color grey_light2 = Colors.grey[300];

  final Color notWhite = Color(0xFFEDF0F2);
  final Color notWhite2 = Color(0xFFF6F6F6);
  final Color nearlyWhite = Color(0xFFFEFEFE);

  final Color lightOrange = Color(0xFFFDF3C6);
  final Color lightGreen = Color(0xFFF1FDD4);
  final Color lightRed = Color(0xFFFDE6D4);

  Color hexToColor(String code) {
    return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }

  Color generateRandomColor() {
    return Colors.primaries[Random().nextInt(Colors.primaries.length)];

    Random random = new Random();
    return Color.fromARGB(
        255, random.nextInt(255), random.nextInt(255), random.nextInt(255));
  }
}
