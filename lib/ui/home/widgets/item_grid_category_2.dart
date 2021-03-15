import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:luxury_flavor_app/model/common_model.dart';
import 'package:luxury_flavor_app/res/app_color.dart';
import 'package:luxury_flavor_app/res/images.dart';
import 'package:luxury_flavor_app/utils/widget_util.dart';

class ItemGridCategory2 extends StatelessWidget {
  final CommonModel data;

  ItemGridCategory2(this.data);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(data.image_path, height: double.infinity),
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Text(data.title,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: appColor.white,
                    fontSize: 42.sp,
                    fontWeight: FontWeight.w700)),
          ),
        ],
      ),
    );
  }
}
