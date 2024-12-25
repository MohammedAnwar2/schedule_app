// ignore_for_file: must_be_immutable, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:schedule_app/core/constants/themeOfApp/fonts.dart';

class CustomTextForm extends StatelessWidget {
  CustomTextForm(
      {super.key,
      this.controller,
      this.validation,
      this.textInputAction = TextInputAction.done,
      this.readOnly = false,
      this.obscureText = false,
      this.function,
      this.suffixIcon});
  TextEditingController? controller;
  String? Function(String?)? validation;
  final TextInputAction? textInputAction;
  final void Function()? function;
  final bool? readOnly;
  final bool? obscureText;
  final Widget? suffixIcon;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: textInputAction,
      controller: controller,
      cursorHeight: 20.h,
      readOnly: readOnly!,
      obscureText: obscureText!,
      onTap: readOnly == true ? function : null,
      keyboardType: TextInputType.name,
      style: TextStyleFonts.HeadingText,
      validator: validation,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        errorStyle: TextStyle(
          fontSize: 13.0.sp,
        ),
        filled: false, //ture------------------>>
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        fillColor: Theme.of(context).cardColor,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: Theme.of(context).colorScheme.onSecondaryContainer,
              width: 1),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: readOnly == false
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.onSecondaryContainer,
              width: 2),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
