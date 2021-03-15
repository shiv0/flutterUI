import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:luxury_flavor_app/model/common_model.dart';
import 'package:luxury_flavor_app/res/app_color.dart';
import 'package:luxury_flavor_app/res/images.dart';
import 'package:luxury_flavor_app/utils/widget_util.dart';

class ItemCategory1 extends StatelessWidget {
  final CommonModel data;

  ItemCategory1(this.data);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: appColor.notWhite2,
      margin: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.w),
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      child: Row(
        children: [
          Image.asset(data.image_path, width: 250.w, height: 250.w),
          WidgetUtil.spaceHorizontal2(20),
          Container(
            width: 0.35.sw,
            alignment: Alignment.centerLeft,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(data.title,
                    style: TextStyle(
                        fontSize: 32.sp, fontWeight: FontWeight.w400)),
                WidgetUtil.spaceVertical2(10),
                Text(data.sub_title,
                    style: TextStyle(
                        fontSize: 36.sp, fontWeight: FontWeight.w500)),
                WidgetUtil.spaceVertical2(15),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.w),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30)),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("SHOW MORE",
                          style: TextStyle(
                              fontSize: 32.sp, fontWeight: FontWeight.w400)),
                      WidgetUtil.spaceHorizontal2(10),
                      Image.asset(images.ic_right_arrow, width: 30.w, height: 30.w),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
