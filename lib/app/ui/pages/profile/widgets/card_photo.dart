

import 'package:flutter/material.dart';
import 'package:flutter_meedu/flutter_meedu.dart';
import 'package:freezer_products/app/ui/pages/profile/profile_page.dart';
import 'package:freezer_products/app/ui/theme/app_colors.dart';


class CardPhoto extends StatelessWidget {
  const CardPhoto({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: AppColors.azulLetra,
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
              color: Colors.black38,
              blurRadius: 10.0,
              spreadRadius: 0.0,
              offset: Offset(2.0, 5.0))
        ],
      ),
      child: Column(children: [
        Container(
          margin: const EdgeInsets.only(top: 10.0),
          child: CircleAvatar(
            radius: 50.0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50.0),
              child: Consumer(
                builder: (_, ref, __) {
                  final imagen =
                      ref.watch(profileProvider.ids(() => ['imagen'])).imagen;
                  return Container(
                    width: size.width * 0.4,
                    height: size.height * 0.20,
                    decoration: BoxDecoration(
                     image: DecorationImage(
                                image: imagen.image,
                                fit: BoxFit.cover),
                            color: Colors.grey[400],
                            shape: BoxShape.circle

                    ),
                  );

                },
              ),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Text(nombreCard,
              Consumer(
                builder: (_, ref, __) {
                  final nombre =
                      ref.watch(profileProvider.ids(() => ['nombre'])).nombresTextController;
                  return Text(nombre.text,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white));
                },
              ),
              
            ],
          ),
        ),
      ]),
    );
  }
}

