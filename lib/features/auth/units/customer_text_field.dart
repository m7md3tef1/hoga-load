import 'package:flutter/material.dart';

import '../../../core/color_manager/color_manager.dart';

class CustomTextFormField extends StatelessWidget {
  var prefixIcon;
  var suffixIcon;
  String? hintText;
  var keyBoardType;
  var controller;
  var validate;
  var function;
  bool? obs;

  CustomTextFormField({
    super.key,
    this.obs,
    this.prefixIcon,
    this.suffixIcon,
    this.hintText,
    this.controller,
    this.validate,
    this.function,
    this.keyBoardType,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: TextFormField(
        validator: validate,
        controller: controller,
        keyboardType: keyBoardType,
        obscureText: obs != null ? true : false,
        decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(color: ColorManager.yellow, width: 1),
              borderRadius: BorderRadius.circular(12),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: ColorManager.lightGrey,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            hintText: hintText!,
            hintStyle: TextStyle(color: ColorManager.lightGrey)),
      ),
    );
  }
}
