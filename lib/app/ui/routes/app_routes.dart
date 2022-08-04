
import 'package:flutter/material.dart';
import 'package:freezer_products/app/ui/pages/bottom_bar/bottom_nav_bar_page.dart';
import 'package:freezer_products/app/ui/pages/details/details_page.dart';
import 'package:freezer_products/app/ui/pages/freezer/freezer_page.dart';
import 'package:freezer_products/app/ui/pages/home/home_page.dart';
import 'package:freezer_products/app/ui/pages/profile/profile_page.dart';
import 'package:freezer_products/app/ui/pages/refrigerator_inside/inside_refri_page.dart';
import 'package:freezer_products/app/ui/pages/splash/splash_page.dart';
import 'package:freezer_products/app/ui/routes/routes.dart';

Map<String, Widget Function(BuildContext)> routes={
  Routes.home:(_)=>const HomePage(),
  Routes.details:(_)=>const DetailsPage(),
  Routes.splash:(_)=>const SplashPage(),
  Routes.insideRefri:(_)=>const InsideRefriPage(),
  Routes.freezer:(_)=>const FreezerPage(),
  Routes.bottomNavBar:(_)=>const BottomNavBarPage(),
  Routes.profilePage:(_)=>const ProfilePage(),





};