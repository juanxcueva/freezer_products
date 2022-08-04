import 'package:flutter/material.dart';
import 'package:flutter_meedu/flutter_meedu.dart';
import 'package:freezer_products/app/ui/global_widgets/custom_text_field.dart';
import 'package:freezer_products/app/ui/pages/profile/controller/profile_controller.dart';
import 'package:freezer_products/app/ui/theme/app_colors.dart';

import 'widgets/card_photo.dart';

final profileProvider = SimpleProvider(
  (ref) => ProfileController(),
);

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final currentTheme = Theme.of(context);
    final isDarkTheme = currentTheme.brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: Text("Perfil"),
        backgroundColor: AppColors.grassColor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             
              

              SizedBox(
                height: size.height * 0.02,
              ),
              CardPhoto(),
              SizedBox(
                height: size.height * 0.02,
              ),
              Text("Nombres",
                  style: TextStyle(
                      color: isDarkTheme ? Colors.white : Colors.black)),
              SizedBox(
                height: size.height * 0.007,
              ),
              Consumer(
                builder: (_, ref, __) {
                  return CustomTextField(
                    isValid: true,
                    enableIcon: Icons.check_circle,
                    disableIcon: Icons.close,
                    controller: profileProvider.read.nombresTextController,
                    onPressed: () {},
                  );
                },
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Text("Apellidos",
                  style: TextStyle(
                      color: isDarkTheme ? Colors.white : Colors.black)),
              SizedBox(
                height: size.height * 0.007,
              ),
              Consumer(
                builder: (_, ref, __) {
                  // final isValid = ref
                  //     .watch(profileProvider.ids(() => ['apellidosValid']))
                  //     .apellidosValid;
                  return CustomTextField(
                    isValid: true,
                    enableIcon: Icons.check_circle,
                    disableIcon: Icons.close,
                    controller: profileProvider.read.apellidosTextController,
                    onPressed: () {},
                  );
                },
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Text("Sexo",
                  style: TextStyle(
                      color: isDarkTheme ? Colors.white : Colors.black)),
              SizedBox(
                height: size.height * 0.007,
              ),
              Consumer(
                builder: (_, ref, __) {
                  // final isValid = ref
                  //     .watch(profileProvider.ids(() => ['cedulaValid']))
                  //     .cedulaValid;
                  return CustomTextField(
                    isValid: true,
                    enableIcon: Icons.check_circle,
                    disableIcon: Icons.close,
                    controller: profileProvider.read.sexTextController,
                    onPressed: () {},
                    isNumber: true,
                  );
                },
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Text("Edad",
                  style: TextStyle(
                      color: isDarkTheme ? Colors.white : Colors.black)),
              SizedBox(
                height: size.height * 0.007,
              ),
              Consumer(
                builder: (_, ref, __) {
                  return CustomTextField(
                    isValid: true,
                    enableIcon: Icons.check_circle,
                    disableIcon: Icons.close,
                    controller: profileProvider.read.ageTextController,
                    onPressed: () {},
                    isNumber: true,
                  );
                },
              ),

              //Boton Registrase
              SizedBox(
                height: size.height * 0.025,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
