import 'package:flutter/material.dart';

Images images = Images();

class Images {
  static final Images _images = Images._i();

  factory Images() {
    return _images;
  }

  Images._i();

  ///
  static const String iconDir = "assets/icons";
  static const String imageDir = "assets/images";

//  static const String app_icon = "$iconDir/app_icon.png";
  final String ic_compare = "$iconDir/ic_compare.png";
  final String ic_menu = "$iconDir/ic_menu.png";
  final String deals_2 = "$iconDir/deals_2.png";
  final String ic_cart = "$iconDir/ic_cart.png";
  final String ic_category = "$iconDir/ic_category.png";
  final String ic_daily_deals = "$iconDir/ic_daily_deals.png";
  final String ic_home = "$iconDir/ic_home.png";
  final String ic_search = "$iconDir/ic_search.png";
  final String ic_sell = "$iconDir/ic_sell.png";
  final String ic_user_pic = "$iconDir/ic_user_pic.png";
  final String ic_notification = "$iconDir/ic_notification.png";
  final String ic_women = "$iconDir/ic_women.png";
  final String ic_we_love = "$iconDir/ic_we_love.png";
  final String ic_men = "$iconDir/ic_men.png";
  final String ic_designer = "$iconDir/ic_designer.png";
  final String ic_delivery = "$iconDir/ic_delivery.png";
  final String ic_sell_with_us = "$iconDir/ic_sell_with_us.png";
  final String ic_badge_star = "$iconDir/ic_badge_star.png";
  final String ic_badge_true = "$iconDir/ic_badge_true.png";
  final String ic_buy_sell = "$iconDir/ic_buy_sell.png";
  final String ic_fav = "$iconDir/ic_fav.png";
  final String ic_like = "$iconDir/ic_like.png";
  final String ic_right_arrow = "$iconDir/ic_right_arrow.png";
  final String ic_discount = "$iconDir/ic_discount.png";

  final String ic_m1 = "$imageDir/ic_m1.png";
  final String ic_m2 = "$imageDir/ic_m2.png";
  final String ic_m3 = "$imageDir/ic_m3.png";
  final String ic_m4 = "$imageDir/ic_m4.png";
  final String ic_s1 = "$imageDir/ic_s1.png";
  final String ic_s2 = "$imageDir/ic_s2.png";
  final String ic_s3 = "$imageDir/ic_s3.png";
  final String ic_s4 = "$imageDir/ic_s4.png";
  final String ic_ss1 = "$imageDir/ic_ss1.png";
  final String ic_ss2 = "$imageDir/ic_ss2.png";

  final String url_category_offer_1 = "https://admin.stremo.in/img/img1.png";
  final String url_category_offer_2 = "https://admin.stremo.in/img/img2.png";
  final String url_category_offer_3 = "https://admin.stremo.in/img/img3.png";
  final String url_category_offer_4 = "https://admin.stremo.in/img/img4.png";

  final String url_spotlight_1 =
      "https://assets.myntassets.com/assets/images/2020/3/17/9829251b-2655-4815-94ba-b3faec860e2e1584449381776-Pure.jpg";
  final String url_spotlight_2 =
      "https://assets.myntassets.com/assets/images/2020/3/17/96c10853-b8ff-45de-aa5b-b8b4c05394db1584449381852-Trident.jpg";
  final String url_spotlight_3 =
      "https://assets.myntassets.com/assets/images/2020/3/17/a4916247-74aa-4adf-8a67-3d26f82648ee1584449381660-aura.jpg";
  final String url_spotlight_4 =
      "https://assets.myntassets.com/assets/images/2020/3/17/4ccb1d03-1a1a-49c4-94d6-9e61e86dca531584449381812-Rajashtan-decor.jpg";
}
