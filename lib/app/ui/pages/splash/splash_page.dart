
import 'package:flutter/material.dart';
import 'package:flutter_meedu/flutter_meedu.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:freezer_products/app/ui/theme/app_colors.dart';

import 'controller/splash_controller.dart';

final splashProvider = SimpleProvider(
  (ref) => SplashController(),
);

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderListener<SplashController>(
        provider: splashProvider,
        onChange: (context, controller) {
          if (controller.navigate) {
            Navigator.pushReplacementNamed(context, splashProvider.read.route);
          }
        },
        builder: (_, controller) {
          return Scaffold(
              body: Hero(
                tag: 'logo',  
                child: Stack(
                          children: [
                Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          AppColors.electricColor,
                          AppColors.grassColor,
                          AppColors.blueBottom,
                        ]),
                  ),
                ),
                Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height:MediaQuery.of(context).size.height*.3,
                      width:MediaQuery.of(context).size.height*.3,
                      child: Image.asset("assets/images/refri.png",
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height*.01,
                    ),
                    Text("FreezerApp",style: Theme.of(context).textTheme.headline3!.copyWith(
                      color: AppColors.colorLetter,
                      wordSpacing: 1,
                      fontWeight: FontWeight.bold
                    )),
                    SizedBox(
                      height: MediaQuery.of(context).size.height*.03,
                    ),
                    Consumer(builder: (_, ref, __) {
                      final splashController = ref.watch(splashProvider);
                      return Text(
                        splashController.text,
                        style: Theme.of(context).textTheme.headline6,
                      );
                    }),
                  ],
                ))
                          ],
                        ),
              ));
        });
  }
}

// Center(
//         child: Hero(child: TextTitle(),tag: 'logo',),
//       )