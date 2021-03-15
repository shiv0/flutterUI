import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:luxury_flavor_app/res/app_color.dart';
import 'package:luxury_flavor_app/res/images.dart';
import 'package:luxury_flavor_app/utils/widget_util.dart';

class AppDrawer extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  AppDrawer(this.scaffoldKey);

  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      _buildUserInfo(),
                      WidgetUtil.spaceVertical2(10),
                      Container(
                          height: 1,
                          margin: EdgeInsets.symmetric(horizontal: 50.w),
                          color: appColor.notWhite),
                      _buildMenu(
                          name: "Home",
                          image: images.ic_home,
                          isSelected: true),
                      _buildMenu(
                          name: "Shop by Category", image: images.ic_category),
                      _buildMenu(name: "Women", image: images.ic_women),
                      _buildMenu(name: "Men", image: images.ic_men),
                      _buildMenu(name: "Designers", image: images.ic_designer),
                      _buildMenu(name: "We Love", image: images.ic_we_love),
                      _buildMenu(
                          name: "Sell With Us", image: images.ic_sell_with_us),
                      _buildMenu(
                          name: "Express Delivery items",
                          image: images.ic_delivery),
                      WidgetUtil.spaceVertical2(20),
                      Container(
                          height: 1,
                          margin: EdgeInsets.symmetric(horizontal: 50.w),
                          color: appColor.notWhite),
                      _buildExtra("FAQ's"),
                      _buildExtra("Contact Us"),
                      _buildExtra("Express Delivery items"),
                    ],
                  ),
                ),
              ),
              _buildBottom(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBottom() {
    return Container(
      color: appColor.white,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(vertical: 50.h),
      child: Text("Version 2.0.1",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: appColor.grey,
              fontSize: 32.sp,
              fontWeight: FontWeight.w400)),
    );
  }

  Widget _buildUserInfo() {
    return Container(
      padding:
          EdgeInsets.only(top: 70.h, left: 40.w, right: 40.w, bottom: 30.h),
      child: Row(
        children: [
          Image.asset(images.ic_user_pic, height: 150.w, width: 150.w),
          WidgetUtil.spaceHorizontal2(30),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("The Luxury Flavor",
                    style: TextStyle(
                        fontSize: 36.sp, fontWeight: FontWeight.w700)),
                WidgetUtil.spaceVertical2(15),
                Text("View my Profile",
                    style: TextStyle(
                        color: appColor.grey,
                        fontSize: 32.sp,
                        fontWeight: FontWeight.w500)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenu({String name, String image, bool isSelected = false}) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 100.h,
        padding: EdgeInsets.symmetric(horizontal: 50.w),
        child: Row(
          children: [
            Image.asset(image, width: 50.w, height: 50.w),
            WidgetUtil.spaceHorizontal2(40),
            Expanded(
                child: Text(name,
                    style: TextStyle(
                        color: isSelected ? Colors.black : appColor.grey2,
                        fontSize: 36.sp,
                        fontWeight: FontWeight.w500))),
          ],
        ),
      ),
    );
  }

  Widget _buildExtra(String text) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 100.h,
        padding: EdgeInsets.symmetric(horizontal: 50.w),
        alignment: Alignment.centerLeft,
        child: Text(text,
            textAlign: TextAlign.start,
            style: TextStyle(
                color: appColor.grey2,
                fontSize: 35.sp,
                fontWeight: FontWeight.w500)),
      ),
    );
  }
}
