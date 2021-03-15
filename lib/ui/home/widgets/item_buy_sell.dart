import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:luxury_flavor_app/model/common_model.dart';
import 'package:luxury_flavor_app/res/app_color.dart';
import 'package:luxury_flavor_app/res/images.dart';
import 'package:luxury_flavor_app/utils/widget_util.dart';

class ItemBuySell extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20.w),
      padding: EdgeInsets.symmetric(vertical: 30.w, horizontal: 40.w),
      color: Colors.white,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey[100], borderRadius: BorderRadius.circular(7)),
        padding: EdgeInsets.symmetric(vertical: 20.w, horizontal: 40.w),
        child: Row(
          children: [
            Image.asset(images.ic_buy_sell, width: 150.w),
            WidgetUtil.spaceHorizontal2(40),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Sell & Buy in 3 Easy Steps",
                      style: TextStyle(
                          fontSize: 36.sp, fontWeight: FontWeight.w700)),
                  WidgetUtil.spaceVertical2(15),
                  Text(
                      "we create the best easy selling and buying for our customers",
                      style: TextStyle(
                          color: appColor.grey2,
                          fontSize: 32.sp,
                          fontWeight: FontWeight.w500)),
                ],
              ),
            ),
            Image.asset(images.ic_right_arrow, width: 30.w, height: 30.w),
          ],
        ),
      ),
    );
  }
}
