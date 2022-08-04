import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.isValid,
    required this.controller,
    this.onChanged,
    required this.onPressed,
    this.isNumber = false,
    this.isEmail = false,
    this.isPassword = false,
    this.labelText,
    this.enableIcon = Icons.check_circle,
    this.disableIcon = Icons.close,
    this.onTap,
  }) : super(key: key);

  final bool isValid;
  final IconData enableIcon;
  final IconData disableIcon;
  final TextEditingController controller;
  final Function(String)? onChanged;
  final VoidCallback onPressed;
  final bool isNumber;
  final bool isPassword;
  final bool isEmail;
  final String? labelText;
  final Function()? onTap;

  final colorSuccess = Colors.blue;
  final colorError = Colors.red;

  @override
  Widget build(BuildContext context) {
    final currentTheme = Theme.of(context);
    final isDarkTheme = currentTheme.brightness == Brightness.dark;

    return TextField(
      onChanged: onChanged ?? (String value) {},
      controller: controller,
      readOnly: true,
      inputFormatters: isNumber ?[FilteringTextInputFormatter.digitsOnly] : null,
      keyboardType: isNumber ? TextInputType.number : isEmail ? TextInputType.emailAddress :TextInputType.text,
      style: TextStyle(color: isDarkTheme ? Colors.white : Colors.black),
      decoration: InputDecoration(
        labelText: labelText ?? "",
        filled: true,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 17, horizontal: 10),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: colorSuccess,
            width: 1,
          ),
        ),
        suffixIcon: onChanged!=null ?(isPassword
            ? IconButton(
                onPressed: onPressed,
                icon: Icon(
                  isValid ? enableIcon : disableIcon,
                  color: isValid ? colorError : colorSuccess,
                ),
              )
            : Icon(
                isValid ? enableIcon : disableIcon,
                color: isValid ? colorSuccess : colorError,
              )) : null,
      ),
      obscureText: isPassword ? !isValid : false,
      onTap: onTap ?? (){},
    );
  }
}
