
import 'package:flutter/material.dart';

class NoOrderSocketWidget extends StatelessWidget {
  const NoOrderSocketWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
     final currentTheme = Theme.of(context);
    final isDarkTheme = currentTheme.brightness == Brightness.dark;
    final size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(bottom: size.height * 0.02),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: size.height * .05),
          Icon(Icons.list_alt, size: size.height * .3, color: isDarkTheme ? Colors.white : Colors.black),
          SizedBox(height: size.height * .05),
          Text(
            'No existen productos',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: isDarkTheme ? Colors.white : Colors.black
            ),
          ),
        ],
        
      ),
    );
  }
}