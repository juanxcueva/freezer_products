import 'package:flutter/material.dart';
import 'package:freezer_products/app/ui/global_widgets/custom_button.dart';
import 'package:freezer_products/app/ui/theme/app_colors.dart';

class CustomConfirmDialog extends StatelessWidget {
  const CustomConfirmDialog({
    Key? key,
    required this.description,
    required this.onTap,
  }) : super(key: key);

  final String description;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final sizeBoxwidth = size.width * 0.8;
    final sizeBoxheight = size.height * 0.45;

    final sizeBottomwidth = size.width * 0.3;
    final sizeBottomheight = size.height * 0.07;

    final sizeIcon = size.height * 0.2;
    final sizeBetweenTitleDescription = size.height * 0.01;
    final sizeBetweenDescriptionButton = size.height * 0.06;
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
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.warning,
              size: sizeIcon,
              color: Colors.orange,
            ),
            Text('Confirmar',
                style: Theme.of(context)
                    .textTheme
                    .headline5!
                    .copyWith(fontWeight: FontWeight.bold,
                        color: isDarkTheme ? Colors.white : Colors.black
                    )),
            SizedBox(height: sizeBetweenTitleDescription),
            Text(
              description,
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        color: isDarkTheme ? Colors.white : Colors.black
                
              ),
            ),
            SizedBox(height: sizeBetweenDescriptionButton),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: sizeBottomwidth,
                  height: sizeBottomheight,
                  child: CustomButton(
                    icon: null,
                    label: 'Aceptar',
                    onTap: onTap,
                    color: AppColors.blueBottom,
                  ),
                ),
                SizedBox(
                  width: sizeBottomwidth,
                  height: sizeBottomheight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Cancelar'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
