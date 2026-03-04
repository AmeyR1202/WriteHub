import 'package:flutter/material.dart';
import 'package:writehub/core/theme/app_pallete.dart';

class AuthInputField extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  final bool isObscureText;
  const AuthInputField({
    super.key,
    required this.labelText,
    required this.controller,
    this.isObscureText = false,
  });
  static _border([Color color = AppPallete.borderColor]) => OutlineInputBorder(
    borderRadius: BorderRadius.circular(5),
    borderSide: BorderSide(color: color, width: 3),
  );

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(22),
        hintText: labelText,
        hintStyle: TextStyle(fontSize: 16, color: AppPallete.greyColor),
        enabledBorder: _border(),
        focusedBorder: _border(AppPallete.gradient2),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return "$labelText is missing";
        }
        return null;
      },
      obscureText: isObscureText,
    );
  }
}
