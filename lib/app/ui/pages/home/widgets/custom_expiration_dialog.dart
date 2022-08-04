import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:freezer_products/app/domain/models/product_model.dart';
import 'package:freezer_products/app/ui/global_widgets/custom_button.dart';

class CustomExpirationDialog extends StatelessWidget {
  const CustomExpirationDialog({
    Key? key,
    required this.description,
    required this.onTap,
    required this.response,
  }) : super(key: key);

  final String description;
  final VoidCallback onTap;
  final ProductoModel response;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final sizeBoxwidth = size.width * 0.8;
    final sizeBoxheight = size.height * 0.45;

    final sizeBottomwidth = size.width * 0.7;
    final sizeBottomheight = size.height * 0.07;

    final sizeIcon = size.height * 0.2;
    final sizeBetweenTitleDescription = size.height * 0.01;
    final sizeBetweenDescriptionButton = size.height * 0.03;
    final currentTheme = Theme.of(context);
    final isDarkTheme = currentTheme.brightness == Brightness.dark;

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        width: sizeBoxwidth,
        height: sizeBoxheight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CachedNetworkImage(
              fit: BoxFit.fill,
              width: size.width * .35,
              height: size.height * .15,
              imageUrl: "${response.proImagen}",
              placeholder: (context, url) => new CircularProgressIndicator(),
              errorWidget: (context, url, error) => new Icon(Icons.error),
            ),
            SizedBox(height: size.height * .02),

            Text(response.proNombre,
                style: Theme.of(context).textTheme.headline5!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: isDarkTheme ? Colors.white : Colors.black)),
            Text("Cantidad: ${response.proCantidad} ${response.proUnidad ?? ""}",
                style: Theme.of(context).textTheme.headline5!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: isDarkTheme ? Colors.white : Colors.black)),
            SizedBox(height: sizeBetweenTitleDescription),
            Text(
              description,
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(color: Colors.red[600]),
            ),

            Icon(
              Icons.warning,
              size: size.height * 0.08,
              color: Colors.orange,
            ),
            SizedBox(
              width: sizeBottomwidth,
              height: sizeBottomheight,
              child: CustomButton(
                icon: null,
                label: 'Aceptar',
                onTap: onTap,
                color: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
