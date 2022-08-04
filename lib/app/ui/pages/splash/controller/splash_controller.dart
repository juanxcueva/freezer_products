import 'package:flutter_meedu/meedu.dart';
import 'package:freezer_products/app/ui/routes/routes.dart';

class SplashController extends SimpleNotifier {
  String text = 'Cargando';
  String route = "";
  SplashController() {
    _init();
  }

  bool navigate = false;

  void _init() async {
    //print(token);
    await Future.delayed(const Duration(milliseconds: 900));
    text = text + ".";
    notify();
    await Future.delayed(const Duration(milliseconds: 900));
    text = text + ".";
    notify();
    await Future.delayed(const Duration(milliseconds: 900));
    text = text + ".";
    await Future.delayed(const Duration(milliseconds: 200));
    navigate = true;

    route = Routes.bottomNavBar;

    notify();
  }
}
