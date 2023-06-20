import 'package:flutter/material.dart';

class CommonTextFiled extends StatelessWidget {
  const CommonTextFiled({
    Key? key,
    this.onTap,
    this.onChanged,
    this.maxLength,
    this.border,
    this.obscureText = false,
    this.keyboardType,
    this.controller,
    this.hintText,
    this.labelText,
    this.counter,
    this.fillColor,
    this.prefixIcon,
    this.suffixIcon,
    this.filled,
    this.validator,
    this.labelStyle,
    this.fontFamily,
    this.hintFontFamily,
  }) : super(key: key);
  final void Function()? onTap;
  final void Function(String)? onChanged;
  final maxLength;
  final InputBorder? border;
  final String? Function(String?)? validator;
  final bool obscureText;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final hintText;
  final labelText;
  final fontFamily;
  final hintFontFamily;
  final counter;
  final fillColor;
  final prefixIcon;
  final suffixIcon;
  final labelStyle;
  final bool? filled;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(fontFamily: fontFamily),
      validator: validator,
      onTap: onTap,
      keyboardType: keyboardType,
      controller: controller,
      maxLength: maxLength,
      obscureText: obscureText,
      onChanged: onChanged,
      decoration: InputDecoration(
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        border: border,
        hintText: hintText,
        hintStyle: TextStyle(fontFamily: hintFontFamily),
        labelText: labelText,
        labelStyle: labelStyle,
        counter: counter,
        filled: filled,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        fillColor: fillColor,
        counterText: "",
      ),
    );
  }
}
