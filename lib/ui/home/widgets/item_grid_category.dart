import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:luxury_flavor_app/model/common_model.dart';
import 'package:luxury_flavor_app/res/app_color.dart';
import 'package:luxury_flavor_app/res/images.dart';
import 'package:luxury_flavor_app/utils/widget_util.dart';

class ItemGridCategory extends StatelessWidget {
  final CommonModel data;

  ItemGridCategory(this.data);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: appColor.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 500.h,
            child: Stack(
              children: [
                Image.asset(data.image_path),
                Positioned(
                  right: 10,
                  top: 10,
                  child: Image.asset(images.ic_fav, width: 60.w),
                ),
              ],
            ),
          ),
          Text(data.title,
              style: TextStyle(
                  color: appColor.grey2,
                  fontSize: 32.sp,
                  fontWeight: FontWeight.w400)),
          WidgetUtil.spaceVertical2(15),
          Text(data.sub_title,
              style: TextStyle(fontSize: 36.sp, fontWeight: FontWeight.w500)),
          WidgetUtil.spaceVertical2(20),
          Text("Original Price: \$53",
              style: TextStyle(
                  color: appColor.grey2,
                  fontSize: 32.sp,
                  fontWeight: FontWeight.w400)),
          WidgetUtil.spaceVertical2(20),
          Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Text("\$53",
                        style: TextStyle(
                            color: appColor.grey2,
                            fontSize: 34.sp,
                            decoration: TextDecoration.lineThrough,
                            fontWeight: FontWeight.w400)),
                    WidgetUtil.spaceHorizontal2(15),
                    Text("\$36",
                        style: TextStyle(
                            fontSize: 36.sp,
                            fontWeight: FontWeight.w700)),

                  ],
                ),
              ),
              Image.asset(images.ic_like, width: 50.w),
              WidgetUtil.spaceHorizontal2(10),
              Image.asset(images.ic_badge_true, width: 60.w),
              WidgetUtil.spaceHorizontal2(10),
              Image.asset(images.ic_badge_star, width: 50.w),
            ],
          ),
        ],
      ),
    );
  }
}
