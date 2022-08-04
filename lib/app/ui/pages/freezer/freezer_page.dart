import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/flutter_meedu.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';
import 'package:freezer_products/app/ui/global_widgets/custom_button.dart';
import 'package:freezer_products/app/ui/pages/freezer/controller/freezer_controller.dart';
import 'package:freezer_products/app/ui/theme/app_colors.dart';

final freezerProvider = SimpleProvider((ref) => FreezerController());

class FreezerPage extends StatelessWidget {
  const FreezerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Freezer"),
        backgroundColor: AppColors.grassColor,
      ),
      body: SingleChildScrollView(
        child: CupertinoScrollbar(
          child: Column(
            children: [
              Container(
                color: AppColors.blueProfile,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: size.width * 0.4,
                      height: size.height * 0.1,
                      child: Center(
                        child: Text("Congelador",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black)),
                      ),
                    ),
                    Consumer(builder: (_, ref, __) {
                      final congTemp = ref
                          .watch(freezerProvider.select((_) => _.congTemp))
                          .congTemp;
                      return Container(
                        width: size.width * 0.2,
                        child: CupertinoSpinBox(
                          min: -18,
                          max: -1,
                          value: congTemp,
                          spacing: 10,
                          readOnly: true,
                          onChanged: (double e){
                            freezerProvider.read.changeCongelador(e);
                          },
                          direction: Axis.vertical,
                          textStyle: TextStyle(fontSize: 40),
                          incrementIcon: Icon(
                            CupertinoIcons.up_arrow,
                            size: 64,
                            color: Colors.black,
                          ),
                          decrementIcon: Icon(
                            CupertinoIcons.down_arrow,
                            size: 64,
                            color: Colors.black,
                          ),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: CupertinoDynamicColor.withBrightness(
                              color: CupertinoColors.white,
                              darkColor: CupertinoColors.black,
                            ),
                            border: Border.all(
                              color: CupertinoDynamicColor.withBrightness(
                                color: Color(0x33000000),
                                darkColor: Color(0x33FFFFFF),
                              ),
                              style: BorderStyle.solid,
                              width: 0.0,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          ),
                        ),
                      );
                    }),
                    Consumer(builder: (_, ref, __) {
                      final refTemp = ref
                          .watch(freezerProvider.select((_) => _.refTempAux))
                          .refTempAux;
                      final congTemp = ref
                          .watch(freezerProvider.select((_) => _.congTempAux))
                          .congTempAux;
                      return Container(
                          width: size.width * 0.3,
                          height: size.height * 0.1,
                          child: CustomButton(
                              label: "Aceptar",
                              onTap: () {
                                freezerProvider.read
                                    .editFreezer(1, refTemp, congTemp);
                              },
                              icon: null));
                    }),
                  ],
                ),
              ),
              Container(
                color: AppColors.waterColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: size.width * 0.4,
                      height: size.height * 0.1,
                      child: Center(
                        child: Text("Refrigerador",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black)),
                      ),
                    ),
                    Consumer(builder: (_, ref, __) {
                      final refTemp = ref
                          .watch(freezerProvider.select((_) => _.refTemp))
                          .refTemp;
                      return Container(
                        width: size.width * 0.2,
                        child: CupertinoSpinBox(
                          min: 3,
                          max: 5,
                          readOnly: true,
                          value: refTemp,
                          onChanged: (double e){
                            freezerProvider.read.changeRefrigerador(e);
                          },
                          spacing: 10,
                          direction: Axis.vertical,
                          textStyle: TextStyle(fontSize: 40),
                          incrementIcon: Icon(
                            CupertinoIcons.up_arrow,
                            size: 64,
                            color: Colors.black,
                          ),
                          decrementIcon: Icon(
                            CupertinoIcons.down_arrow,
                            size: 64,
                            color: Colors.black,
                          ),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: CupertinoDynamicColor.withBrightness(
                              color: CupertinoColors.white,
                              darkColor: CupertinoColors.black,
                            ),
                            border: Border.all(
                              color: CupertinoDynamicColor.withBrightness(
                                color: Color(0x33000000),
                                darkColor: Color(0x33FFFFFF),
                              ),
                              style: BorderStyle.solid,
                              width: 0.0,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          ),
                        ),
                      );
                    }),
                    Consumer(builder: (_, ref, __) {
                      final refTemp = ref
                          .watch(freezerProvider.select((_) => _.refTempAux))
                          .refTempAux;
                      final congTemp = ref
                          .watch(freezerProvider.select((_) => _.congTempAux))
                          .congTempAux;
                      return Container(
                          width: size.width * 0.3,
                          height: size.height * 0.1,
                          child: CustomButton(
                              label: "Aceptar",
                              onTap: () {
                                freezerProvider.read
                                    .editFreezer(1, refTemp, congTemp);
                              },
                              icon: null));
                    }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
