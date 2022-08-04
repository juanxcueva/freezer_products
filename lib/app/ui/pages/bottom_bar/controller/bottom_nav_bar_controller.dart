import 'package:flutter/material.dart';
import 'package:flutter_meedu/flutter_meedu.dart';
import 'package:freezer_products/app/ui/pages/freezer/freezer_page.dart';
import 'package:freezer_products/app/ui/pages/home/home_page.dart';
import 'package:freezer_products/app/ui/pages/profile/profile_page.dart';
import 'package:freezer_products/app/ui/pages/refrigerator_inside/inside_refri_page.dart';

class BottomNavBarPageController extends SimpleNotifier {
  // DelayRoutesController() {
  //   init();
  // }
  //variables
  BottomNavBarPageController();
  int _currentIndex = 1;

  //Gets
  int get currentIndex => _currentIndex;
  //set's

  set currentIndex(int value) {
    _currentIndex = value;
    notify();
  }


  //methods
  void onChangeSelectedIndex(int value) {
    _currentIndex = value;
    notify(['index']);
  }
}

List<Widget> screens = const [InsideRefriPage(), HomePage(), FreezerPage(), ProfilePage()];
