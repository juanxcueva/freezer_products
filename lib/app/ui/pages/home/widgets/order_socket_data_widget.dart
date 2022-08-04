import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/flutter_meedu.dart';
import 'package:freezer_products/app/domain/models/product_model.dart';
import 'package:freezer_products/app/domain/response/productsResponse.dart';
import 'package:freezer_products/app/ui/global_widgets/custom_confrm_dialog.dart';
import 'package:freezer_products/app/ui/global_widgets/custom_loading_dialog.dart';
import 'package:freezer_products/app/ui/pages/home/home_page.dart';
import 'package:freezer_products/app/ui/theme/app_colors.dart';

class OrderSocketDataWidget extends StatelessWidget {
  const OrderSocketDataWidget(
      {Key? key, required this.index, required this.product})
      : super(key: key);

  final int index;
  final ProductoModel product;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final currentTheme = Theme.of(context);
    final isDarkTheme = currentTheme.brightness == Brightness.dark;
    return Consumer(
      builder: (_, ref, __) {
        return Column(
          children: [
            Container(
              width: size.width * 0.9,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: (!isDarkTheme ? Colors.white : AppColors.darkColor),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 5,
                    blurRadius: 4,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: size.width * .05,
                  ),
                  CachedNetworkImage(
                    width: size.width * .1,
                    imageUrl: "${product.proImagen}",
                    placeholder: (context, url) =>
                        new CircularProgressIndicator(),
                    errorWidget: (context, url, error) => new Icon(Icons.error),
                  ),
                  // SizedBox(
                  //   width: size.width * .1,
                  //   child: Hero(
                  //     tag: "gas_${product.proId}",
                  //     child: Image(
                  //       // image: AssetImage(listGas[(0) - 1].image),

                  //       image: NetworkImage(product.proImagen),
                  //     ),
                  //   ),
                  // ),
                  SizedBox(
                    width: size.width * .03,
                  ),
                  Container(
                    width: size.width * .6,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: size.height * .015,
                        ),
                        Text(
                          product.proNombre,
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1!
                              .copyWith(
                                  color:
                                      isDarkTheme ? Colors.white : Colors.black,
                                  fontWeight: FontWeight.bold),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                        Text(
                          "Cantidad: ${product.proCantidad.toString()}",
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1!
                              .copyWith(
                                  color: isDarkTheme
                                      ? Colors.white
                                      : Colors.black),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                        Text(
                          product.proFechaVencimiento.toString().split(" ")[0],
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1!
                              .copyWith(
                                  color: isDarkTheme
                                      ? Colors.white
                                      : Colors.black),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                        Text(
                          product.proUbicacion,
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1!
                              .copyWith(
                                  color:
                                      isDarkTheme ? Colors.white : Colors.black,
                                  fontWeight: FontWeight.bold),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                        SizedBox(
                          height: size.height * .015,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: size.width * .02,
                  ),
                  InkWell(
                    onTap: () {
                      showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (_) => CustomConfirmDialog(
                              description:
                                  "Esta seguro de eliminar esta producto?",
                              onTap: () async {
                                showDialog(
                                    barrierDismissible: false,
                                    context: context,
                                    builder: (_) => const CustomLoadingDialog(
                                        title: 'Por favor espere',
                                        description:
                                            'Eliminando producto....'));
                                await homeProvider.read
                                    .deleteProduct(product.proId);
                                Navigator.of(context).pop();
                                Navigator.of(context).pop();
                              }));
                    },
                    child: Container(
                      width: size.width * .06,
                      height: size.height * .05,
                      child: Icon(Icons.delete, color: Colors.red),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: size.height * .025,
            )
          ],
        );
      },
    );
  }
}
