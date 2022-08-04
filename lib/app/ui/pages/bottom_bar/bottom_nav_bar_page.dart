import 'package:flutter/material.dart';
import 'package:flutter_meedu/flutter_meedu.dart';
import 'package:freezer_products/app/ui/theme/app_colors.dart';

import 'controller/bottom_nav_bar_controller.dart';

final bottomNavBarProvider = SimpleProvider(
  (ref) => BottomNavBarPageController(),
  autoDispose: false,
);

class BottomNavBarPage extends StatelessWidget {
  const BottomNavBarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentTheme = Theme.of(context);
    final isDarkTheme = currentTheme.brightness == Brightness.dark;

    return Scaffold(
      extendBody: true,
      body: Consumer(builder: (_, ref, __) {
        final currentIndex = ref
            .watch(bottomNavBarProvider.select((_) => _.currentIndex))
            .currentIndex;
        // gpsProvider.read.obtenerUbicacion;
        return screens[currentIndex];
      }),
      bottomNavigationBar: Consumer(builder: (_, ref, __) {
        final currentIndex = ref
            .watch(bottomNavBarProvider.select((_) => _.currentIndex))
            .currentIndex;
        return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30), topLeft: Radius.circular(30)),
              boxShadow: [
                BoxShadow(
                    color: Colors.black38, spreadRadius: 0, blurRadius: 10),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
              ),
              child: BottomNavigationBar(
                items: [Icons.qr_code, Icons.home, Icons.list_outlined,Icons.person]
                    .asMap()
                    .map((key, value) => MapEntry(
                          key,
                          BottomNavigationBarItem(
                            label: '',
                            icon: Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 6.0,
                                horizontal: 16.0,
                              ),
                              decoration: BoxDecoration(
                                color: currentIndex == key
                                    ? (!isDarkTheme
                                        ? Colors.white
                                        : AppColors.darkColor)
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Icon(value),
                            ),
                          ),
                        ))
                    .values
                    .toList(),
                currentIndex: currentIndex,
                onTap: (index) async {
                  bottomNavBarProvider.read.onChangeSelectedIndex(index);
                },
                type: BottomNavigationBarType.fixed,
                backgroundColor:
                    !isDarkTheme ? Colors.white : AppColors.darkColor,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                selectedItemColor: AppColors.blue,
                unselectedItemColor: Colors.grey,
                elevation: 0.0,
              ),
            ));
      }),
    );
  }
}
