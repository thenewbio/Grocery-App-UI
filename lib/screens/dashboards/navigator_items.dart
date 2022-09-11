import 'package:flutter/material.dart';

import 'package:grocery_app/screens/home/home_screen.dart';

import '../account/account_screen.dart';
import '../cart/cart_screen.dart';
import '../explore_screen.dart';
import '../favorite.dart';

class NavigatorItem {
  final String label;
  final String iconPath;
  final int index;
  final Widget screen;

  NavigatorItem(this.label, this.iconPath, this.index, this.screen);
}

List<NavigatorItem> navigatorItems = [
  NavigatorItem("Shop", "assets/icons/shop_icon.svg", 0, HomeScreen()),
  NavigatorItem("Explore", "assets/icons/explore_icon.svg", 1, ExploreScreen()),
  NavigatorItem("Cart", "assets/icons/cart_icon.svg", 2, const CartScreen()),
  NavigatorItem("Favourite", "assets/icons/favourite_icon.svg", 3,
      const FavouriteScreen()),
  NavigatorItem("Account", "assets/icons/account_icon.svg", 4, AccountScreen()),
];
