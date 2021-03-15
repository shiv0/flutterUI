import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:luxury_flavor_app/model/common_model.dart';
import 'package:luxury_flavor_app/res/app_color.dart';
import 'package:luxury_flavor_app/res/images.dart';
import 'package:luxury_flavor_app/utils/widget_util.dart';

class ItemDiscount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20.w),
      padding: EdgeInsets.symmetric(vertical: 30.w, horizontal: 70.w),
      color: Colors.white,
      child: Row(
        children: [
          Image.asset(images.ic_discount, width: 200.w),
          WidgetUtil.spaceHorizontal2(60),
          Container(height: 100.h, width: 1.5, color: appColor.grey_light),
          WidgetUtil.spaceHorizontal2(50),
          Expanded(
            child: Text("10 % Instant Discount* on for first time user",
                style: TextStyle(fontSize: 44.sp, fontWeight: FontWeight.w700)),
          ),
        ],
      ),
    );
  }
}
