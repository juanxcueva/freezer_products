import 'package:flutter/material.dart';
import 'package:flutter_meedu/flutter_meedu.dart';
import 'package:freezer_products/app/ui/pages/home/controller/home_controller.dart';
import 'package:freezer_products/app/ui/pages/home/widgets/custom_agotado_dialog.dart';
import 'package:freezer_products/app/ui/pages/home/widgets/custom_expiration_dialog.dart';
import 'package:freezer_products/app/ui/pages/home/widgets/custom_puerta_dialog.dart';
import 'package:freezer_products/app/ui/pages/home/widgets/custom_success_dialog.dart';
import 'package:freezer_products/app/ui/pages/home/widgets/no_orders_socket_widget.dart';
import 'package:freezer_products/app/ui/pages/home/widgets/order_socket_data_widget.dart';
import 'package:freezer_products/app/ui/theme/app_colors.dart';

final homeProvider = SimpleProvider((ref) => HomeController());

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final currentTheme = Theme.of(context);
    final isDarkTheme = currentTheme.brightness == Brightness.dark;
    return ProviderListener<HomeController>(
        provider: homeProvider,
        onChange: (context, controller) {
          if (controller.navigate) {
            showDialog(
                barrierDismissible: false,
                context: context,
                builder: (_) => CustomSuccessDialog(
                    description: "¡Producto agregado!",
                    onTap: () async {
                      Navigator.of(context).pop();
                      controller.navigate = false;
                    }, response: controller.responseAux,));
          }
          if (controller.puertaAbierta) {
            showDialog(
                barrierDismissible: false,
                context: context,
                builder: (_) => CustomPuertaAbierDialog(
                    description: "Puerta abierta!",
                    onTap: () async {
                      Navigator.of(context).pop();
                      controller.puertaAbierta = false;
                    },));
          }

          if (controller.expiration) {
            showDialog(
                barrierDismissible: false,
                context: context,
                builder: (_) => CustomAgotadoDialog(
                    description: "¡Producto por expirar!",
                    onTap: () async {
                      Navigator.of(context).pop();
                      controller.puertaAbierta = false;
                    }, response: controller.expirationAux,));
          }

          if (controller.agotado) {
            showDialog(
                barrierDismissible: false,
                context: context,
                builder: (_) => CustomExpirationDialog(
                    description: "¡Producto agotado!",
                    onTap: () async {
                      Navigator.of(context).pop();
                      controller.puertaAbierta = false;
                    }, response: controller.agotadoAux,));
          }
        },
        builder: (_, controller) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Productos en la refrigeradora"),
              backgroundColor: AppColors.grassColor,
            ),
            backgroundColor: Colors.transparent,
            body: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Consumer(
                            builder: (_, ref, __) {
                              final listProducts = ref
                                  .watch(homeProvider
                                      .select((_) => _.listProducts))
                                  .listProducts;
                              return Container(
                                height: size.height * 0.85,
                                child: listProducts.isEmpty
                                    ? const Center(child: NoOrderSocketWidget())
                                    : SizedBox(
                                        height: size.height * 0.75,
                                        child: ListView.builder(
                                          physics: BouncingScrollPhysics(),
                                          scrollDirection: Axis.vertical,
                                          itemBuilder: (_, index) {
                                            return OrderSocketDataWidget(
                                              index: index,
                                              product: listProducts[index],
                                            );
                                          },
                                          itemCount: listProducts.length,
                                        ),
                                      ),
                              );
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
