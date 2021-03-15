import 'package:cached_network_image/cached_network_image.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:luxury_flavor_app/model/common_model.dart';
import 'package:luxury_flavor_app/res/app_color.dart';
import 'package:luxury_flavor_app/res/images.dart';
import 'package:luxury_flavor_app/ui/home/widgets/item_buy_sell.dart';
import 'package:luxury_flavor_app/ui/home/widgets/item_category_1.dart';
import 'package:luxury_flavor_app/ui/home/widgets/item_discount.dart';
import 'package:luxury_flavor_app/ui/home/widgets/item_grid_category.dart';
import 'package:luxury_flavor_app/utils/widget_util.dart';
import 'package:luxury_flavor_app/widgets/custom_appbar.dart';
import 'package:luxury_flavor_app/widgets/shimmer.dart';

import 'app_drawer.dart';
import 'home/widgets/item_grid_category_2.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      extendBody: true,
      appBar: _buildAppBar(),
      drawer: AppDrawer(_scaffoldKey),
      body: _buildBody(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: _buildFloatingBtn(),
      bottomNavigationBar: _buildBottomBar(),
    );
  }

  Widget _buildAppBar() {
    return CustomAppBar(
      elevation: 0,
      showBackArrow: false,
      showLeadingArrow: false,
      leading: IconButton(
        icon: Image.asset(images.ic_menu, width: 70.w, height: 70.w),
        onPressed: () {
          if (!_scaffoldKey.currentState.isDrawerOpen) {
            _scaffoldKey.currentState.openDrawer();
          }
        },
      ),
      actionsWidget: [
        IconButton(
          icon: Image.asset(images.ic_compare, width: 50.w, height: 50.w),
          onPressed: () {},
        ),
        IconButton(
          icon: Image.asset(images.ic_cart, width: 50.w, height: 50.w),
          onPressed: () {},
        ),
        IconButton(
          icon: Image.asset(images.ic_user_pic, width: 80.w, height: 80.w),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildFloatingBtn() {
    return FloatingActionButton(
      onPressed: () {},
      elevation: 5,
      backgroundColor: appColor.primaryColor,
      child: Image.asset(images.ic_sell, width: 70.w, height: 70.w),
    );
  }

  Widget _buildBottomBar() {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      notchMargin: 8,
      // color: Colors.white,
      child: Container(
        height: 130.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Image.asset(images.ic_home, height: 60.w, width: 60.w),
              onPressed: () {},
            ),
            IconButton(
              icon: Image.asset(images.ic_search, height: 60.w, width: 60.w),
              onPressed: () {},
            ),
            WidgetUtil.spaceHorizontal2(200),
            // Container(width: 150.w),
            IconButton(
              icon: Image.asset(images.ic_category, height: 60.w, width: 60.w),
              onPressed: () {},
            ),
            IconButton(
              icon: Image.asset(images.ic_notification,
                  height: 60.w, width: 60.w),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBody() {
    return Container(
      color: appColor.notWhite2,
      child: SingleChildScrollView(
        padding: EdgeInsets.only(top: 40.w, bottom: 300.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildDeals(),
            _buildSlider(),
            _buildCategory1(),
            WidgetUtil.spaceVertical2(20),
            _buildGridCategory(null),
            _buildGridCategory2(),
            _buildGridCategory("Featured"),
            ItemDiscount(),
            _buildGridCategory("We Picked For You"),
            ItemBuySell(),
            _buildGridCategory("Our Items On Sale"),
          ],
        ),
      ),
    );
  }

  Widget _buildDeals() {
    final _list = [
      CommonModel(title: "Daily Deals", image_path: images.ic_daily_deals),
      CommonModel(title: "Exceptional Deals", image_path: images.deals_2),
      CommonModel(title: "Daily Deals", image_path: images.ic_daily_deals),
      CommonModel(title: "Exceptional Deals", image_path: images.deals_2),
      CommonModel(title: "Daily Deals", image_path: images.ic_daily_deals),
      CommonModel(title: "Exceptional Deals", image_path: images.deals_2),
    ];

    return Container(
      height: 200.h,
      color: appColor.white,
      child: ListView.builder(
        shrinkWrap: true,
        primary: false,
        scrollDirection: Axis.horizontal,
        itemCount: _list.length,
        itemBuilder: (context, index) {
          final data = _list[index];
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(data.image_path, height: 130.w, width: 130.w),
                WidgetUtil.spaceHorizontal2(20),
                Text(data.title),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildSlider() {
    final _list = [
      CommonModel(
          title: "Up to 70 % Off", image_url: images.url_category_offer_1),
      CommonModel(
          title: "Up to 60 % Off", image_url: images.url_category_offer_2),
      CommonModel(
          title: "Up to 80 % Offs", image_url: images.url_category_offer_3),
      CommonModel(
          title: "Up to 50 % Off", image_url: images.url_category_offer_4),
    ];

    return Container(
      height: 0.55.sh,
      margin: EdgeInsets.symmetric(vertical: 40.w),
      child: Stack(
        children: <Widget>[
          Swiper(
            itemCount: _list.length,
            itemWidth: double.infinity,
            layout: SwiperLayout.DEFAULT,
            // viewportFraction: 1,
            // scale: 0.9,
            // fade: 0.8,
            autoplay: true,
            outer: false,
            itemBuilder: (BuildContext context, int index) {
              final data = _list[index];
              // return Container(
              //   child: Stack(
              //     alignment: Alignment.center,
              //     children: <Widget>[
              //       Container(
              //         width: double.infinity,
              //         height: double.infinity,
              //         // child: CachedNetworkImage(
              //         //   imageUrl: data.image_url,
              //         //   fit: BoxFit.cover,
              //         //   placeholder: (context, url) {
              //         //     return Shimmer.fromColors(
              //         //       baseColor: Colors.grey[100],
              //         //       highlightColor: Colors.grey[300],
              //         //       child: Container(
              //         //         height: double.infinity,
              //         //         width: double.infinity,
              //         //         color: Colors.grey[100],
              //         //       ),
              //         //     );
              //         //   },
              //         // ),
              //       ),
              //     ],
              //   ),
              // );
              return ExtendedImage.network(
                data.image_url,
                width: double.infinity,
                height: double.infinity,
                cache: true,
                fit: BoxFit.cover,
              );
            },
            pagination: SwiperPagination(
              //builder: SwiperPagination.fraction,
              builder: DotSwiperPaginationBuilder(
                  size: 6,
                  space: 2,
                  activeSize: 8,
                  color: Colors.grey,
                  activeColor: appColor.white),
            ),
            onIndexChanged: (value) {},
            onTap: (index) {},
          ),
        ],
      ),
    );
  }

  Widget _buildCategory1() {
    final _list = [
      CommonModel(
          title: "Take A LOOK",
          sub_title: "TO OUR AMAZING BAGS",
          image_path: images.ic_ss1),
      CommonModel(
          title: "Take A LOOK",
          sub_title: "TO OUR AMAZING BAGS",
          image_path: images.ic_ss1),
      CommonModel(
          title: "Take A LOOK",
          sub_title: "TO OUR AMAZING BAGS",
          image_path: images.ic_ss1),
      CommonModel(
          title: "Take A LOOK",
          sub_title: "TO OUR AMAZING BAGS",
          image_path: images.ic_ss1),
    ];

    return Container(
      height: 300.h,
      color: Colors.white,
      child: ListView.builder(
        shrinkWrap: true,
        primary: false,
        scrollDirection: Axis.horizontal,
        itemCount: _list.length,
        itemBuilder: (context, index) {
          final data = _list[index];
          return ItemCategory1(data);
        },
      ),
    );
  }

  Widget _buildGridCategory(String name) {
    final _list = [
      CommonModel(
          title: "Designers, Loefers, Men",
          sub_title: "TODS 45EU",
          image_path: images.ic_m1),
      CommonModel(
          title: "Designers, Loefers, Men",
          sub_title: "TODS 45EU",
          image_path: images.ic_m2),
    ];

    return Container(
      color: Colors.white,
      margin: EdgeInsets.symmetric(vertical: 30.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (name != null)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 50.w),
              child: Text(name,
                  style:
                      TextStyle(fontSize: 44.sp, fontWeight: FontWeight.w600)),
            ),
          GridView.builder(
            shrinkWrap: true,
            primary: false,
            padding: EdgeInsets.symmetric(horizontal: 40.w),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 40.w,
              childAspectRatio: MediaQuery.of(context).size.width /
                  (MediaQuery.of(context).size.height / 1.1),
            ),
            itemCount: _list.length,
            itemBuilder: (context, index) {
              final data = _list[index];
              return ItemGridCategory(data);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildGridCategory2() {
    final _list = [
      CommonModel(title: "For Him", image_path: images.ic_s1),
      CommonModel(title: "Our Sales For You", image_path: images.ic_s2),
      CommonModel(title: "Most Wanted", image_path: images.ic_s3),
      CommonModel(title: "Exceptional Bags", image_path: images.ic_s4),
    ];

    return Container(
      color: Colors.white,
      margin: EdgeInsets.symmetric(vertical: 30.w),
      child: GridView.builder(
        shrinkWrap: true,
        primary: false,
        padding: EdgeInsets.symmetric(horizontal: 40.w),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 40.w,
          childAspectRatio: MediaQuery.of(context).size.width /
              (MediaQuery.of(context).size.height / 1.9),
        ),
        itemCount: _list.length,
        itemBuilder: (context, index) {
          final data = _list[index];
          return ItemGridCategory2(data);
        },
      ),
    );
  }
}
